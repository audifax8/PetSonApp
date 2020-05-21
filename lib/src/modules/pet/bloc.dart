import 'dart:async';
import 'package:pet_son_app/src/modules/shared/api-response.dart';

import './model.dart';
import './service.dart';

class PetBLoC {

  final _petController = StreamController<List<Pet>>();

  int totalCountController = 0;

  List<Pet> _petsQueried = [];

  Stream<List<Pet>> get petsStream => _petController.stream;

  void submitQuery(String query) async {
    ApiResponse _response = await PetService.loadData(query);
    List<Pet> _pets = Pet.mapFromApiResponse(_response);
    _petsQueried = new List<Pet>.from(_petsQueried)..addAll(_pets);
    _petController.sink.add(_petsQueried);
    totalCountController = _response.totalItems;
  }

  void loadInitialData() async {
    _petsQueried = [];
    totalCountController = 0;
    _petController.sink.add(_petsQueried);
  }

  void dispose() {
    _petController.close();
  }

}
