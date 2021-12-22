import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_uuid/device_uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _deviceUUID = '';

  @override
  void initState() {
    super.initState();
    getDeviceUUID();
  }

  //method for getting device uuid
  Future<void> getDeviceUUID()async{
    String deviceUUID;
    try {
      deviceUUID =
          await DeviceUuid.deviceUUID ?? 'Unknown uuid';
    } on PlatformException {
      deviceUUID = 'Failed to get uuid.';
    }

    // If the widget was removed from the tree while the asynchronous device uuid
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _deviceUUID = deviceUUID;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Device UUID: $_deviceUUID'),
        ),
      ),
    );
  }
}
