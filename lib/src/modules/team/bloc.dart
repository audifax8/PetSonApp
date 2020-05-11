import 'package:pet_son_app/src/modules/team/model.dart';
import 'package:pet_son_app/src/modules/team/service.dart';

class TeamMemberBLoC {
  Stream<List<TeamMember>> get teamMembers async* {
    yield await TeamMemberService.loadData();
  }
}