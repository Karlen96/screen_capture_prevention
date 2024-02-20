import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private let SCREEN_ACTIONS_CHANNEL = "screen.actions"
  private let field = UITextField()

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let screenActionsChannel = FlutterMethodChannel(
        name: SCREEN_ACTIONS_CHANNEL,
        binaryMessenger: controller.binaryMessenger)

    // add Layer for secure content
    let view = UIView(frame: CGRect(x: 0, y: 0, width: self.field.frame.self.width, height: self.field.frame.self.height))
    window.addSubview(self.field)
    window.layer.superlayer?.addSublayer(field.layer)
    field.layer.sublayers?.last?.addSublayer(window.layer)
    self.field.leftView = view
    self.field.leftViewMode = .always
    // add Layer for secure content end

    screenActionsChannel.setMethodCallHandler({
      (call: FlutterMethodCall,
       result: @escaping FlutterResult) -> Void in
       switch call.method {
        case "makeSecure":
              self.field.isSecureTextEntry = true
              result(true)
        case "disableSecure":
              self.field.isSecureTextEntry = false
              result(true)
        default:
           result(FlutterMethodNotImplemented)
       }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

