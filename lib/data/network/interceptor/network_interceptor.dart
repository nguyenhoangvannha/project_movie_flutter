import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:connectivity/connectivity.dart';
import 'package:project_movie/data/network/exception/network_connect_exception.dart';

class NetworkInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw NetworkConnectException();
    }
//    final isMobile = connectivityResult == ConnectivityResult.mobile;
//    final isLargeFile = request.url.contains(RegExp(r'(/large|/video)'));
//    if(isMobile && isLargeFile){
//      throw MobileDataCostException();
//    }
    return request;
  }
}
