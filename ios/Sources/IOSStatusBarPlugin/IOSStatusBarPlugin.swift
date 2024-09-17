import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(IOSStatusBarPlugin)
public class IOSStatusBarPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "IOSStatusBarPlugin"
    public let jsName = "IOSStatusBar"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = IOSStatusBar()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
}
