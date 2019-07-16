//
//  AlertingView.swift
//  MealPlan
//
//  Created by blakerogers on 7/14/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities

class AlertingView: UIView {
    
    private let alertScreen: UIView = UIView.vibrantContainerView(background: .clear)
    
    let acceptButton: UXButton! = UXButton.button(font: UIFont.App.currentFont.fonts.medium, color: UIColor.App.currentScheme.colors.dark, background: .clear)
    
    let declineButton: UXButton! = UXButton.button(font: UIFont.App.currentFont.fonts.medium, color: UIColor.App.currentScheme.colors.dark, background: .clear)
    
    var acknowledgeAlertButton: UXButton! = UXButton.icon(icon: .minus, size: .small, tint: UIColor.App.currentScheme.colors.dark)
    
    private let alertContainer = UIView.containerView(background: .white, radius: 10, borderWidth: 1.0, borderColor: .black)
    
    private let alertLabel = UILabel.labelWith(font: UIFont.App.currentFont.fonts.small, txtColor: UIColor.App.currentScheme.colors.dark, background: .clear, alignment: .center, numberOfLines: 0)
}
extension AlertingView {
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    private func setViews() {
        add(views: alertScreen)
        alertScreen.constrainInView(view: self, top: 0, left: 0, right: 0, bottom: 0)
    }
    func showAlert(message: String) {
        alertScreen.add(views: alertContainer, alertLabel)
        alertLabel.text = message
        alertLabel.constrainCenterToCenter(of: alertScreen)
        alertContainer.constrainCenterToCenter(of: alertScreen)
        let height = message.rectForText(width: UIScreen.main.bounds.width, textSize: 20).height
        alertContainer.constrainWidth_Height(width: 250, height: height*2)
        alpha = 1.0
    }
    func dismissAlert() {
        alertContainer.removeFromSuperview()
        alertLabel.removeFromSuperview()
        alpha = 0.0
    }
    func alert(message: String, acceptText: String?, declineText: String?) {
        alertLabel.text = message
        alertScreen.add(views: alertContainer, alertLabel)
        alertContainer.constrainCenterToCenter(of: alertScreen)
        let height = message.rectForText(width: UIScreen.main.bounds.width, textSize: 20).height
        alertContainer.constrainWidth_Height(width: 250, height: height+100)
        acceptButton.updateAttributedTitle(title: acceptText ?? "")
        declineButton.updateAttributedTitle(title: declineText ?? "")
        if acceptText != nil && declineText != nil {
            alertContainer.add(views: acceptButton, declineButton)
            alertLabel.constrainInView(view: alertContainer, top: 20, left: 0, right: 0)
            acceptButton.constrainBottomToBottom(of: alertContainer, constant: -10)
            declineButton.constrainBottomToBottom(of: alertContainer, constant: -10)
            acceptButton.constrainRightToRight(of: alertContainer, constant: -10)
            declineButton.constrainLeftToLeft(of: alertContainer, constant: 10)
        } else if acceptText != nil {
            alertContainer.add(views: acknowledgeAlertButton)
            alertLabel.constrainCenterToCenter(of: alertContainer)
            acceptButton.removeFromSuperview()
            declineButton.removeFromSuperview()
            acknowledgeAlertButton.constrainInView(view: alertContainer, top: 10, right: -10)
            acknowledgeAlertButton.constrainWidth_Height(width: 20, height: 20)
        }
        alpha = 1.0
    }
}
