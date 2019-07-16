//
//  TransferView.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent
import Utilities
import MealPlanDomain

class TransferView: UIViewController, TransferViewType {
    
    var alertScreen: AlertingView = AlertingView.containerView(background: .clear, alpha: 0)
    
    private let titleLabel: UILabel = UILabel.labelWith(text: ViewProperties.title, font: ViewProperties.titleFont, txtColor: ViewProperties.titleColor, background: .clear, alignment: .center)
    
    var localUserAvatarBorder: UIView = avatarBorder(colors: ViewProperties.sendingBorderColors)
    
    var transacteeAvatarBorder: UIView = avatarBorder(colors: ViewProperties.receivingBorderColors)
    
    var localUserAvatar: UXImage = UXImage.image(mode: .scaleAspectFill, radius: Layout.avatarRadius)
    
    var transacteeAvatar: UXImage = UXImage.image(mode: .scaleAspectFill, radius: Layout.avatarRadius)
    
    var localUserNameLabel: UILabel = UILabel.labelWith(text: "@some name", font: ViewProperties.nameFont, txtColor: ViewProperties.nameColor, background: .clear, alignment: .center)
    
    var balanceLabel: UILabel = UILabel.labelWith(text: "0", font: ViewProperties.balanceFont, txtColor: ViewProperties.balanceColor, background: .clear, alignment: .center)
    
    var transacteeNameLabel: UILabel = UILabel.labelWith(text: "@some name", font: ViewProperties.nameFont, txtColor: ViewProperties.nameColor, background: .clear, alignment: .center)
    
    var transferControlButton: UXButton = UXButton.icon(icon: .exchange, size: .medium, tint: UIColor.App.currentScheme.colors.dark)

    var searchButton: UXButton = Icons.searchButton
    
    var sendButton: UXButton = UXButton.button(font: ViewProperties.sendFont, color: ViewProperties.sendColor, background: .clear, title: "SEND", radius: Layout.sendRadius, borderColor: ViewProperties.sendColor)
    
    var numberPadView: NumberPadViewType = NumberPadView.view()
    
    var searchView: UserSearchViewType = UserSearchView.view()
    
    var transferEventCollection = UXCollectionView<TransferEventSectionModel>(model: nil, frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    
    var eventContainer: UIView = UIView.containerView(background: .white, radius: SlidingContainerLayout.containerRadius, borderColor: ViewProperties.containerBorderColor)
    
    private let containerControlTab: UIView = UIView.containerView(background: ViewProperties.containerControlBarColor, radius: 4)
    
    var containerTopConstraint = NSLayoutConstraint()
    
    var containerPanGesture: UIPanGestureRecognizer!
}
extension TransferView {
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
        title = "TransferView"
        view.backgroundColor = ViewProperties.backgroundColor
        view.add(views: searchView.render(), titleLabel, localUserAvatarBorder, transacteeAvatarBorder, localUserNameLabel, transacteeNameLabel, balanceLabel, numberPadView.render(), transferControlButton, sendButton, searchButton, eventContainer, alertScreen)
        eventContainer.add(views: transferEventCollection)
        constrainSubViewSafely(subView: titleLabel, top: Layout.titleTopOffset, left: 0, right: 0)
        localUserAvatarBorder.constrainLeftToLeft(of: view, constant: Layout.avatarEdgeOffset.left)
        localUserAvatarBorder.constrainTopToBottom(of: titleLabel, constant: Layout.avatarEdgeOffset.top)
        transacteeAvatarBorder.constrainRightToRight(of: view, constant: Layout.avatarEdgeOffset.right)
        transacteeAvatarBorder.constrainTopToBottom(of: titleLabel, constant: Layout.avatarEdgeOffset.top)
        localUserAvatarBorder.add(views: localUserAvatar.imageView)
        transacteeAvatarBorder.add(views: transacteeAvatar.imageView)
        localUserAvatar.imageView.constrainCenterToCenter(of: localUserAvatarBorder)
        transacteeAvatar.imageView.constrainCenterToCenter(of: transacteeAvatarBorder)
        localUserAvatar.imageView.constrainWidth_Height(width: Layout.avatarWidthHeight, height: Layout.avatarWidthHeight)
        transacteeAvatar.imageView.constrainWidth_Height(width: Layout.avatarWidthHeight, height: Layout.avatarWidthHeight)
        localUserNameLabel.constrainCenterXTo(view: localUserAvatarBorder, constant: 0)
        localUserNameLabel.constrainTopToBottom(of: localUserAvatarBorder, constant: Layout.nameLabelTopOffset)
        transacteeNameLabel.constrainCenterXTo(view: transacteeAvatarBorder, constant: 0)
        transacteeNameLabel.constrainTopToBottom(of: transacteeAvatarBorder, constant: Layout.nameLabelTopOffset)
        transferControlButton.constrainCenterXTo(view: view, constant: 0)
        transferControlButton.constrainWidth_Height(width: Layout.transferControlSize, height: Layout.transferControlSize)
        transferControlButton.constrainCenterYTo(view: localUserAvatar.imageView, constant: 0)
        balanceLabel.constrainCenterXTo(view: view, constant: 0)
        balanceLabel.constrainTopToBottom(of: localUserNameLabel, constant: Layout.balanceLabelTopOffset)
        numberPadView.render().constrainInView(view: view, left: Layout.numberPadEdgeOffset.left, right: Layout.numberPadEdgeOffset.right)
        numberPadView.render().constrainTopToBottom(of: balanceLabel, constant: Layout.numberPadEdgeOffset.top)
        numberPadView.render().constrainViewHeight(to: NumberPadView.Layout.numberPadHeight)
        searchButton.constrainRightToLeft(of: transacteeAvatarBorder, constant: Layout.searchButtonEdgeOffset.right)
        searchButton.constrainBottomToBottom(of: transacteeAvatarBorder, constant: Layout.searchButtonEdgeOffset.bottom)
        sendButton.constrainCenterXTo(view: view, constant: 0)
        sendButton.constrainWidth_Height(width: Layout.sendButtonSize.width, height: Layout.sendButtonSize.height)
        sendButton.constrainTopToBottom(of: numberPadView.render(), constant: Layout.sendButtonTopOffset)
        eventContainer.constrainInView(view: view, left: 0, right: 0)
        eventContainer.constrainViewHeight(to: SlidingContainerLayout.containerHeight)
        containerTopConstraint = eventContainer.returnConstrainTopToBottom(of: view, constant: SlidingContainerLayout.containerOriginTopOffset)
        eventContainer.add(views: containerControlTab)
        containerControlTab.constrainTopToTop(of: eventContainer, constant: Layout.controlBarTopOffset)
        containerControlTab.constrainWidth_Height(width: Layout.controlBarSize.width, height: Layout.controlBarSize.height)
        containerControlTab.constrainCenterXTo(view: eventContainer, constant: 0)
        //
        localUserAvatar.imageView.image = AppImages.person.image()
        transacteeAvatar.imageView.image = AppImages.person.image()
        transferEventCollection.constrainInView(view: eventContainer, left: 0, right: 0, bottom: 0)
        transferEventCollection.constrainTopToBottom(of: containerControlTab, constant: Layout.transferCollectionTopOffset)
        searchView.render().constrainInView(view: view, left: 0, right: 0, bottom: 0)
        searchView.render().constrainTopToBottom(of: titleLabel, constant: Layout.searchViewTopOffset)
        alertScreen.constrainInView(view: view, top: 0, left: 0, right: 0, bottom: 0)
    }
}
extension TransferView {
    static func avatarBorder(colors: (outter: UIColor, inner: UIColor)) -> UIView {
        let outterBorderView = UIView.containerView(background: colors.outter, radius: Layout.avatarOutterBorderRadius)
        outterBorderView.constrainWidth_Height(width: Layout.avatarOutterBorderSize, height: Layout.avatarOutterBorderSize)
        let innerBorderView = UIView.containerView(background: colors.inner, radius: Layout.avatarInnerBorderRadius)
        innerBorderView.constrainWidth_Height(width: Layout.avatarInnerBorderSize, height: Layout.avatarInnerBorderSize)
        outterBorderView.add(views: innerBorderView)
        innerBorderView.constrainCenterToCenter(of: outterBorderView)
        return outterBorderView
    }
}
