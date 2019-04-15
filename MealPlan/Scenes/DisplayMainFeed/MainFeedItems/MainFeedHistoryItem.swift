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
class MainFeedHistoryItem: UICollectionViewCell, Item {
    var presenter: PresenterType?
    let image: UIImageView = UIImageView.image(mode: .scaleAspectFill, radius: ViewProperties.imageRadius)
    let descriptionLabel: UILabel = UILabel.labelWith(font: ViewProperties.descriptionFont, txtColor: ViewProperties.descriptionColor, background: ViewProperties.descriptionBackground, alignment: ViewProperties.descriptionAlignment, numberOfLines: ViewProperties.descriptionNumberOfLines)
    let dateLabel: UILabel = UILabel.labelWith(font: ViewProperties.dateFont, txtColor: ViewProperties.dateColor, background: ViewProperties.dateBackground)
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    private func setViews() {
        contentView.add(views: image, descriptionLabel, dateLabel)
        image.setYTo(con: contentView.y(), by: 0)
        image.setLeftTo(con: contentView.left(), by: 10)
        image.setWidth_Height(width: ViewProperties.imageWidth_Height, height: ViewProperties.imageWidth_Height)
        descriptionLabel.constrainInView(view: contentView,left: 58, right: -20)
        descriptionLabel.setYTo(con: image.y(), by: 0)
        dateLabel.setRightTo(con: contentView.right(), by: -8)
        dateLabel.setYTo(con: image.y(), by: 0)
    }
}

