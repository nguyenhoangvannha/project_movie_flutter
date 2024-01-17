import 'dart:ui';

import 'package:flutter/material.dart';

enum DeviceType { PHONE, TABLET }

enum DisplayResolution {
  //Type - Width - Height - Ratio
  HD, //1280	720 1.75
  FHD, //1920	1080 2.625
  QHD, //2560	1440 3.5
}

class DeviceInfo {
  static DeviceType _deviceType;
  static DisplayResolution _displayResolution;

  static DeviceType deviceType(BuildContext context) {
    if (_deviceType == null) {
      final mediaQueryData = MediaQuery.of(context);
      _deviceType = mediaQueryData.size.shortestSide > 600.0
          ? DeviceType.TABLET
          : DeviceType.PHONE;
      print("${_deviceType.toString()} : ${mediaQueryData.size.shortestSide}");
    }
    return _deviceType;
  }

  static bool isTablet(BuildContext context) {
    return deviceType(context) == DeviceType.TABLET;
  }

  static DisplayResolution displayResolution() {
    if (_displayResolution == null) {
      final devicePixelRatio = window.devicePixelRatio;
      if (devicePixelRatio <= 2.0) {
        _displayResolution = DisplayResolution.HD;
      } else if (devicePixelRatio < 2.7) {
        _displayResolution = DisplayResolution.FHD;
      } else if (devicePixelRatio < 3.7) {
        _displayResolution = DisplayResolution.QHD;
      } else {
        _displayResolution = DisplayResolution.QHD;
      }
    }
    print("${_displayResolution.toString()} : ${window.devicePixelRatio}");
    return _displayResolution;
  }
}
