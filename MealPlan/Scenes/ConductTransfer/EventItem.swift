//
//  TransferEventItem.swift
//  MealPlan
//
//  Created by blakerogers on 6/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import UIKit
import CleanModelViewIntent
import Utilities

protocol EventItemType: Item {
    var avatar: UXImage { get set}
    var descriptionLabel: UILabel { get set}
    var dateLabel: UILabel { get set}
}
class EventItem: UICollectionViewCell, EventItemType {
    
    var viewModel: MVIViewModelType!
    
    var presenter: PresenterType!

    var avatar: UXImage = UXImage.image(mode: .scaleAspectFill, radius: Layout.avatarRadius)
    
    var descriptionLabel: UILabel = UILabel.labelWith(text: "Transfer to Janay", font: ViewProperties.descriptionFont, txtColor: ViewProperties.descriptionColor)
    
    var dateLabel: UILabel = UILabel.labelWith(text: "3/2", font: ViewProperties.dateFont, txtColor: ViewProperties.dateColor)
}
extension EventItem {
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    private func setViews() {
        contentView.backgroundColor = ViewProperties.backgroundColor
        contentView.add(views: avatar.imageView, descriptionLabel, dateLabel)
        avatar.imageView.constrainCenterYTo(view: contentView, constant: 0)
        avatar.imageView.constrainLeftToLeft(of: contentView, constant: Layout.avatarLeftOffset)
        avatar.imageView.constrainWidth_Height(width: Layout.avatarSize, height: Layout.avatarSize)
        descriptionLabel.constrainCenterYTo(view: contentView, constant: 0)
        descriptionLabel.constrainLeftToRight(of: avatar.imageView, constant: Layout.descriptionLeftOffset)
        descriptionLabel.constrainViewWidth(constant: Layout.descriptionWidth)
        dateLabel.constrainRightToRight(of: contentView, constant: Layout.dateRightOffset)
        dateLabel.constrainCenterYTo(view: contentView, constant: 0)
    }
}
