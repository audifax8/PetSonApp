import 'dart:async';
import 'dart:io';
import 'package:pet_son_app/src/modules/shared/api-response.dart';
import 'package:rxdart/subjects.dart';

import './model.dart';
import './service.dart';

class PetBLoC {

  final _petController = StreamController<List<Pet>>();

  final _isLoadingController = StreamController<bool>();

  final _totalItemsController = StreamController<int>();

  final _message = BehaviorSubject<String>();

  List<Pet> _petsQueried = [];

  PetBLoC() {
    loadInitialData();
  }

  Stream<List<Pet>> get petsStream => _petController.stream;

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  Stream<int> get totalItemsStream => _totalItemsController.stream;

  Stream<String> get messageStream => _message.stream;

  void submitQuery(String query) async {
    _isLoadingController.sink.add(true);
    try
    {
      ApiResponse _response = await PetService.loadData(query);
      List<Pet> _pets = Pet.mapFromApiResponse(_response);
      _petsQueried = new List<Pet>.from(_petsQueried)..addAll(_pets);
      _petController.sink.add(_petsQueried);
      _totalItemsController.sink.add(_response.totalItems);
      if (_response.totalItems == 0) {
        _message.add('No hay mascotas por mostrar');
      }
    } on SocketException catch (ex) {
      _message.add('No hay conección a internet.');
    } catch (ex) {
      _message.add('Ocurrió un error inesperado.');
    }
    _isLoadingController.sink.add(false);
  }

  void loadInitialData() async {
    _petsQueried = [];
    _petController.sink.add(_petsQueried);
    _isLoadingController.sink.add(false);
    _totalItemsController.sink.add(0);
    _message.sink.add(null);
  }

  void dispose() {
    _petController.close();
    _isLoadingController.close();
    _totalItemsController.close();
    _message.close();
  }

  void setErrorMessage(String message) {
    _message.add(message);
  }

}
