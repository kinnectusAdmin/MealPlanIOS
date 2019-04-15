//
//  OnboardItemView.swift
//  MealPlan
//
//  Created by blakerogers on 3/7/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities
import CleanModelViewIntent
protocol OnboardItemType: Item {
    var featureLabel: UILabel { get set}
    init()
}
class OnboardItemView: UICollectionViewCell, OnboardItemType {
    var presenter: PresenterType?
    var featureLabel: UILabel = UILabel.labelWith(font: ViewProperties.featureLabelFont, txtColor: ViewProperties.featureLabelColor, background: .clear, alignment: .center)
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    func setViews() {
        contentView.backgroundColor = ViewProperties.featureBackgroundColor
        contentView.addSubview(featureLabel)
        featureLabel.constrainInView(view: self.contentView, top: 0, left: 0, right: 0)
    }
}
