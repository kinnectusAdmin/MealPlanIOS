//
//  MainFeedGraphItem.swift
//  MealPlan
//
//  Created by blakerogers on 3/25/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import SwiftCharts
import CleanModelViewIntent
import Utilities

protocol MainFeedGraphItemType: Item {
    var titleLabel: UILabel { get set }
    var averageLabel: UILabel { get set}
    var detailsLabel: UILabel { get set}
    func setBalances(balances: [Double])
}

class MainFeedGraphItem: UICollectionViewCell, MainFeedGraphItemType {
    var viewModel: MVIViewModelType!
    
    var presenter: PresenterType!
    
    var averageLabel: UILabel = UILabel.labelWith(font: ViewProperties.averageFont, txtColor: ViewProperties.averageColor, background: .clear, alignment: .center)
    
    var detailsLabel: UILabel = UILabel.labelWith(font: ViewProperties.detailsFont, txtColor: ViewProperties.detailsColor, background: .clear, alignment: .center)
    
    var titleLabel: UILabel = UILabel.labelWith(font: ViewProperties.titleFont, txtColor: ViewProperties.titleColor, background: .clear, alignment: .center)
    
    private lazy var container: UIView = UIView.container(background: ViewProperties.containerBackgroundColor, radius: ViewProperties.contentRadius).addingGradientScreen(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: Layout.containerHeight), start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: 1.0), locations: [0.0, 0.25, 0.5], colors: ViewProperties.containerColors).addingShadow(2, dy: 2, color: ViewProperties.containerShadowColor, radius: 4.0, opacity: 0.6)
}
extension MainFeedGraphItem {
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    private func setViews() {
        contentView.add(views: titleLabel, container)
        titleLabel.constrainInView(view: contentView, top: Layout.titleEdgeOffset.top, left: 0, right: 0)
        container.constrainInView(view: contentView, left: Layout.containerEdgeOffset.left, right: Layout.containerEdgeOffset.right, bottom: Layout.containerEdgeOffset.bottom)
        container.constrainTopToBottom(of: titleLabel, constant: Layout.containerEdgeOffset.top)
        container.clipsToBounds = true
        container.add(views: averageLabel, detailsLabel)
        averageLabel.constrainTopToTop(of: container, constant: Layout.averageTopOffset)
        averageLabel.constrainCenterXTo(view: container, constant: 0)
        detailsLabel.constrainBottomToBottom(of: container, constant: Layout.detailsBottomOffset)
        detailsLabel.constrainCenterXTo(view: container, constant: 0)
        
    }
    
    func setBalances(balances: [Double]) {
        //TODO: Implement chart for balances
    }
}
