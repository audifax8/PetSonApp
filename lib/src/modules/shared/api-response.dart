import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiResponse<T> {
  int status;
  List data;
  int totalItems;
  List errors;

  ApiResponse.fromJson(Map<String, dynamic> jsonData) {
    status = jsonData['status'] as int;
    data = jsonData['data'] as List;
    totalItems = jsonData['totalItems'] as int;
    errors = jsonData['errors'] as List;
  }

  static Future loadData (url) async {
    http.Response response = await http.get(url);
    String _content = response.body;
    var _res = json.decode(_content);
    return new ApiResponse.fromJson(_res);
  }

}