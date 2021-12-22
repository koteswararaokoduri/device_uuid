import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_uuid/device_uuid.dart';

void main() {
  const MethodChannel channel = MethodChannel('device_uuid');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DeviceUuid.platformVersion, '42');
  });
}
