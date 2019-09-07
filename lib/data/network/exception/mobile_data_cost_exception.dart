class MobileDataCostException implements Exception {
  final message =
      'Download large file on a mobile data connection may incur costs';

  @override
  String toString() {
    // TODO: implement toString
    return message;
  }
}
