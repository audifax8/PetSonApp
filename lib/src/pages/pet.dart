import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_son_app/src/modules/shared/data-observer.dart';

import '../components/menu.dart';
import '../components/menu_icon.dart';
import '../modules/pet/bloc.dart';
import '../modules/pet/model.dart';


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

  ScrollController _scrollController = new ScrollController();

  final PetBLoC _block = PetBLoC();

  int get totalItemsCount => _block.totalCountController;

  @override
  void initState() {
    super.initState();
    _adopted = widget.adopted;
    loadInitialState();

    _scrollController.addListener(() {
      if (
        _scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent
      ) {
        if (!_isLoading) {
          int _shouldSearch = _limit * (_page + 1);
          if (_shouldSearch <=  totalItemsCount) {
            _page++;
            _isLoading = true;
            _block.submitQuery(getQueryParams());
            moveScrollDown();
            setState(() {});
          }
        }
      }
    });
  }

  void loadInitialState() {
    _isLoading = false;
    _limit = 10;
    _page = 1;
    _block.loadInitialData();
    _block.submitQuery(getQueryParams());
  }

  String getQueryParams () {
    String _date = new DateTime.now().toIso8601String();
    // return 'adopted=$_adopted&page=$_page&limit=$_limit&creationDate=$_date';
    return 'adopted=$_adopted&page=$_page&limit=$_limit';
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: MenuIcon(),
        title: Text(totalItemsCount.toString()),
      ),
      drawer: Menu(),
      body: Stack(
        children: <Widget>[
          DataObserver(
            dataToObserve: _block.petsStream,
            onSuccess: (context, data) {
              _isLoading = false;
              if (data.length != 0) {
                return RefreshIndicator(
                  onRefresh: animateRestarScreen,
                  child: ListView.separated(
                  controller: _scrollController,
                  itemCount: data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    Pet pet = data[index];
                    return Center(
                      child: _drawPet(pet),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  )
                );
              }
              return Center(
                child: Text('No se encontraron resultados.'),
              );
            },
          ),
          // _showLoader()
        ],
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future animateRestarScreen() async {
    loadInitialState();
    return Future.delayed(new Duration(seconds: 2));
  }

  void moveScrollDown () {
   _scrollController.animateTo(
      _scrollController.position.pixels + 30,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
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

  Widget _drawPet(Pet pet) {
    return ListTile(
      title: Text(
        pet.name
      ),
      subtitle: Text(
        pet.description
      ),
      leading: CircleAvatar(),
      onTap: () {},
    );
  }

  Widget _drawTeamMember(temamMember) {
    print(temamMember);
    return ListTile(
      title: Text(
        temamMember.name
      ),
      subtitle: Text(
        temamMember.description
      ),
      leading: CircleAvatar(),
      onTap: () {},
    );
  }
}