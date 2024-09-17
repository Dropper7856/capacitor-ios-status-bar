import Foundation

@objc public class IOSStatusBar: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
