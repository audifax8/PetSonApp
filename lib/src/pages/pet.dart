import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getflutter/getflutter.dart';

import 'package:flutter/material.dart';
import 'package:pet_son_app/src/modules/pet-type/bloc.dart';
import 'package:pet_son_app/src/modules/pet-type/model.dart';

import '../components/menu.dart';
import '../components/menu_icon.dart';
import '../modules/pet/bloc.dart';
import '../modules/pet/model.dart';

import '../components/pet-adopted-card.dart';
import '../components/pet-pending-card.dart';

class PetPage extends StatefulWidget {
  final bool adopted;
  @override
  createState() => _PetState();
  const PetPage ({ Key key, this.adopted }): super(key: key);
}

class _PetState extends State<PetPage> {

  bool _adopted;
  bool _isLoading;
  int _limit;
  int _page;
  int _totalItemsCount;
  String _petTypeSelected;

  String _error;
  final PetBLoC _block = PetBLoC();
  final PetTypeBLoC _petTypeBLoC = PetTypeBLoC();
  List<PetType> _petTypes;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _petTypeBLoC.submitQuery('').then((petTypes) => _petTypes = petTypes);
    _adopted = widget.adopted;
    loadInitialState('');

    _block.isLoadingStream.listen((value) {
      _isLoading = value;
      setState(() {});
    });

    _block.totalItemsStream.listen((value) {
      _totalItemsCount = value;
      setState(() {});
    });

    _block.messageStream.listen((value) {
      _error = value;
      setState(() {});
    });

    _scrollController.addListener(() {
      if (
        _scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent
      ) {
        if (!_isLoading) {
          int _shouldSearch = _limit * (_page + 1);
          if (_shouldSearch <=  _totalItemsCount) {
            _page++;
            _isLoading = true;
            _block.submitQuery(getQueryParams());
            moveScrollDown();
            setState(() {});
          } else {
            _showToast('No hay más mascotas por cargar');
          }
        }
      }
    });
  }

  void loadInitialState(String petTypeSelected) async {
    _isLoading = false;
    _limit = 10;
    _page = 1;
    _totalItemsCount = 0;
    _petTypeSelected = petTypeSelected;
    _block.loadInitialData();
    _block.submitQuery(getQueryParams());
  }

  String getQueryParams () {
    // String _date = new DateTime.now().toIso8601String();
    // return 'adopted=$_adopted&page=$_page&limit=$_limit&creationDate=$_date';
    String petTypeSelected = (_petTypeSelected != '' && _petTypeSelected != null) ? 'petType=$_petTypeSelected' : '';
    String url = 'adopted=$_adopted&page=$_page&limit=$_limit&$petTypeSelected';
    print(url);
    return url;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuIcon(),
        title: Text('Mascotas'),
      ),
      drawer: Menu(),
      body: Stack(
        children: <Widget>[
          _showPetsList(),
          _showError(),
          _showLoader(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openSearchModal(context),
        tooltip: 'Buscar',
        child: Icon(Icons.search),
      )
    );
  }

  void _openSearchModal(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(width);
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Center( child: Text('Seleccione el tipo de mascota.'),),
          content: Container(
            height: 200.0,
            width: 200.0,
            child: _drawPetTypes(),
          ),
          actions: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.clear),
              onPressed: () {
                loadInitialState('');
                Navigator.of(context).pop();
              }
            ),
            /*FloatingActionButton(
              child: Text('Buscar.'),
              onPressed: () {
                loadInitialState(_petTypeSelected);
                Navigator.of(context).pop();
              },
            )*/
          ],
        );
      }
    );
  }

  Widget _drawPetTypes() {
    return ListView.separated(
      itemCount: _petTypes?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        PetType _petType = _petTypes[index];
        return Container(
          color: (_petTypeSelected == _petType.id) ? Colors.blue : null,
          //color: Colors.blue,
          child: ListTile(
            title: Text(
              _petType.name,
              style: TextStyle(color: (_petTypeSelected == _petType.id) ? Colors.white : Colors.black),
            ),
            leading: GFAvatar(
              backgroundImage: NetworkImage(_petType.avatar),
            ),
            onTap: () {
              loadInitialState(_petType.id);
              Navigator.of(context).pop();
            }
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    Fluttertoast.cancel();
  }

  Future animateRestarScreen() async {
    loadInitialState('');
    return Future.delayed(new Duration(seconds: 1));
  }

  void moveScrollDown () {
   _scrollController.animateTo(
      _scrollController.position.pixels + 30,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
  }

  Widget _showPetsList() {
    return StreamBuilder(
      stream: _block.petsStream,
      builder: (BuildContext context, AsyncSnapshot<List<Pet>> snapshot) {
        if (snapshot.data == null) return Column();
        return RefreshIndicator(
          onRefresh: animateRestarScreen,
          child: ListView.separated(
            controller: _scrollController,
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              Pet pet = snapshot.data[index];
              return Center(
                child: (_adopted) ? drawPetAdopted(pet) : drawPetPending(pet),
              );
            },
            separatorBuilder: (context, index) => Divider(),
          ),
        );
      },
    );
  }

  Widget _showLoader() {
    return _isLoading ?
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      )
      : Container();
  }

   Widget _showError() {
    return _error != null ?
      RefreshIndicator(
          onRefresh: animateRestarScreen,
          child: Center(child: Text(_error, style: TextStyle(fontSize: 20)))
      )
      : Container();
  }

}
