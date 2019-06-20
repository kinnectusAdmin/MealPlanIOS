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
    
    private let titleLabel: UILabel = UILabel.labelWith(text: ViewProperties.title, font: ViewProperties.titleFont, txtColor: ViewProperties.titleColor, background: .clear, alignment: .center)
    
    private let localUserAvatarBorder: UIView = avatarBorder(colors: ViewProperties.sendingBorderColors)
    
    private let transacteeAvatarBorder: UIView = avatarBorder(colors: ViewProperties.receivingBorderColors)
    
    var localUserAvatar: UXImage = UXImage.image(mode: .scaleAspectFill, radius: Layout.avatarRadius)
    
    var transacteeAvatar: UXImage = UXImage.image(mode: .scaleAspectFill, radius: Layout.avatarRadius)
    
    var localUserNameLabel: UILabel = UILabel.labelWith(text: "@some name", font: ViewProperties.nameFont, txtColor: ViewProperties.nameColor, background: .clear, alignment: .center)
    
    var balanceLabel: UILabel = UILabel.labelWith(text: "0", font: ViewProperties.balanceFont, txtColor: ViewProperties.balanceColor, background: .clear, alignment: .center)
    
    var transacteeNameLabel: UILabel = UILabel.labelWith(text: "@some name", font: ViewProperties.nameFont, txtColor: ViewProperties.nameColor, background: .clear, alignment: .center)
    
    var transferControlButton: UXButton = Icons.transferControlButton

    var searchButton: UXButton = Icons.searchButton
    
    var sendButton: UXButton = UXButton.button(font: ViewProperties.sendFont, color: ViewProperties.sendColor, background: .clear, title: "SEND", radius: Layout.sendRadius, borderColor: ViewProperties.sendColor)
    
    var numberPadView: NumberPadViewType = NumberPadView.view()
    
    var searchView: UserSearchViewType = UserSearchView.view()
    
    lazy var transferEventCollection = UXCollectionView<TransferEventSectionModel>(model: nil, direction: .vertical, frame: self.view.frame)
    
    private let eventContainer: UIView = UIView.containerView(background: .white, radius: Layout.containerRadius, borderColor: ViewProperties.containerBorderColor)
    
    private let containerControlTab: UIView = UIView.container(background: ViewProperties.containerControlBarColor, radius: 4)
    
    private var containerTopConstraint = NSLayoutConstraint()
    
    private var containerPanGesture: UIPanGestureRecognizer!
    
    func updateTransferDirection(transfer: TransferMode) {
        switch transfer {
        case .requesting:
            UIView.animate(withDuration: 0.25) {
                self.localUserAvatarBorder.backgroundColor = ViewProperties.receivingBorderColors.outter
                self.localUserAvatarBorder.subviews.first?.backgroundColor = ViewProperties.receivingBorderColors.inner
                self.transacteeAvatarBorder.backgroundColor = ViewProperties.sendingBorderColors.outter
                self.transacteeAvatarBorder.subviews.first?.backgroundColor = ViewProperties.sendingBorderColors.inner
            }
        case .sending:
            UIView.animate(withDuration: 0.25) {
                self.localUserAvatarBorder.backgroundColor = ViewProperties.sendingBorderColors.outter
                self.localUserAvatarBorder.subviews.first?.backgroundColor = ViewProperties.sendingBorderColors.inner
                self.transacteeAvatarBorder.backgroundColor = ViewProperties.receivingBorderColors.outter
                self.transacteeAvatarBorder.subviews.first?.backgroundColor = ViewProperties.receivingBorderColors.inner
            }
        }
    }
    func presentHideSearchView(present: Bool) {
        let alpha: CGFloat = present ? 0.0 : 1.0
        UIView.animate(withDuration: 0.25) {
            self.numberPadView.render().alpha = alpha
            self.localUserAvatarBorder.alpha = alpha
            self.transacteeAvatarBorder.alpha = alpha
            self.balanceLabel.alpha = alpha
            self.localUserNameLabel.alpha = alpha
            self.transacteeNameLabel.alpha = alpha
            self.transferControlButton.alpha = alpha
            self.sendButton.alpha = alpha
            self.searchButton.alpha = alpha
            self.searchView.render().alpha = present ? 1.0 : 0.0
        }
    }
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
    private func displayList() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.containerTopConstraint.constant = Layout.containerRestingTopOffset
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    private func hideList() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.containerTopConstraint.constant = Layout.containerOriginTopOffset
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    private func setViews() {
        title = "TransferView"
        view.backgroundColor = ViewProperties.backgroundColor
        view.add(views: searchView.render(), titleLabel, localUserAvatarBorder, transacteeAvatarBorder, localUserNameLabel, transacteeNameLabel, balanceLabel, numberPadView.render(), transferControlButton, sendButton, searchButton, eventContainer)
        eventContainer.add(views: transferEventCollection)
        titleLabel.constrainInView(view: view, top: Layout.titleTopOffset, left: 0, right: 0)
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
        eventContainer.constrainViewHeight(to: Layout.containerHeight)
        containerTopConstraint = eventContainer.returnConstrainTopToBottom(of: view, constant: Layout.containerOriginTopOffset)
        eventContainer.add(views: containerControlTab)
        containerControlTab.constrainTopToTop(of: eventContainer, constant: Layout.controlBarTopOffset)
        containerControlTab.constrainWidth_Height(width: Layout.controlBarSize.width, height: Layout.controlBarSize.height)
        containerControlTab.constrainCenterXTo(view: eventContainer, constant: 0)
        //
        localUserAvatar.imageView.image = AppImages.person.image()
        transacteeAvatar.imageView.image = AppImages.person.image()
        eventContainer.addSubview(transferEventCollection)
        transferEventCollection.constrainInView(view: eventContainer, left: 0, right: 0, bottom: 0)
        transferEventCollection.constrainTopToBottom(of: containerControlTab, constant: Layout.transferCollectionTopOffset)
        searchView.render().constrainInView(view: view, left: 0, right: 0, bottom: 0)
        searchView.render().constrainTopToBottom(of: titleLabel, constant: Layout.searchViewTopOffset)
        
    }
    private func setGesture() {
        containerPanGesture = UIPanGestureRecognizer(target: self, action: #selector(TransferView.panGesture(_:)))
        eventContainer.addGestureRecognizer(containerPanGesture)
    }
    @objc func panGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: eventContainer).y
        switch gesture.state {
        case .changed:
            if translation <= -Layout.containerHeight*0.5 {
                UIView.animate(withDuration: 0.25) {
                    self.containerTopConstraint.constant = -Layout.containerHeight
                    self.view.layoutIfNeeded()
                }
            } else {
                UIView.animate(withDuration: 0.25) {
                    self.containerTopConstraint.constant = Layout.containerOriginTopOffset + min(0, max(translation, -Layout.containerHeight))
                    self.view.layoutIfNeeded()
                }
            }
            
        case .ended:
            if  containerTopConstraint.constant > -Layout.containerHeight {
                UIView.animate(withDuration: 0.25) {
                    self.containerTopConstraint.constant = Layout.containerOriginTopOffset
                    self.view.layoutIfNeeded()
                }
            }
        default: break
        }
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
