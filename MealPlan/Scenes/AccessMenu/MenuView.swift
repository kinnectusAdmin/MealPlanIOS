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
    
    var logoutButton: UXButton = UXButton.button(font: ViewProperties.logoutFont, color: ViewProperties.logoutColor, background: .clear, title: "Log Out")
    
}
extension MenuView {
    override func loadView() {
        super.loadView()
        setViews()
    }
    private func setViews() {
        title = "MenuView"
        view.backgroundColor = ViewProperties.background
        view.add(views: profileImage.imageView, nameLabel, schoolLabel, mealPlanLabel, emailLabel, legalButton, logoutButton)
        profileImage.imageView.constrainInView(view: view, top: Layout.imageTopOffset)
        profileImage.imageView.constrainCenterXTo(view: view, constant: 0)
        profileImage.imageView.constrainWidth_Height(width: Layout.profileImageSize, height: Layout.profileImageSize)
        nameLabel.constrainCenterXTo(view: view, constant: 0)
        nameLabel.constrainTopToBottom(of: profileImage.imageView, constant: Layout.nameTopOffset)
        schoolLabel.constrainCenterXTo(view: view, constant: 0)
        schoolLabel.constrainTopToBottom(of: nameLabel, constant: Layout.infoTopOffset)
        mealPlanLabel.constrainCenterXTo(view: view, constant: 0)
        mealPlanLabel.constrainTopToBottom(of: schoolLabel, constant: Layout.infoTopOffset)
        emailLabel.constrainCenterXTo(view: view, constant: 0)
        emailLabel.constrainTopToBottom(of: mealPlanLabel, constant: Layout.infoTopOffset)
        legalButton.constrainCenterXTo(view: view, constant: 0)
        legalButton.constrainTopToBottom(of: emailLabel, constant: Layout.infoTopOffset)
        logoutButton.constrainCenterXTo(view: view, constant: 0)
        logoutButton.constrainBottomToBottom(of: view, constant: Layout.logoutBottomOffset)
        profileImage.imageView.image = AppImages.person.image()
    }
}
