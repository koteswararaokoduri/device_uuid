import Flutter
import UIKit

public class SwiftDeviceUuidPlugin: NSObject, FlutterPlugin {
weak var weakSelf = self
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_uuid", binaryMessenger: registrar.messenger())
    let instance = SwiftDeviceUuidPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getPlatformVersion") {
        result("iOS " + UIDevice.current.systemVersion)
    }else if (call.method == "getDeviceUUID") {
       let strNative = weakSelf?.uuid()
       result(strNative)
    }
  }
}
