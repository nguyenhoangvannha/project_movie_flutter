import 'dart:async';

import 'package:chopper/chopper.dart';

import '../../../component/api_config.dart';

class NetworkInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    return request.copyWith(
      parameters: {
        ...request.parameters,
        'api_key': ApiConfig.API_KEY,
      }
    );
  }
}
