import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        // Register the method channel
        setupMethodChannel()


        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func setupMethodChannel() {
       let channel = FlutterMethodChannel(
         name: "channel",
         binaryMessenger: window.rootViewController as! FlutterViewController as! FlutterBinaryMessenger
       )

       channel.setMethodCallHandler { [weak self] (call, result) in
         switch call.method {
         case "getOsVersion":
           self?.getIOSVersion(result: result)
         default:
           result(FlutterMethodNotImplemented)
         }
       }
     }

     private func getIOSVersion(result: FlutterResult) {
       let systemVersion = UIDevice.current.systemVersion
       result(systemVersion)
     }
}
