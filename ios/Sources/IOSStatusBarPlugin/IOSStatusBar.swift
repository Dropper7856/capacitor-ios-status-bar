import Foundation
import Cordova

@objc public class IOSStatusBar: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }

    @objc public func setStatusBarColor(_ colorHex: String) {
        DispatchQueue.main.async {
            let color = UIColor(hex: colorHex) ?? UIColor.white

            // Changer la couleur de fond de la fenêtre principale
            if let window = UIApplication.shared.windows.first {
                window.backgroundColor = color

                // Supprimer les vues de la barre de statut existantes
                if let existingStatusBarView = window.viewWithTag(12345) {
                    existingStatusBarView.removeFromSuperview()
                }

                // Créer une vue pour simuler la couleur de la barre de statut
                if #available(iOS 13.0, *) {
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                          let statusBarManager = windowScene.statusBarManager else {
                        print("Failed to access statusBarManager")
                        return
                    }

                    let statusBarView = UIView(frame: statusBarManager.statusBarFrame)
                    statusBarView.backgroundColor = color
                    statusBarView.tag = 12345
                    window.addSubview(statusBarView)
                } else {
                    // iOS 12 et inférieur
                    if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
                        statusBar.backgroundColor = color
                    }
                }

                // Changer la couleur de fond de la WebView
                if let rootViewController = window.rootViewController as? CDVViewController {
                    rootViewController.webView?.backgroundColor = color
                    rootViewController.view.backgroundColor = color
                }
            }
        }
    }






        @objc public func setBottomBarColor(_ colorHex: String) {
            DispatchQueue.main.async {
                guard let window = UIApplication.shared.windows.first else {
                    print("No window found")
                    return
                }

                let bottomBarView = UIView(frame: CGRect(x: 0, y: window.frame.height - window.safeAreaInsets.bottom, width: window.frame.width, height: window.safeAreaInsets.bottom))
                bottomBarView.backgroundColor = UIColor(hex: colorHex)
                window.addSubview(bottomBarView)
            }
        }
}
    extension UIColor {
        convenience init?(hex: String) {
            var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

            var rgb: UInt64 = 0
            let scanner = Scanner(string: hexSanitized)
            scanner.scanHexInt64(&rgb)

            let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(rgb & 0x0000FF) / 255.0
            let alpha = CGFloat(1.0)

            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
    }
