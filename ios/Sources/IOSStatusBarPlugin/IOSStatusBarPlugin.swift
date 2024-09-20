import Foundation
import Capacitor
import UIKit
/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(IOSStatusBarPlugin)
public class IOSStatusBarPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "IOSStatusBarPlugin"
    public let jsName = "IOSStatusBar"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "setStatusBarColor", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "setBottomBarColor", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = IOSStatusBar()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc public func setStatusBarColor(_ call: CAPPluginCall) {
        let colorHex = call.getString("color") ?? "#ffffff"
        implementation.setStatusBarColor(colorHex)
        call.resolve()
    }

    @objc public func setBottomBarColor(_ call: CAPPluginCall) {
        let colorHex = call.getString("color") ?? "#ffffff"
        implementation.setBottomBarColor(colorHex)
        call.resolve()
    }

}
