import 'package:flutter/material.dart';
import 'package:pet_son_app/src/modules/shared/data-observer.dart';

import '../components/menu.dart';
import '../components/menu_icon.dart';
import '../modules/pet/bloc.dart';

class PetPage extends StatelessWidget {

  bool _adopted = false;

  PetPage(bool adopted){
    this._adopted = adopted;
  }

  @override
  Widget build(BuildContext context) {

    final PetBLoC _block = PetBLoC();
    _block.submitQuery('adopted=$_adopted');

    return Scaffold(
      appBar: AppBar(
        leading: MenuIcon(),
        title: Text('Mascotas'),
      ),
      drawer: Menu(),
      body: DataObserver(
        dataToObserve: _block.petsStream,
        onSuccess: (context, data) {
          if (data.length != 0) {
            return ListView.separated(
              itemCount: data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                // Pet  = data[index];
                return Center(
                  child: Text('@here'),
                );
              },
              separatorBuilder: (context, index) => Divider(),
            );
          }
          return Center(
            child: Text('No se encontraron resultados.'),
          );
        },
      )
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