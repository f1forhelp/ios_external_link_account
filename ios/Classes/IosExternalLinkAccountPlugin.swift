import Flutter
import UIKit
import StoreKit

public class IosExternalLinkAccountPlugin: NSObject, FlutterPlugin {
   
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ios_external_link_account", binaryMessenger: registrar.messenger())
    let instance = IosExternalLinkAccountPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
    


    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if(call.method == "getPlatformVersion"){
          result("iOS " + UIDevice.current.systemVersion)
      }
        else if(call.method == "canMakePayments"){
             result(SKPaymentQueue.canMakePayments())
      }
        else if(call.method == "canOpen"){
          if #available(iOS 16.0, *) {
              DispatchQueue.main.async{
                  Task {
                      var b = await  ExternalLinkAccount.canOpen
                      result(b)
                  }
     
              }
          } else {
               result(false)
              // Fallback on earlier versions
          }

      }else if(call.method == "open"){
        
          if #available(iOS 16.0, *) {
              DispatchQueue.main.async{
                  Task {
                      do{
                          try await ExternalLinkAccount.open()
                          result(true)
                      }catch{
                          result(false)
                      }
                  }
     
              }
          } else {
               result(false)
              // Fallback on earlier versions
          }
      }//
   
  }
    
}
