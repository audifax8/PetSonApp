import 'package:flutter/material.dart';
import 'package:pet_son_app/src/modules/team-member/bloc.dart';
import 'package:pet_son_app/src/modules/team-member/model.dart';

import '../components/menu.dart';
import '../components/menu_icon.dart';

import '../modules/shared/data-observer.dart';

import '../components/team-member-card.dart';

class TeamMemberPage extends StatelessWidget {

  final TeamMemberBLoC _block = TeamMemberBLoC();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuIcon(),
        title: Text('Equipo PetSon'),
      ),
      drawer: Menu(),
      body: DataObserver(
        dataToObserve: _block.teamMembers,
        onSuccess: (context, data) {
          if (data.length != 0) {
            return ListView.separated(
              itemCount: data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                TeamMember _teamMember = data[index];
                return drawTeamMember(_teamMember);
              },
              separatorBuilder: (context, index) => Divider(),
            );
          }
          return Center(
            child: Text('No se encontraron resultados.', style: TextStyle(fontSize: 20)),
          );
        },
      )
    );
  }
}
