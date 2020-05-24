import 'dart:async';
import 'package:pet_son_app/src/modules/shared/api-response.dart';
import 'package:pet_son_app/src/modules/shared/pagination.dart';

import './model.dart';
import './service.dart';

class TestBLoC {

  final String _moduleUrl = 'pet/?';

  bool _adopted;

  final _isLoadingController = StreamController<bool>();

  final _petController = StreamController<List<Pet>>();

  Stream<List<Pet>> get petsStream => _petController.stream;

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  List<Pet> _petsQueried;

  Pagination _pagination;

  TestBLoC(Pagination pagination, bool adopted) {
    _pagination = pagination;
    _petsQueried = [];
    _isLoadingController.sink.add(false);
    _adopted = adopted;
  }

  void searchData(String apiBaseUrl) async {
    _pagination.incrementPage();
    _isLoadingController.sink.add(true);
    await Future.delayed(new Duration(seconds: 2));
    ApiResponse _response = await PetService.loadData(getUrl(apiBaseUrl));
    _pagination.setTotalItemCount(_response.totalItems);
    List<Pet> _pets = Pet.mapFromApiResponse(_response);
    _petsQueried = new List<Pet>.from(_petsQueried)..addAll(_pets);
    _petController.sink.add(_petsQueried);
    _isLoadingController.sink.add(false);
  }

  void loadInitialData(String apiBaseUrl) async {
    _isLoadingController.sink.add(true);
    await Future.delayed(new Duration(seconds: 2));
    ApiResponse _response = await PetService.loadData(getUrl(apiBaseUrl));
    _pagination.setTotalItemCount(_response.totalItems);
    List<Pet> _pets = Pet.mapFromApiResponse(_response);
    _petsQueried = new List<Pet>.from(_petsQueried)..addAll(_pets);
    _petController.sink.add(_petsQueried);
    _isLoadingController.sink.add(false);
  }

  void dispose() {
    _isLoadingController.close();
    _petController.close();
  }

  String getQueryParams () {
    return '&adopted=$_adopted&';
  }

  String getUrl(apiBaseUrl) {
    String url = '${apiBaseUrl + _moduleUrl + getQueryParams() + _pagination.getPaginationQueryParams()}';
    print(url);
    return url;
  }

}
