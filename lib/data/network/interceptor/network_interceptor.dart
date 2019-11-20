import 'dart:async';

import 'package:chopper/chopper.dart';

class NetworkInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {

//    final isMobile = connectivityResult == ConnectivityResult.mobile;
//    final isLargeFile = request.url.contains(RegExp(r'(/large|/video)'));
//    if(isMobile && isLargeFile){
//      throw MobileDataCostException();
//    }
    return request;
  }
}
