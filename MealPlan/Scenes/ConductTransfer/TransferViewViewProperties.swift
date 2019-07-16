//
//  TransferViewViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 6/8/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities

extension TransferView {
    struct ViewProperties {
        static let title: String = "Swipe Exchange"
        static let backgroundColor: UIColor = UIColor.App.currentScheme.colors.light
        static let toggleSize: IconSize = .small
        static let toggleColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let titleFont: UIFont = UIFont.App.currentFont.fonts.large
        static let titleColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let nameFont: UIFont = UIFont.App.currentFont.fonts.small
        static let nameColor: UIColor = UIColor.App.currentScheme.colors.dark.withAlphaComponent(0.8)
        static let balanceFont: UIFont = UIFont.App.currentFont.fonts.gigantic
        static let balanceColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let sendFont: UIFont = UIFont.App.currentFont.fonts.small
        static let sendColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let containerBorderColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let containerControlBarColor: UIColor = UIColor.App.currentScheme.colors.dark.withAlphaComponent(0.9)
        static let receivingBorderColors: (outter: UIColor, inner: UIColor) = (UIColor.App.greenScheme.colors.lightest,UIColor.App.greenScheme.colors.light)
        static let sendingBorderColors: (outter: UIColor, inner: UIColor) = (UIColor.App.redScheme.colors.lightest,UIColor.App.redScheme.colors.light)
    }
    struct Layout {
        static let avatarInnerBorderSize: CGFloat = avatarWidthHeight*1.25
        static let avatarOutterBorderSize: CGFloat = avatarWidthHeight*1.5
        static let avatarInnerBorderRadius: CGFloat = avatarInnerBorderSize*0.5
        static let avatarOutterBorderRadius: CGFloat = avatarOutterBorderSize*0.5
        static let avatarWidthHeight: CGFloat = 70
        static let avatarRadius: CGFloat = avatarWidthHeight*0.5
        static let titleTopOffset: CGFloat = 50
        static let avatarEdgeOffset: EdgeOffsets = (20, 20, -20, 0)
        static let nameLabelTopOffset: CGFloat = 4
        static let balanceLabelTopOffset: CGFloat = 16
        static let transferControlTopOffset: CGFloat = 8
        static let transferControlSize: CGFloat = 50
        static let toggleSize: CGFloat = ViewProperties.toggleSize.rawValue
        static let sendButtonSize: WidthHeight = (200, 40)
        static let sendButtonTopOffset: CGFloat = 70
        static let controlBarSize: WidthHeight = (30, 4)
        static let controlBarTopOffset: CGFloat = 8
        static let sendRadius: CGFloat = Layout.sendButtonSize.height*0.5
        static let searchButtonEdgeOffset: EdgeOffsets = (0, 0, -8, -8)
        static let numberPadEdgeOffset: EdgeOffsets = (30, 20, -30, 0)
        static let transferCollectionTopOffset: CGFloat = 16
        static let searchViewTopOffset: CGFloat = 8
    }
}
