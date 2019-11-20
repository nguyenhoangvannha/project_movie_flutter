import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:project_movie_flutter/data/network/exception/server_exception.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';

class ExceptionHandler {
  static String handle(BuildContext context, Exception ex) {
    String message;
    AppLocalizations translator = AppLocalizations.of(context);
    if (ex is ServerException) {
      message = ex.statusMessage;
    } else if (ex is SocketException) {
      message = translator.translate('msg_no_internet');
    } else if (ex is TimeoutException) {
      message = translator.translate('msg_timeout');
    } else
      message = ex.toString();
    return message;
  }
}
