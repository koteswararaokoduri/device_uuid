
import 'dart:async';

import 'package:flutter/services.dart';

class DeviceUuid {
  static const MethodChannel _channel = MethodChannel('device_uuid');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> get deviceUUID async {
    final String? version = await _channel.invokeMethod('getDeviceUUID');
    return version;
  }
}
