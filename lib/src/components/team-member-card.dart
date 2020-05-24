import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:pet_son_app/src/modules/team-member/model.dart';

Widget drawTeamMember(TeamMember teamMember) {
  return ListTile(
    title: Text(
      teamMember.name
    ),
    subtitle: Text(
      teamMember.description
    ),
    leading: GFAvatar(
      backgroundImage: NetworkImage(teamMember.avatar),
    ),
    onTap: () {},
  );
}