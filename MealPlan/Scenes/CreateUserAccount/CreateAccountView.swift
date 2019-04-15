//
//  CreateAccountView.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import Utilities

class CreateAccountView: UIViewController, Presentation {
    private let accountTitle: UILabel = UILabel.labelWith(font: ViewProperties.titleFont, txtColor: ViewProperties.titleColor, background: ViewProperties.titleBackground, text: ViewProperties.title, alignment: .center)
    let emailField = UXTextField.field(textColor: ViewProperties.emailColor, background: ViewProperties.emailBackground, font: ViewProperties.emailFont, placeholder: ViewProperties.emailPlaceholder, dismissOnEnter: true)
    let passwordField = UXTextField.field(textColor: ViewProperties.passwordColor, background: ViewProperties.passwordBackground, font: ViewProperties.passwordFont, placeholder: ViewProperties.passwordPlaceholder, dismissOnEnter: true)
    let emailSeparatingBar: UIView = UIView.containerView(background: ViewProperties.separationBarColor)
    let passwordSeparatingBar: UIView = UIView.containerView(background: ViewProperties.separationBarColor)
    var loginButton = UXButton.button(font: ViewProperties.loginButtonFont, color: ViewProperties.loginButtonTitleColor, title: ViewProperties.loginButtonTitle)
    let createButton = UXButton.button(font: ViewProperties.createButtonFont, color: ViewProperties.createButtonTitleColor, background: ViewProperties.createButtonColor, title: ViewProperties.createButtonTitle, radius: ViewProperties.createButtonRadius)
    let backgroundImage: UIImageView = Backgrounds.backgroundImage()
    let backButton = Icons.backButton
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    func setViews() {
        //TODO: Draw layout
        view.add(views: backgroundImage, accountTitle, emailField, emailSeparatingBar, passwordField, passwordSeparatingBar, loginButton, backButton, createButton)
        backgroundImage.constrainInView(view: self.view, top: -50, left: 0, right: 0, bottom: 0)
        loginButton.constrainInView(view: self.view, top: 10, right: -10)
        backButton.constrainInView(view: self.view, top: 10, left: 10)
        accountTitle.setTopTo(con: self.view.top(), by: 50)
        accountTitle.setXTo(con: self.view.x(), by: 0)
        emailField.setTopTo(con: accountTitle.bottom(), by: 50)
        emailField.constrainInView(view: self.view, left: 10, right: -10)
        emailSeparatingBar.setTopTo(con: emailField.bottom(), by: 10)
        emailSeparatingBar.setLeftTo(con: emailField.left(), by: 0)
        emailSeparatingBar.setRightTo(con: emailField.right(), by: 0)
        emailSeparatingBar.setHeightTo(constant: ViewProperties.separationBarHeight)
        passwordField.setTopTo(con: emailSeparatingBar.bottom(), by: 10)
        passwordField.constrainInView(view: self.view, left: 10, right: -10)
        passwordSeparatingBar.setTopTo(con: passwordField.bottom(), by: 10)
        passwordSeparatingBar.setHeightTo(constant: ViewProperties.separationBarHeight)
        passwordSeparatingBar.setLeftTo(con: passwordField.left(), by: 0)
        passwordSeparatingBar.setRightTo(con: passwordField.right(), by: 0)
        createButton.constrainInView(view: self.view, left: 10, right: -10, bottom: -10)
        createButton.setHeightTo(constant: ViewProperties.createButtonHeight)
    }
}
