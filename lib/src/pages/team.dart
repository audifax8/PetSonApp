import 'package:flutter/material.dart';
import 'package:pet_son_app/src/modules/team/bloc.dart';
import 'package:pet_son_app/src/modules/team/model.dart';

import '../components/menu.dart';
import '../components/menu_icon.dart';

class Team extends StatelessWidget {

  final TeamMemberBLoC _block = TeamMemberBLoC();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuIcon(),
        title: Text('Equipo PetSon'),
      ),
      drawer: Menu(),
      body: StreamBuilder(
        stream: _block.teamMembers,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<TeamMember> teamMembers = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return ListView.separated(
                itemCount: teamMembers?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  TeamMember _teamMember = teamMembers[index];
                  return ListTile(
                    title: Text(_teamMember.name),
                    subtitle: Text(_teamMember.description),
                    leading: CircleAvatar(),
                    onTap: () {},
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              );
            default:
                return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _drawTeamMembers(TeamMember temamMember) {
    print(temamMember);
    return ListTile(
      title: Text(
        temamMember.name
      ),
      subtitle: Text(
        temamMember.description
      ),
    );
  }
}
/*
 Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Equipo", style: TextStyle(fontSize: 40)),
          ]
        )
      )
 */