import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pet_son_app/app_config.dart';

import '../modules/shared/pagination.dart';

import '../components/menu.dart';
import '../components/menu_icon.dart';
import '../modules/pet/bloc.dart';
import '../modules/pet/block-test.dart';
import '../modules/pet/model.dart';


class TestPage extends StatefulWidget {
  final bool adopted;
  @override
  createState() => _PetState();
  const TestPage ({ Key key, this.adopted }): super(key: key);
}

class _PetState extends State<TestPage> {

  AppConfig _config;
  Pagination _pagination;

  bool _adopted;
  // final PetBLoC _block = PetBLoC();

  TestBLoC _testBlock;

  ScrollController _scrollController = new ScrollController();

  _PetState() {
  }

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
        _testBlock.searchData(_config.apiBaseUrl);
      }
    });
  }

  void loadInitialState() {
    _pagination = Pagination();
     _testBlock = TestBLoC(_pagination, _adopted);
  }

  @override
  Widget build(BuildContext context) {

    _config = AppConfig.of(context);
    _testBlock.loadInitialData(_config.apiBaseUrl);

    return Scaffold(
      appBar: AppBar(
        leading: MenuIcon(),
        title: Text('Mascotas'),
      ),
      drawer: Menu(),
      body: Stack(
        children: <Widget>[
          displayList(),
          /*StreamBuilder(),*/
          showLoaderData(),
        ],
      )
    );
  }

  Widget displayList() {
    return RefreshIndicator(
      onRefresh: animateRestarScreen,
      child: StreamBuilder(
        stream: _testBlock.petsStream,
        builder: (BuildContext context, AsyncSnapshot<List<Pet>> snapshot) {
          if (snapshot.data == null) return Container();
          return ListView.separated(
                  controller: _scrollController,
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    print(snapshot);
                    if(snapshot.data.length == 0) {
                      return Center(
                        child: Text('No hay mascotas por mostrar'),
                      );
                    }
                    Pet pet = snapshot.data[index];
                    return Center(
                      child: _drawPet(pet),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                );
        }
      ),
    );
  }

  Widget showLoaderData() {
    return StreamBuilder(
            stream: _testBlock.isLoadingStream,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.data == null) return Container();
              return ((!snapshot.data) || (snapshot.data == null)) ? Container() :
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
                );
            }
          );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future animateRestarScreen() async {
    loadInitialState();
    _testBlock.loadInitialData(_config.apiBaseUrl);
    return Future.delayed(new Duration(seconds: 1));
  }

  void moveScrollDown () {
   _scrollController.animateTo(
      _scrollController.position.pixels + 30,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
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

}