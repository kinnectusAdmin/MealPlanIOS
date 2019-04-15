//
//  Resources.swift
//  MealPlan
//
//  Created by blakerogers on 3/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities
import MealPlanDomain
enum Backgrounds: String {
    case topography = "topography"
    case swirlPattern = "swirl_pattern"
    case smallSteps = "small_steps"
    case skulls = "skulls"
    case regal = "regal"
    case qbkls = "qbkls"
    case pipes = "pipes"
    case oriental = "oriental"
    case pentagon = "congruent_pentagon"
    case outline = "congruent_outline"
    case burgers = "burgers"
    var image: UIImage {
        return UIImage(named: self.rawValue) ?? UIImage()
    }
    static var current: Backgrounds {
        return .burgers
    }
    static func backgroundImage() -> UIImageView {
        let screen = UIView.container().addingGradientScreen(frame: UIScreen.main.bounds, start: .zero, end: CGPoint(x: 0, y: 1.0), locations: [0.0, 0.33, 0.99], colors: UIColor.App.currentScheme.gradient.map{ $0.cgColor}).withAlpha(0.8)
        let image = UIImageView.image(image: Backgrounds.current.image, mode: .scaleAspectFill).withScreen(view: screen)
        return image
    }

}
extension UIColor {
    enum App {
        case blueScheme
        case greenSceme
        case redScheme
        var colors: (dark: UIColor, light: UIColor, lightest: UIColor) {
            switch self {
            case .blueScheme:
                return (App.darkBlue, App.lightBlue, App.lightestBlue)
            case .greenSceme:
                return (App.darkGreen, App.lightGreen, App.lightestGreen)
            case .redScheme:
                return (App.darkRed, App.lightRed, App.lightestRed)
            }
        }
        var gradient: [UIColor] {
            switch self {
            case .blueScheme:
                return [App.darkBlue, App.lightBlue, App.lightestBlue]
            case .greenSceme:
                return [App.darkGreen, App.lightGreen, App.lightestGreen]
            case .redScheme:
                return [App.darkRed, App.lightRed, App.lightestRed]
            }
        }
        static var currentScheme: App {
            return .blueScheme
        }
        static var lightBlue: UIColor {
            return UIColor.createColor(43, 110, 155)
        }
        static var lightestBlue: UIColor {
            return UIColor.createColor(97, 156, 204)
        }
        static var darkBlue: UIColor {
            return UIColor.createColor(0, 67, 109)
        }
        static var lightGreen: UIColor {
            return UIColor.createColor(28, 155, 109)
        }
        static var lightestGreen: UIColor {
            return UIColor.createColor(90, 205, 155)
        }
        static var darkGreen: UIColor {
            return UIColor.createColor(0, 108, 66)
        }
        static var lightRed: UIColor {
            return UIColor.createColor(147, 26, 34)
        }
        static var lightestRed: UIColor {
            return UIColor.createColor(201, 78, 74)
        }
        static var darkRed: UIColor {
            return UIColor.createColor(95, 0, 0)
        }
    }
}
struct Icons {
    static let backButton: UXButton = UXButton.icon(icon: .leftOpenBig, size: .normal, tint: .white)
    static let backLabelButton: UILabel = FontelloIcons.leftOpenBig.iconLabel(size: .normal, tint: .white)
    static func iconForTrend(trend: Objects.BalanceTrendType) -> UIImage {
        switch trend {
        case .conversion:
            return FontelloIcons.balanceScale.image(size: .normal, color: UIColor.App.currentScheme.colors.light)
        case .sent:
            return FontelloIcons.dollar.image(size: .normal, color: UIColor.App.currentScheme.colors.light)
        case .spent:
            return FontelloIcons.balanceScale.image(size: .normal, color: UIColor.App.currentScheme.colors.light)
        case .received:
            return FontelloIcons.balanceScale.image(size: .normal, color: UIColor.App.currentScheme.colors.light)
        }
    }
}
enum FontelloIcons: UInt32 {
    case social = 0xf100
    case leftOpen = 0xe800
    case creditCard = 0xe801
    case chartBar = 0xe802
    case shuffle = 0xe803
    case download = 0xe804
    case upload = 0xe805
    case camera = 0xe806
    case picture = 0xe807
    case minus = 0xe808
    case plus = 0xe809
    case shuffle1 = 0xe80a
    case share = 0xe80b
    case downOpen = 0xe80c
    case upOpen = 0xe80d
    case rightOpen = 0xe80e
    case cog = 0xe80f
    case cogAlt = 0xe810
    case downOpenBig = 0xe811
    case leftOpenBig = 0xe812
    case rightOpenBig = 0xe813
    case upOpenBig = 0xe814
    case flowCross = 0xe815
    case chart = 0xe816
    case chartBar1 = 0xe817
    case money = 0xf0d6
    case bullseye = 0xf140
    case ticket = 0xf145
    case dollar = 0xf155
    case bank = 0xf19c
    case share1 = 0xf1e0
    case chartArea = 0xf1fe
    case chartPie = 0xf200
    case chartLine = 0xf201
    case balanceScale = 0xf24e
    case creditCardAlt = 0xf283
    func font(size: CGFloat) -> UIFont {
        return UIFont(name: "fontello", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    func iconLabel(size: IconSize, tint: UIColor = UIColor.App.currentScheme.colors.dark) -> UILabel {
        let label = UILabel()
        label.text = self.stringForIcon() ?? ""
        label.font = self.font(size: size.rawValue)
        label.backgroundColor = UIColor.clear
        label.textColor = tint
        label.tintColor = tint
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }
    func stringForIcon() -> String? {
        var rawIcon = self.rawValue;
        let xPtr = withUnsafeMutablePointer(to: &rawIcon, { $0 })
        return String(bytesNoCopy: xPtr, length:MemoryLayout<UInt32>.size, encoding: String.Encoding.utf32LittleEndian, freeWhenDone: false)
    }
    func image(size: IconSize, color: UIColor?, dx: CGFloat = 0, dy: CGFloat = 0) -> UIImage {
        if size.rawValue == 0.0 {
            return UIImage()
        }
        guard let string = self.stringForIcon() else { return UIImage() }
        let symbol = NSAttributedString(string: string, attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.font): self.font(size: size.rawValue)]))
        let mutableSymbol = NSMutableAttributedString(attributedString: symbol)
        let rect = CGRect(x: dx, y: dy, width: size.rawValue, height: size.rawValue)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        mutableSymbol.draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image?.withRenderingMode(.alwaysTemplate) ?? UIImage()
    }
}
enum IconSize: CGFloat {
    case micro = 8.0
    case small = 12.0
    case normal = 16.0
    case medium = 20.0
    case large = 24.0
    case xlarge = 28.0
    case xxlarge = 32.0
}
extension UXButton {
    static func icon(icon: FontelloIcons, size: IconSize = .normal, tint: UIColor) -> UXButton {
        let button = UXButton()
        button.tintColor = tint
        button.setImage(icon.image(size: size, color: tint), for: .normal)
        button.adjustsImageWhenHighlighted = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
    return input.rawValue
}

