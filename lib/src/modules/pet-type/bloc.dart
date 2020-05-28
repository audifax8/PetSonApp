import 'dart:async';
import 'package:pet_son_app/src/modules/shared/api-response.dart';

import './model.dart';
import './service.dart';

class PetTypeBLoC {

  Future<List<PetType>> submitQuery(String query) async {
    ApiResponse _response = await PetTypeService.loadData(query);
    return PetType.mapFromApiResponse(_response);
  }

}
