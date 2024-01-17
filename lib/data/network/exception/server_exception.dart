class ServerException implements Exception {
  int? httpStatusCode;
  int? statusCode;
  String? statusMessage;

  ServerException(
      {required this.httpStatusCode, this.statusCode, this.statusMessage});

  ServerException.fromJson(
      {required int httpStatusCode, required Map<String, dynamic> errorBody}) {
    this.httpStatusCode = httpStatusCode;
    statusCode = errorBody['status_code'];
    statusMessage = errorBody['status_message'];
  }
}
