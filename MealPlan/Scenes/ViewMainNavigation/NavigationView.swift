//
//  NavigationView.swift
//  MealPlan
//
//  Created by blakerogers on 5/19/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities

class NavigationView: UIView {
    let menuButton = Icons.menuButton
    let historyButton = UXButton.button(font: ViewProperties.navigationFont, color: ViewProperties.navigationColor, background: .clear,title: "History")
    let conversionButton = UXButton.button(font: ViewProperties.navigationFont, color: ViewProperties.navigationColor, background: .clear,title: "Conversion")
    let transferButton = UXButton.button(font: ViewProperties.navigationFont, color: ViewProperties.navigationColor, background: .clear,title: "Transfer")
}
extension NavigationView {
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    private func setViews() {
        let gradient = addGradientScreen_Return(frame: CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: Layout.gradientHeight), start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: 1.0), locations: [0.0, 1.0], colors: ViewProperties.gradientColors)
        layer.insertSublayer(gradient, at: 0)
        
        add(views: historyButton, conversionButton, transferButton)
        //menuButton.constrainInView(view: self, left: Layout.menuEdgeOffset.left, bottom: Layout.menuEdgeOffset.bottom)
        
        conversionButton.constrainCenterXTo(view: self, constant: 0)
        conversionButton.constrainBottomToBottom(of: self, constant: Layout.conversionBottomOffset)
        
        historyButton.constrainBottomToBottom(of: conversionButton, constant: 0)
        historyButton.constrainRightToLeft(of: conversionButton, constant: -Layout.navButtonEdgeOffset)
        transferButton.constrainBottomToBottom(of: conversionButton, constant: 0)
        transferButton.constrainLeftToRight(of: conversionButton, constant: Layout.navButtonEdgeOffset)
    }
}
extension NavigationView {
    public static func view() -> NavigationView {
        let view = NavigationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
extension NavigationView {
    struct ViewProperties {
        static let gradientColors: [CGColor] = [UIColor.white.withAlphaComponent(0).cgColor,
                                                UIColor.App.greyScheme.colors.light.cgColor]
        static let navigationFont: UIFont = UIFont.App.currentFont.fonts.tiny
        static let navigationColor: UIColor = UIColor.App.currentScheme.colors.dark
    }
    struct Layout {
        static let gradientHeight: CGFloat = 120
        static let menuEdgeOffset: EdgeOffsets = (10, 0, 0, -10)
        static let conversionBottomOffset: CGFloat = -10
        static let navButtonEdgeOffset: CGFloat = 32
    }
}
