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
        let screen = UIView.containerView().addingGradientScreen(frame: UIScreen.main.bounds, start: .zero, end: CGPoint(x: 0, y: 1.0), locations: [0.0, 0.33, 0.99], colors: UIColor.App.currentScheme.gradient.map{ $0.cgColor}).withAlpha(0.8)
        let image = UIImageView.image(image: Backgrounds.current.image, mode: .scaleAspectFill).withScreen(view: screen)
        return image
    }
}
extension UIFont {
    enum App {
        case bodoni
        var fonts: (gigantic: UIFont, huge: UIFont, veryLarge: UIFont, large: UIFont, medium: UIFont, small: UIFont, tiny: UIFont) {
            switch self {
            case .bodoni:
                return (UIFont(name: "Bodoni 72", size: App.baseSize+42) ?? .systemFont(ofSize: App.baseSize+42),
                        UIFont(name: "Bodoni 72", size: App.baseSize+12) ?? .systemFont(ofSize: App.baseSize+12),
                        UIFont(name: "Bodoni 72", size: App.baseSize+6) ?? .systemFont(ofSize: App.baseSize+6),
                        UIFont(name: "Bodoni 72", size: App.baseSize) ?? .systemFont(ofSize: App.baseSize),
                        UIFont(name: "Bodoni 72", size: App.baseSize-2) ?? .systemFont(ofSize: App.baseSize-2),
                        UIFont(name: "Bodoni 72", size: App.baseSize-4) ?? .systemFont(ofSize: App.baseSize-4),
                        UIFont(name: "Bodoni 72", size: App.baseSize-6) ?? .systemFont(ofSize: App.baseSize-6))
            }
        }
        static var baseSize: CGFloat = 18
        static let currentFont: App = .bodoni
    }
}
extension UIColor {
    enum App {
        case blueScheme
        case greenScheme
        case redScheme
        case greyScheme
        var colors: (dark: UIColor, light: UIColor, lightest: UIColor) {
            switch self {
            case .blueScheme:
                return (App.darkBlue, App.lightBlue, App.lightestBlue)
            case .greenScheme:
                return (App.darkGreen, App.lightGreen, App.lightestGreen)
            case .redScheme:
                return (App.darkRed, App.lightRed, App.lightestRed)
            case .greyScheme:
                return (App.darkGrey, App.lightGrey, App.lightestGrey)
            }
        }
        var gradient: [UIColor] {
            switch self {
            case .blueScheme:
                return [App.darkBlue, App.lightBlue, App.lightestBlue]
            case .greenScheme:
                return [App.darkGreen, App.lightGreen, App.lightestGreen]
            case .redScheme:
                return [App.darkRed, App.lightRed, App.lightestRed]
            case .greyScheme:
                return [App.darkGrey, App.lightGrey, App.lightestGrey]
            }
        }
        static let currentScheme: App = .greyScheme
        
        static let accentColor: UIColor = roseGold
        
        static let lightBlue: UIColor = UIColor.createColor(43, 110, 155)
        
        static let lightestBlue: UIColor = UIColor.createColor(97, 156, 204)
        
        static let darkBlue: UIColor = UIColor.createColor(0, 67, 109)
        
        static let lightGreen: UIColor = UIColor.createColor(28, 155, 109)
        
        static let lightestGreen: UIColor = UIColor.createColor(90, 205, 155)
        
        static let darkGreen: UIColor = UIColor.createColor(0, 108, 66)
        
        static let lightRed: UIColor = UIColor.createColor(147, 26, 34)
        
        static let lightestRed: UIColor = UIColor.createColor(201, 78, 74)
        
        static let darkRed: UIColor = UIColor.createColor(95, 0, 0)
        
        static let lightGrey: UIColor = UIColor.createColor(247, 247, 247)
    
        static let darkGrey: UIColor = UIColor.createColor(139, 137, 137)
        
        static let lightestGrey: UIColor = UIColor.createColor(228, 222, 221, 0.86)
        
        static let sunGold: UIColor = UIColor.createColor(177, 110, 52, 0.34)
        
        static let roseGold: UIColor = UIColor.createColor(245, 137, 137, 0.34)
    }
}
struct Icons {
    
    static let dropDownButton: UXButton = UXButton.icon(icon: .downOpenBig, size: IconSize.normal, tint: UIColor.App.currentScheme.colors.dark)
    
    static let backButton: UXButton = UXButton.icon(icon: .leftOpenBig, size: .normal, tint: UIColor.App.currentScheme.colors.dark)
    
    static let menuButton: UXButton = UXButton.icon(icon: .cog, size: .medium, tint: UIColor.App.currentScheme.colors.dark)
    
    static let backLabelButton: UILabel = FontelloIcons.leftOpenBig.iconLabel(size: .normal, tint: .white)
    
    static let transferControlButton: UXButton = UXButton.icon(icon: .exchange, size: .medium, tint: UIColor.App.currentScheme.colors.dark)
    
    static let searchButton: UXButton = UXButton.icon(icon: .search, size: .small, tint: UIColor.App.currentScheme.colors.dark)
    
    static let dismissButton: UXButton = UXButton.icon(icon: .minus, size: .small, tint: UIColor.App.currentScheme.colors.dark)
    
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
    static let trendIcon: (IconSize, UIColor) -> UILabel = {
        size, color in
        return FontelloIcons.chart.iconLabel(size: size, tint: color)
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
    case search = 0xe818
    case money = 0xf0d6
    case exchange = 0xf0ec
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
enum AppImages {
    case person
    func image() -> UIImage? {
        switch self {
        case .person:
            return UIImage(named: "person")
        }
    }
}
extension UXButton {
    static func icon(icon: FontelloIcons, size: IconSize = .normal, tint: UIColor, borderWidth: CGFloat = 1.0, borderColor: UIColor = .clear, radius: CGFloat = 0) -> UXButton {
        let button = UXButton()
        button.tintColor = tint
        button.layer.borderColor = borderColor.cgColor
        button.layer.borderWidth = borderWidth
        button.layer.cornerRadius = radius
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

protocol Alerting {
    var alertScreen: AlertingView { get set }
}
protocol Loading {
    func loading()
    func dismissLoading()
    func animateIndicator(indicator: UIView)
}
extension Loading where Self: UIViewController {
    func loading() {
        let loadingScreen = UIView.vibrantContainerView(background: .clear)
        loadingScreen.alpha = 999
        let loadingIndicator = UIView.containerView(background: .white, radius: 30)
        loadingIndicator.tag = 998
        loadingScreen.add(views: loadingIndicator)
        loadingIndicator.constrainWidth_Height(width: 60, height: 60)
        loadingIndicator.constrainCenterToCenter(of: loadingScreen)
        view.addSubview(loadingScreen)
        animateIndicator(indicator: loadingIndicator)
    }
    func animateIndicator(indicator: UIView) {
        guard indicator.tintColor == .blue else { return }
        UIView.setAnimationRepeatAutoreverses(true)
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: {
            indicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { (_) in
            self.animateIndicator(indicator: indicator)
        }
    }
    func dismissLoading() {
        view.viewWithTag(998)?.tintColor = .clear
        view.viewWithTag(999)?.removeFromSuperview()
    }
}
