//
//  LoginView.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent
import Utilities

class LoginView: UIViewController, LoginViewType {
    private let appIcon: UIImageView = UIImageView.image()
    private let loginTitle: UILabel = UILabel.labelWith(text: ViewProperties.loginTitle, font: ViewProperties.loginTitleFont, txtColor: ViewProperties.loginTitleColor, background: ViewProperties.titleBackground, alignment: .center)
    // MARK: - LoginViewType Properties
    var backButton = Icons.backButton
    var emailField = UXTextField.field(textColor: ViewProperties.emailColor, background: ViewProperties.emailBackground, font: ViewProperties.emailFont, placeholder: ViewProperties.emailPlaceholder, dismissOnEnter: true)
    var passwordField = UXTextField.field(textColor: ViewProperties.passwordColor, background: ViewProperties.passwordBackground, font: ViewProperties.passwordFont, placeholder: ViewProperties.passwordPlaceholder, dismissOnEnter: true)
    var loginButton = UXButton.button(font: ViewProperties.loginButtonFont, color: ViewProperties.loginButtonTitleColor, background: ViewProperties.loginButtonColor, title: ViewProperties.loginButtonTitle, radius: Layout.loginButtonRadius)
    var signUpButton = UXButton.button(font: ViewProperties.signUpButtonFont, color: ViewProperties.signUpButtonColor, background: ViewProperties.signUpButtonBackground, title: ViewProperties.signUpButtonTitle)
    var alertScreen: UIView = UIView.containerView(background: ViewProperties.alertScreenColor)
    private let loginContainer: UIView = UIView.container(background: ViewProperties.loginContainerColor, radius: Layout.loginContainerRadius).addingShadow(4, dy: 4, color: ViewProperties.loginContainerShadow, radius: 10, opacity: 0.8)
    private let emailSeparatingBar: UIView = UIView.containerView(background: ViewProperties.separationBarColor)
    private let passwordSeparatingBar: UIView = UIView.containerView(background: ViewProperties.separationBarColor)
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    private func setViews() {
        title = "LoginView"
        //TODO: Draw layout
        view.backgroundColor = ViewProperties.backgroundColor
        view.add(views: loginTitle, backButton, signUpButton, loginContainer)
        loginContainer.add(views: emailField, emailSeparatingBar, passwordField, passwordSeparatingBar, loginButton)
        signUpButton.constrainInView(view: self.view, top: Layout.signUpButtonEdgeOffset.top, right: Layout.signUpButtonEdgeOffset.right)
        backButton.constrainInView(view: self.view, top: Layout.backButtonEdgeOffset, left: Layout.backButtonEdgeOffset)
        loginTitle.setTopTo(con: self.view.top(), by: Layout.loginTitleEdgeOffset.top)
        loginTitle.setXTo(con: self.view.x(), by: 0)
        loginContainer.setTopTo(con: loginTitle.bottom(), by: Layout.loginContainerEdgeOffset.top)
        loginContainer.setXTo(con: self.view.x(), by: 0)
        loginContainer.setWidth_Height(width: Layout.loginContainerWidth_Height.width, height: Layout.loginContainerWidth_Height.height)
        emailField.constrainInView(view: loginContainer, top: Layout.emailFieldEdgeOffset.top, left: Layout.emailFieldEdgeOffset.left, right: Layout.emailFieldEdgeOffset.right)
        emailSeparatingBar.setTopTo(con: emailField.bottom(), by: Layout.separatingBarTopOffset)
        emailSeparatingBar.setLeftTo(con: emailField.left(), by: 0)
        emailSeparatingBar.setRightTo(con: emailField.right(), by: 0)
        emailSeparatingBar.setHeightTo(constant: Layout.separationBarHeight)
        passwordField.setTopTo(con: emailSeparatingBar.bottom(), by: Layout.passwordTopOffset)
        passwordField.constrainInView(view: loginContainer, left: Layout.passwordEdgeOffset.left, right: Layout.passwordEdgeOffset.right)
        passwordSeparatingBar.setTopTo(con: passwordField.bottom(), by: Layout.passwordBarTopOffset)
        passwordSeparatingBar.setHeightTo(constant: Layout.separationBarHeight)
        passwordSeparatingBar.setLeftTo(con: passwordField.left(), by: 0)
        passwordSeparatingBar.setRightTo(con: passwordField.right(), by: 0)
        loginButton.constrainInView(view: loginContainer, left: Layout.loginButtonEdgeOffset.left, right: Layout.loginButtonEdgeOffset.right, bottom: Layout.loginButtonEdgeOffset.bottom)
        loginButton.setHeightTo(constant: Layout.loginButtonHeight)
    }
}
extension LoginView {
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
