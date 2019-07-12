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

class CreateAccountView: UIViewController, CreateAccountViewType {
    // MARK: - Create Account ViewType Properties
    var emailField = UXTextField.field(textColor: ViewProperties.emailColor, background: ViewProperties.emailBackground, font: ViewProperties.emailFont, placeholder: ViewProperties.emailPlaceholder, dismissOnEnter: true)
    var passwordField = UXTextField.field(textColor: ViewProperties.passwordColor, background: ViewProperties.passwordBackground, font: ViewProperties.passwordFont, placeholder: ViewProperties.passwordPlaceholder, dismissOnEnter: true)
    var loginButton = UXButton.button(font: ViewProperties.loginButtonFont, color: ViewProperties.loginButtonTitleColor, title: ViewProperties.loginButtonTitle)
    var createButton = UXButton.button(font: ViewProperties.createButtonFont, color: ViewProperties.createButtonTitleColor, background: ViewProperties.createButtonColor, title: ViewProperties.createButtonTitle, radius: Layout.createButtonRadius)
    var backButton = Icons.backButton
    var alertScreen: UIView = UIView.containerView(background: ViewProperties.alertScreenColor)
    private let accountTitle: UILabel = UILabel.labelWith( text: ViewProperties.title, font: ViewProperties.titleFont, txtColor: ViewProperties.titleColor, background: ViewProperties.titleBackground, alignment: .center)
    private let emailSeparatingBar: UIView = UIView.containerView(background: ViewProperties.separationBarColor)
    private let passwordSeparatingBar: UIView = UIView.containerView(background: ViewProperties.separationBarColor)
    private let backgroundImage: UIImageView = Backgrounds.backgroundImage()
}
extension CreateAccountView {
    func showAlert(message: String) {
        let alertContainer = UIView.containerView(background: .white, radius: 10, borderWidth: 1.0, borderColor: .black)
        let alertLabel = UILabel.labelWith(text: message, font: UIFont.App.currentFont.fonts.small, txtColor: UIColor.App.currentScheme.colors.dark, background: .clear, alignment: .center)
        alertScreen.add(views: alertContainer, alertLabel)
        alertLabel.constrainCenterToCenter(of: alertScreen)
        alertContainer.constrainCenterToCenter(of: alertScreen)
        let height = message.rectForText(width: UIScreen.main.bounds.width, textSize: 20).height
        alertContainer.constrainWidth_Height(width: 250, height: height)
        view.add(views: alertScreen)
        alertScreen.constrainInView(view: view, top: 0, left: 0, right: 0, bottom: 0)
    }
}
extension CreateAccountView {
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    private func setViews() {
        title = "CreateAccountView"
        //TODO: Draw layout
        view.backgroundColor = ViewProperties.backgroundColor
        view.add(views: accountTitle, emailField, emailSeparatingBar, passwordField, passwordSeparatingBar, loginButton, backButton, createButton)
        loginButton.constrainInView(view: self.view, top: Layout.loginButtonEdgeOffset.top, right: Layout.loginButtonEdgeOffset.right)
        backButton.constrainInView(view: self.view, top: Layout.backButtonEdgeOffset.top, left: Layout.backButtonEdgeOffset.left)
        accountTitle.setTopTo(con: self.view.top(), by: Layout.accountTitleTopOffset)
        accountTitle.setXTo(con: self.view.x(), by: 0)
        emailField.setTopTo(con: accountTitle.bottom(), by: Layout.emailEdgeOffset.top)
        emailField.constrainInView(view: self.view, left: Layout.emailEdgeOffset.left, right: Layout.emailEdgeOffset.right)
        emailSeparatingBar.setTopTo(con: emailField.bottom(), by: Layout.emailBarTopOffset)
        emailSeparatingBar.setLeftTo(con: emailField.left(), by: 0)
        emailSeparatingBar.setRightTo(con: emailField.right(), by: 0)
        emailSeparatingBar.setHeightTo(constant: Layout.separationBarHeight)
        passwordField.setTopTo(con: emailSeparatingBar.bottom(), by: Layout.passwordEdgeOffset.top)
        passwordField.constrainInView(view: self.view, left: Layout.passwordEdgeOffset.left, right: Layout.passwordEdgeOffset.right)
        passwordSeparatingBar.setTopTo(con: passwordField.bottom(), by: Layout.passwordBarTopOffset)
        passwordSeparatingBar.setHeightTo(constant: Layout.separationBarHeight)
        passwordSeparatingBar.setLeftTo(con: passwordField.left(), by: 0)
        passwordSeparatingBar.setRightTo(con: passwordField.right(), by: 0)
        createButton.constrainInView(view: self.view, left: Layout.createButtonEdgeOffset.left, right: Layout.createButtonEdgeOffset.right, bottom: Layout.createButtonEdgeOffset.bottom)
        createButton.setHeightTo(constant: Layout.createButtonHeight)
    }
}
