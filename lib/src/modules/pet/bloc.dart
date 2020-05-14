import 'dart:async';
import './model.dart';
import './service.dart';


class PetBLoC {

  final _petController = StreamController<List<Pet>>();

  Stream<List<Pet>> get petsStream => _petController.stream;

  void submitQuery(String query) async {
    List<Pet> _pets = await PetService.loadData(query);
    _petController.sink.add(_pets);
  }

  void dispose() {
    _petController.close();
  }
}
