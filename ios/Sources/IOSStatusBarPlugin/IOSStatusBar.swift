import Foundation

@objc public class IOSStatusBar: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }

    @objc public func setStatusBarColor(_ colorHex: String) {
        DispatchQueue.main.async {
            if #available(iOS 13.0, *) {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                      let statusBarManager = windowScene.statusBarManager,
                      let statusBarFrame = statusBarManager.statusBarFrame as CGRect? else {
                    print("Failed to access statusBarManager")
                    return
                }

                // Créer une vue pour simuler la couleur de la barre de statut
                let statusBarView = UIView(frame: statusBarFrame)
                statusBarView.backgroundColor = UIColor(hex: colorHex)
                UIApplication.shared.keyWindow?.addSubview(statusBarView)
            } else {
                // iOS 12 et inférieur
                if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
                    statusBar.backgroundColor = UIColor(hex: colorHex)
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
