//
//  MainFeedAccountItem.swift
//  MealPlan
//
//  Created by blakerogers on 6/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent

protocol MainFeedAccountItemType: Item {
    var swipesRemainingLabel: UILabel { get set }
    var flexRemainingLabel: UILabel { get set }
    var swipesSpentLabel: UILabel { get set }
    var flexSpentLabel: UILabel { get set }
    var swipesReceivedLabel: UILabel { get set }
    var flexReceivedLabel: UILabel { get set }
    var swipesConvertedLabel: UILabel { get set }
    var flexConvertedLabel: UILabel { get set }
}

class MainFeedAccountItem: UICollectionViewCell, MainFeedAccountItemType {
    var viewModel: MVIViewModelType!
    var presenter: PresenterType!
    var swipesRemainingLabel: UILabel = valueLabel()
    var swipesSpentLabel: UILabel = valueLabel()
    var swipesReceivedLabel: UILabel = valueLabel()
    var swipesConvertedLabel: UILabel = valueLabel()
    var flexRemainingLabel: UILabel = valueLabel()
    var flexSpentLabel: UILabel = valueLabel()
    var flexReceivedLabel: UILabel = valueLabel()
    var flexConvertedLabel: UILabel = valueLabel()
    private let titleLabel: UILabel = UILabel.labelWith(text: ViewProperties.title, font: ViewProperties.titleFont, txtColor: ViewProperties.titleColor, background: .clear, alignment: .center)
    private let container: UIView = UIView.containerView(background: ViewProperties.containerBackgroundColor, radius: ViewProperties.contentRadius).addingShadow(2, dy: 2, color: ViewProperties.containerShadowColor, radius: 4.0, opacity: 0.6)
    private let swipesAccountLabel = UILabel.labelWith(text: "Swipes", font: ViewProperties.accountTypeFont, txtColor: ViewProperties.accoutTypeColor, background: .clear)
    private let flexAccountLabel = UILabel.labelWith(text: "Flex", font: ViewProperties.accountTypeFont, txtColor: ViewProperties.accoutTypeColor, background: .clear)
    private let trendIcon: UILabel = Icons.trendIcon(Layout.trendIconSize, ViewProperties.trendIconColor)
    private let remainingLabel: UILabel = infoLabel(text: "Remaining")
    private let spentLabel: UILabel = infoLabel(text: "Spent")
    private let receivedLabel: UILabel = infoLabel(text: "Received")
    private let convertedLabel: UILabel = infoLabel(text: "Converted")
}
extension MainFeedAccountItem {
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    private func setViews() {
        contentView.add(views: titleLabel, container)
        titleLabel.constrainInView(view: contentView, top: Layout.titleEdgeOffset.top, left: 0, right: 0)
        container.constrainInView(view: contentView, left: Layout.containerEdgeOffset.left, right: Layout.containerEdgeOffset.right, bottom: Layout.containerEdgeOffset.bottom)
        container.constrainTopToBottom(of: titleLabel, constant: Layout.containerEdgeOffset.top)
        container.add(views: swipesAccountLabel, flexAccountLabel, trendIcon, swipesRemainingLabel, swipesSpentLabel, swipesReceivedLabel, swipesConvertedLabel, flexRemainingLabel, flexSpentLabel, flexConvertedLabel, flexReceivedLabel, remainingLabel, spentLabel, receivedLabel, convertedLabel)
        swipesAccountLabel.constrainInView(view: container, top: Layout.swipesAccountTypeEdgeOffset.top, left: Layout.swipesAccountTypeEdgeOffset.left)
        swipesAccountLabel.constrainTopToBottom(of: titleLabel, constant: Layout.swipesAccountTypeEdgeOffset.top)
        swipesRemainingLabel.constrainCenterXTo(view: swipesAccountLabel, constant: 0)
        swipesRemainingLabel.constrainTopToBottom(of: swipesAccountLabel, constant: Layout.valueInfoLabelsTopOffset)
        swipesSpentLabel.constrainCenterXTo(view: swipesRemainingLabel, constant: 0)
        swipesSpentLabel.constrainTopToBottom(of: swipesRemainingLabel, constant: Layout.valueInfoLabelsTopOffset)
        swipesReceivedLabel.constrainCenterXTo(view: swipesRemainingLabel, constant: 0)
        swipesReceivedLabel.constrainTopToBottom(of: swipesSpentLabel, constant: Layout.valueInfoLabelsTopOffset)
        swipesConvertedLabel.constrainCenterXTo(view: swipesReceivedLabel, constant: 0)
        swipesConvertedLabel.constrainTopToBottom(of: swipesReceivedLabel, constant: Layout.valueInfoLabelsTopOffset)
        
        flexAccountLabel.constrainInView(view: container, top: Layout.flexAccountTypeEdgeOffset.top, right: Layout.flexAccountTypeEdgeOffset.right)
        flexAccountLabel.constrainTopToBottom(of: titleLabel, constant: Layout.flexAccountTypeEdgeOffset.top)
        flexRemainingLabel.constrainCenterXTo(view: flexAccountLabel, constant: 0)
        flexRemainingLabel.constrainTopToBottom(of: flexAccountLabel, constant: Layout.valueInfoLabelsTopOffset)
        flexSpentLabel.constrainCenterXTo(view: flexRemainingLabel, constant: 0)
        flexSpentLabel.constrainTopToBottom(of: flexRemainingLabel, constant: Layout.valueInfoLabelsTopOffset)
        flexReceivedLabel.constrainCenterXTo(view: flexRemainingLabel, constant: 0)
        flexReceivedLabel.constrainTopToBottom(of: flexSpentLabel, constant: Layout.valueInfoLabelsTopOffset)
        flexConvertedLabel.constrainCenterXTo(view: flexReceivedLabel, constant: 0)
        flexConvertedLabel.constrainTopToBottom(of: flexReceivedLabel, constant: Layout.valueInfoLabelsTopOffset)
        
        trendIcon.constrainCenterXTo(view: container, constant: 0)
        trendIcon.constrainTopToTop(of: container, constant: Layout.trendIconTopOffset)
        remainingLabel.constrainCenterXTo(view: trendIcon, constant: 0)
        remainingLabel.constrainCenterYTo(view: swipesRemainingLabel, constant: 0)
        spentLabel.constrainCenterXTo(view: trendIcon, constant: 0)
        spentLabel.constrainCenterYTo(view: swipesSpentLabel, constant: 0)
        receivedLabel.constrainCenterXTo(view: trendIcon, constant: 0)
        receivedLabel.constrainCenterYTo(view: swipesReceivedLabel, constant: 0)
        convertedLabel.constrainCenterXTo(view: trendIcon, constant: 0)
        convertedLabel.constrainCenterYTo(view: swipesConvertedLabel, constant: 0)
    }
}
extension MainFeedAccountItem {
    static func valueLabel() -> UILabel {
        return UILabel.labelWith(font: ViewProperties.valueFont, txtColor: ViewProperties.valueFontColor, background: .clear)
    }
    static func infoLabel(text: String) -> UILabel {
        return UILabel.labelWith(text: text, font: ViewProperties.infoFont, txtColor: ViewProperties.infoFontColor, background: .clear)
    }
}
