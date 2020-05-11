class ApiResponse {
  String status;
  String data;
  String totalItems;
  String errors;

  ApiResponse.fromJson(Map<String, dynamic> jsonData) {
    status = jsonData['status'];
    data = jsonData['data'];
    totalItems = jsonData['totalItems'];
    errors = jsonData['errors'];
    print(data);
  }
}