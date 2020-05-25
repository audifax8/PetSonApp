import 'package:pet_son_app/src/modules/shared/api-response.dart';
import 'package:pet_son_app/src/modules/team-member/model.dart';
import 'package:pet_son_app/src/modules/team-member/service.dart';

class TeamMemberBLoC {
  Stream<List<TeamMember>> get teamMembers async* {
    ApiResponse _response = await TeamMemberService.loadData();
    List<TeamMember> _teamMembers = TeamMember.mapFromApiResponse(_response);
    yield _teamMembers;
  }
}