import 'package:flutter/material.dart';
import 'package:pet_son_app/src/modules/team/bloc.dart';
import 'package:pet_son_app/src/modules/team/model.dart';

import '../components/menu.dart';
import '../components/menu_icon.dart';

import '../modules/shared/data-observer.dart';

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
                return _drawTeamMember(_teamMember);
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

  Widget _drawTeamMember(TeamMember temamMember) {
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
