//
//  MainFeedHistoryItem.swift
//  MealPlan
//
//  Created by blakerogers on 3/23/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities
import CleanModelViewIntent

protocol MainFeedEventItemType: Item {
    var avatar: UXImage { get set}
    var descriptionLabel: UILabel { get set}
    var dateLabel: UILabel { get set}
}
class MainFeedEventItem: UICollectionViewCell, MainFeedEventItemType {
    var viewModel: MVIViewModelType!
    var presenter: PresenterType!
    var avatar: UXImage = UXImage.image(mode: .scaleAspectFill, radius: Layout.imageRadius, defaultImage: AppImages.person.image())
    var descriptionLabel: UILabel = UILabel.labelWith(font: ViewProperties.descriptionFont, txtColor: ViewProperties.descriptionColor, background: ViewProperties.descriptionBackground, alignment: ViewProperties.descriptionAlignment, numberOfLines: ViewProperties.descriptionNumberOfLines)
    var dateLabel: UILabel = UILabel.labelWith(font: ViewProperties.dateFont, txtColor: ViewProperties.dateColor, background: ViewProperties.dateBackground)
}
extension MainFeedEventItem {
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    private func setViews() {
        contentView.add(views: avatar.imageView, descriptionLabel, dateLabel)
        avatar.imageView.setYTo(con: contentView.y(), by: 0)
        avatar.imageView.setLeftTo(con: contentView.left(), by: Layout.imageLeftOffset)
        avatar.imageView.setWidth_Height(width: Layout.imageWidth_Height, height: Layout.imageWidth_Height)
        descriptionLabel.setLeftTo(con: avatar.imageView.right(), by: Layout.descriptionLeftOffset)
        descriptionLabel.setYTo(con: avatar.imageView.y(), by: 0)
        dateLabel.setRightTo(con: contentView.right(), by: Layout.dateRightOffset)
        dateLabel.setYTo(con: avatar.imageView.y(), by: 0)
    }
}
