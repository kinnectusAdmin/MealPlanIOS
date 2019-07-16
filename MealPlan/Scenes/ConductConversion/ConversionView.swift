//
//  ConversionView.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//
import Foundation
import UIKit
import CleanModelViewIntent
import Utilities

class ConversionView: UIViewController, ConversionViewType, SlidingContainer {
    
    var alertScreen: AlertingView = AlertingView.containerView(background: .clear, alpha: 0)

    var acknowledgeAlertButton: UXButton! = Icons.dismissButton
    
    private let titleLabel: UILabel = UILabel.labelWith(text: ViewProperties.title, font: ViewProperties.titleFont, txtColor: ViewProperties.titleColor, background: .clear, alignment: .center)
    
    private let flexTitleLabel: UILabel = UILabel.labelWith(text: "Flex", font: ViewProperties.flexTitleFont, txtColor: ViewProperties.flexTitleColor, background: .clear, alignment: .center)
    
    private let swipesTitleLabel: UILabel = UILabel.labelWith(text: "Swipes", font: ViewProperties.swipesTitleFont, txtColor: ViewProperties.swipesTitleColor, background: .clear, alignment: .center)
    
    private let flexBalanceUnderline: UIView = UIView.containerView(background: ViewProperties.underlineColor)
    
    private let swipesBalanceUnderline: UIView = UIView.containerView(background: ViewProperties.underlineColor)
    
    var flexBalanceLabel: UILabel = UILabel.labelWith(text: "+0", font: ViewProperties.balanceFont, txtColor: ViewProperties.balanceColor, background: .clear, alignment: .center)
    
    var swipesBalanceLabel: UILabel = UILabel.labelWith(text: "+0", font: ViewProperties.balanceFont, txtColor: ViewProperties.balanceColor, background: .clear, alignment: .center)
    
    var swapConversionButton: UXButton = Icons.transferControlButton
    
    var initiateConversionButton: UXButton = UXButton.button(font: ViewProperties.conversionFont, color: ViewProperties.conversionColor, background: .clear, title: "Convert Flex to Swipes", radius: Layout.conversionRadius, borderColor: ViewProperties.conversionBorderColor, borderWidth: 1.0)
    
    var numberPadView: NumberPadViewType = NumberPadView.view()

    var conversionEventCollection = UXCollectionView<ConversionEventSectionModel>(model: nil, frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    
    var eventContainer: UIView = UIView.containerView(background: .white, radius: SlidingContainerLayout.containerRadius, borderColor: ViewProperties.containerBorderColor)
    
    private let containerControlTab: UIView = UIView.containerView(background: ViewProperties.containerControlBarColor, radius: 4)
    
    var containerTopConstraint = NSLayoutConstraint()
    
    var containerPanGesture: UIPanGestureRecognizer!
}
extension ConversionView {
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setGesture()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        displayList()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideList()
    }
    private func setViews() {
        title = "ConversionView"
        view.backgroundColor = ViewProperties.backgroundColor
        view.add(views: titleLabel, flexTitleLabel, swipesTitleLabel, swipesBalanceLabel, swipesBalanceUnderline, flexBalanceLabel, flexBalanceUnderline, swapConversionButton, initiateConversionButton, numberPadView.render(), eventContainer, alertScreen)
        constrainSubViewSafely(subView: titleLabel, top: Layout.titleTopOffset, left: 0, right: 0)
        flexTitleLabel.constrainTopToBottom(of: titleLabel, constant: Layout.flexTitleTopOffset)
        flexTitleLabel.constrainCenterXTo(view: flexBalanceLabel, constant: 0)
        swipesTitleLabel.constrainTopToTop(of: flexTitleLabel, constant: 0)
        swipesTitleLabel.constrainCenterXTo(view: swipesBalanceLabel, constant: 0)
        flexBalanceLabel.constrainLeftToLeft(of: view, constant: Layout.flexBalanceEdgeOffset.left)
        flexBalanceLabel.constrainTopToBottom(of: flexTitleLabel, constant: Layout.flexBalanceEdgeOffset.top)
        flexBalanceUnderline.constrainCenterXTo(view: flexBalanceLabel, constant: 0)
        flexBalanceUnderline.constrainWidth_Height(width: Layout.flexUnderlineSize.width, height: Layout.flexUnderlineSize.height)
        flexBalanceUnderline.constrainTopToBottom(of: flexBalanceLabel, constant: Layout.flexUnderlineTopOffset)
        swipesBalanceUnderline.constrainCenterXTo(view: swipesBalanceLabel, constant: 0)
        swipesBalanceUnderline.constrainWidth_Height(width: Layout.swipesUnderlineSize.width, height: Layout.swipesUnderlineSize.height)
        swipesBalanceUnderline.constrainCenterYTo(view: flexBalanceUnderline, constant: 0)
        swapConversionButton.constrainCenterXTo(view: view, constant: 0)
        swapConversionButton.constrainCenterYTo(view: flexBalanceLabel, constant: 0)
        swipesBalanceLabel.constrainTopToTop(of: flexBalanceLabel, constant: 0)
        swipesBalanceLabel.constrainRightToRight(of: view, constant: Layout.swipesBalanceEdgeOffset.right)
        numberPadView.render().constrainInView(view: view, left: Layout.numberPadEdgeOffset.left, right: Layout.numberPadEdgeOffset.right)
        numberPadView.render().constrainTopToBottom(of: swipesBalanceLabel, constant: Layout.numberPadEdgeOffset.top)
        numberPadView.render().constrainViewHeight(to: NumberPadView.Layout.numberPadHeight)
        initiateConversionButton.constrainCenterXTo(view: view, constant: 0)
        initiateConversionButton.constrainTopToBottom(of: numberPadView.render(), constant: Layout.conversionButtonTopOffset)
        initiateConversionButton.constrainWidth_Height(width: Layout.conversionSize.width, height: Layout.conversionSize.height)
        eventContainer.constrainInView(view: view, left: 0, right: 0)
        eventContainer.constrainViewHeight(to: SlidingContainerLayout.containerHeight)
        containerTopConstraint = eventContainer.returnConstrainTopToBottom(of: view, constant: SlidingContainerLayout.containerOriginTopOffset)
        eventContainer.add(views: containerControlTab)
        containerControlTab.constrainTopToTop(of: eventContainer, constant: Layout.controlBarTopOffset)
        containerControlTab.constrainWidth_Height(width: Layout.controlBarSize.width, height: Layout.controlBarSize.height)
        containerControlTab.constrainCenterXTo(view: eventContainer, constant: 0)
        eventContainer.add(views: containerControlTab, conversionEventCollection)
        conversionEventCollection.constrainInView(view: eventContainer, left: 0, right: 0, bottom: 0)
        conversionEventCollection.constrainTopToBottom(of: containerControlTab, constant: Layout.conversionCollectionTopOffset)
        alertScreen.constrainInView(view: view, top: 0, left: 0, right: 0, bottom: 0)
    }
}
