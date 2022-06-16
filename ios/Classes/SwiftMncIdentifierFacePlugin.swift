import Flutter
import UIKit
import MNCFaceIdentifier

public class SwiftMncIdentifierFacePlugin: NSObject, FlutterPlugin, MNCFaceIdentifierDelegate {
  var result :FlutterResult?


  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mnc_identifier_face", binaryMessenger: registrar.messenger())
    let instance = SwiftMncIdentifierFacePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    self.result = result

    if call.method == "startLivenessDetection" {
      let viewController = UIApplication.shared.keyWindow?.rootViewController

      if viewController != nil {
            let client = MNCFaceIdentifierClient()
        client.delegate = self
        client.showFaceIdentifier(viewController!)
      } else {
        result(FlutterError(code: "Unexpected nil", message: "Mnc-identifier-face: Could not retrieve rootViewController", details: "Expected rootViewController to be not nil"))
      }
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  public func faceIdentifierResult(_ faceResult: MNCFaceIdentifierResult) {
      if let result = self.result {
            if faceResult != nil {
            result(faceResult.asJson())
          } else {
            result(FlutterError(code: "Unexpected nil", message: "Mnc-identifier-face: Could not retrieve face result", details: "Expected face result shouldn't be nil"))
          }
         }
  }
}
