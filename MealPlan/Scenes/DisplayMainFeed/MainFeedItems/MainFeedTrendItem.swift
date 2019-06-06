//
//  MainFeedTrendItem.swift
//  MealPlan
//
//  Created by blakerogers on 3/24/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import UIKit
import CleanModelViewIntent
import Utilities

protocol MainFeedTrendItemType: Item {
    var swipesTrendLabel: UILabel { get set}
    var flexTrendLabel: UILabel { get set}
    var trendLabel: UILabel { get set}
    var trendIcon: UIImageView { get set}
    init()
}
class MainFeedTrendItem: UICollectionViewCell, MainFeedTrendItemType {
    typealias Link = MainFeedTrendItemViewModel
    typealias ItemLink = MainFeedTrendItemPresenter
    var viewModel: MVIViewModelType!
    var presenter: PresenterType!
    var swipesTrendLabel: UILabel = UILabel.labelWith(font: ViewProperties.trendFont, txtColor: ViewProperties.trendColor, background: ViewProperties.trendBackground)
    var flexTrendLabel: UILabel = UILabel.labelWith(font: ViewProperties.trendFont, txtColor: ViewProperties.trendColor, background: ViewProperties.trendBackground)
    var trendLabel: UILabel = UILabel.labelWith(font: ViewProperties.trendFont, txtColor: ViewProperties.trendColor, background: ViewProperties.trendBackground)
    var trendIcon: UIImageView = UIImageView.image()
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    private func setViews() {
        contentView.add(views: swipesTrendLabel, flexTrendLabel, trendLabel, trendIcon)
        trendLabel.constrainInView(view: contentView, top: 0, left: 10)
        trendIcon.setTopTo(con: trendLabel.bottom(), by: 8)
        trendIcon.setLeftTo(con: trendLabel.left(), by: 8)
        trendIcon.setWidth_Height(width: ViewProperties.trendIconWidth_Height, height: ViewProperties.trendIconWidth_Height)
        flexTrendLabel.constrainInView(view: contentView, right: -8, bottom: 0)
        swipesTrendLabel.setRightTo(con: flexTrendLabel.left(), by: -8)
        swipesTrendLabel.setBottomTo(con: flexTrendLabel.bottom(), by: 0)
    }
}
extension MainFeedTrendItem {
    struct ViewProperties {
        static let trendFont: UIFont = UIFont.systemFont(ofSize: 15, weight: .light)
        static let trendColor: UIColor = UIColor.App.currentScheme.colors.light
        static let trendBackground: UIColor = .clear
        static let trendIconWidth_Height: CGFloat = 50
    }
}
