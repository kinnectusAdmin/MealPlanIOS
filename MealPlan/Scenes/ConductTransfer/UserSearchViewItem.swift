//
//  UserSearchViewItem.swift
//  MealPlan
//
//  Created by blakerogers on 6/8/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent
import Utilities

protocol UserSearchItemType: Item {
    var avatar: UXImage { get set }
    var nameLabel: UILabel { get set }
}
class UserSearchItem: UICollectionViewCell, UserSearchItemType {
    var viewModel: MVIViewModelType!
    
    var presenter: PresenterType!
    
    var avatar: UXImage = UXImage.image(mode: .scaleAspectFill, radius: Layout.avatarRadius, interactionOn: true)
    
    var nameLabel: UILabel = UILabel.labelWith(text: "@dizzyJay", font: ViewProperties.nameFont, txtColor: ViewProperties.nameColor, background: .clear, alignment: .center)
}
extension UserSearchItem {
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    private func setViews() {
        contentView.add(views: avatar.imageView, nameLabel)
        avatar.imageView.constrainCenterToCenter(of: contentView)
        avatar.imageView.constrainWidth_Height(width: Layout.avatarSize, height: Layout.avatarSize)
        nameLabel.constrainTopToBottom(of: avatar.imageView, constant: Layout.nameLabelTopOffset)
        nameLabel.constrainCenterXTo(view: avatar.imageView, constant: 0)
    }
}
extension UserSearchItem {
    struct ViewProperties {
        static let background: UIColor = .clear
        static let nameFont: UIFont = UIFont.App.currentFont.fonts.small
        static let nameColor: UIColor = UIColor.App.currentScheme.colors.dark
    }
    struct Layout {
        static let avatarSize: CGFloat = 60
        static let avatarRadius: CGFloat = avatarSize*0.5
        static let itemSize: CGSize = CGSize(width: UIScreen.main.bounds.width*0.3, height: 100)
        static let nameLabelTopOffset: CGFloat = 8
    }
}
