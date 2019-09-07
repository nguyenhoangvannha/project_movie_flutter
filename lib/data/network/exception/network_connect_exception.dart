class NetworkConnectException implements Exception {
  final String message = 'No internet connection';

  @override
  String toString() {
    return message;
  }
}
