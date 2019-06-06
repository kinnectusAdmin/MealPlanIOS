//
//  MainFeedEventsItem.swift
//  MealPlan
//
//  Created by blakerogers on 6/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities
import CleanModelViewIntent

protocol MainFeedEventsItemType: Item {
    var eventsCollection: UXCollectionView<MainFeedEventsSectionModel> { get set}
}
class MainFeedEventsItem: UICollectionViewCell, MainFeedEventsItemType {
    var viewModel: MVIViewModelType!
    var presenter: PresenterType!
    private let titleLabel: UILabel = UILabel.labelWith(text: ViewProperties.title, font: ViewProperties.titleFont, txtColor: ViewProperties.titleColor, background: .clear, alignment: .center)
    private let container: UIView = UIView.container(background: ViewProperties.containerBackgroundColor, radius: ViewProperties.contentRadius)
    var eventsCollection = UXCollectionView<MainFeedEventsSectionModel>(model: MainFeedEventsSectionModel(viewState: nil), direction: .vertical, frame: CGRect(x: 0, y: 0, width: 300, height: 300))
}
extension MainFeedEventsItem {
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    func setViews() {
        contentView.backgroundColor = ViewProperties.backgroundColor
        contentView.layer.cornerRadius = ViewProperties.contentRadius
        contentView.add(views: titleLabel, container, eventsCollection)
        titleLabel.constrainInView(view: contentView, top: Layout.titleEdgeOffset.top, left: Layout.titleEdgeOffset.left, right: Layout.titleEdgeOffset.right)
        container.constrainInView(view: contentView, left: Layout.containerEdgeOffset.left, right: Layout.containerEdgeOffset.right, bottom: Layout.containerEdgeOffset.bottom)
        container.setTopTo(con: titleLabel.bottom(), by: Layout.containerEdgeOffset.top)
        eventsCollection.constrainInView(view: container, top: Layout.collectionEdgeOffset.top, left: Layout.collectionEdgeOffset.left, right: Layout.collectionEdgeOffset.right, bottom: Layout.collectionEdgeOffset.bottom)
    }
}
extension MainFeedEventsItem {
    struct ViewProperties {
        static let containerBackgroundColor: UIColor = .white
        static let backgroundColor: UIColor = .clear
        static let contentRadius: CGFloat = 10.0
        static let title: String = "History"
        static let titleFont: UIFont = UIFont.App.currentFont.fonts.large
        static let titleColor: UIColor = UIColor.App.currentScheme.colors.dark
    }
    struct Layout {
        static let titleEdgeOffset: EdgeOffsets = (0, 5, 0, 0)
        static let containerEdgeOffset: EdgeOffsets = (10, 10, -10, 0)
        static let collectionEdgeOffset: EdgeOffsets = (10, 10, -10, 0)
    }
}
