//
//  MenuView.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import UIKit
import CleanModelViewIntent
import Utilities

class MenuView: UIViewController, MenuViewType {
    
    var profileImage: UXImage = UXImage.image(mode: .scaleAspectFill, radius: Layout.profileImageRadius)
    
    var nameLabel: UILabel = UILabel.labelWith(text: "User Name", font: ViewProperties.infoFont, txtColor: ViewProperties.infoColor, background: .clear, alignment: .center)
    
    var schoolLabel: UILabel = UILabel.labelWith(text: "School", font: ViewProperties.infoFont, txtColor: ViewProperties.infoColor, background: .clear, alignment: .center)
    
    var mealPlanLabel: UILabel = UILabel.labelWith(text: "Meal Plan", font: ViewProperties.infoFont, txtColor: ViewProperties.infoColor, background: .clear, alignment: .center)
    
    var emailLabel: UILabel = UILabel.labelWith(text: "Email", font: ViewProperties.infoFont, txtColor: ViewProperties.infoColor, background: .clear, alignment: .center)
    
    var legalButton: UXButton = UXButton.button(font: ViewProperties.infoFont, color: ViewProperties.infoColor, background: .clear, title: "Legal")
    
    var logoutButton: UXButton = UXButton.button(font: ViewProperties.infoFont, color: ViewProperties.infoColor, background: .clear, title: "Log Out")
    
    var dismissButton: UXButton = Icons.dropDownButton
    
    private let container: UIView = UIView.containerView(background: ViewProperties.containerBackground, radius: Layout.containerRadius, borderWidth: 1.0, borderColor: ViewProperties.containerBorderColor)
    
    private let blurView = UIVisualEffectView.view(style: .light, radius: Layout.containerRadius)
    private var containerTopConstraint = NSLayoutConstraint()
    private var containerPanGesture: UIPanGestureRecognizer!
}
extension MenuView {
    override func loadView() {
        super.loadView()
        setViews()
        setGesture()
    }
    private func setViews() {
        view.backgroundColor = .white
        view.add(views: container)
        container.add(views: blurView, dismissButton, profileImage.imageView, nameLabel, schoolLabel, mealPlanLabel, emailLabel, legalButton, logoutButton)
        container.constrainInView(view: view, left: 0, right: 0)
        container.constrainViewHeight(to: Layout.containerHeight)
        containerTopConstraint = container.returnConstrainTopToBottom(of: view, constant: Layout.containerOriginTopOffset)
        blurView.constrainInView(view: container, top: 0, left: 0, right: 0, bottom: 0)
        dismissButton.constrainTopToTop(of: container, constant: Layout.dismissTopOffset)
        dismissButton.constrainCenterXTo(view: container, constant: 0)
        profileImage.imageView.constrainInView(view: container, top: Layout.imageTopOffset)
        profileImage.imageView.constrainCenterXTo(view: container, constant: 0)
        profileImage.imageView.constrainWidth_Height(width: Layout.profileImageSize, height: Layout.profileImageSize)
        nameLabel.constrainCenterXTo(view: container, constant: 0)
        nameLabel.constrainTopToBottom(of: profileImage.imageView, constant: Layout.nameTopOffset)
        schoolLabel.constrainCenterXTo(view: container, constant: 0)
        schoolLabel.constrainTopToBottom(of: nameLabel, constant: Layout.infoTopOffset)
        mealPlanLabel.constrainCenterXTo(view: container, constant: 0)
        mealPlanLabel.constrainTopToBottom(of: schoolLabel, constant: Layout.infoTopOffset)
        emailLabel.constrainCenterXTo(view: container, constant: 0)
        emailLabel.constrainTopToBottom(of: mealPlanLabel, constant: Layout.infoTopOffset)
        legalButton.constrainCenterXTo(view: container, constant: 0)
        legalButton.constrainTopToBottom(of: emailLabel, constant: Layout.infoTopOffset)
        logoutButton.constrainCenterXTo(view: container, constant: 0)
        logoutButton.constrainBottomToBottom(of: container, constant: Layout.logoutBottomOffset)
        profileImage.imageView.image = AppImages.person.image()
    }
    private func setGesture() {
        containerPanGesture = UIPanGestureRecognizer(target: self, action: #selector(MenuView.panGesture(_:)))
        container.addGestureRecognizer(containerPanGesture)
    }
    @objc func panGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: container).y
        switch gesture.state {
        case .changed:
            if translation <= -Layout.containerHeight*0.5 {
                UIView.animate(withDuration: 0.25) {
                    self.containerTopConstraint.constant = Layout.containerOffsetLimit
                    self.view.layoutIfNeeded()
                }
            } else {
                UIView.animate(withDuration: 0.25) {
                    self.containerTopConstraint.constant = Layout.containerOriginTopOffset + min(0, max(translation, -Layout.containerHeight))
                    self.view.layoutIfNeeded()
                }
            }
        case .ended:
            if  containerTopConstraint.constant > Layout.containerOffsetLimit {
                UIView.animate(withDuration: 0.25) {
                    self.containerTopConstraint.constant = Layout.containerOriginTopOffset
                    self.view.layoutIfNeeded()
                }
            }
        default: break
        }
    }
}
