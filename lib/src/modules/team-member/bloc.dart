import 'package:pet_son_app/src/modules/team-member/model.dart';
import 'package:pet_son_app/src/modules/team-member/service.dart';

class TeamMemberBLoC {
  Stream<List<TeamMember>> get teamMembers async* {
    yield await TeamMemberService.loadData();
  }
}