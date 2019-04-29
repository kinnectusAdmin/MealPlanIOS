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
protocol LoginViewType: Presentation, Controller {
    var backButton: UXButton { get set}
    var emailField: UXTextField { get set}
    var loginButton: UXButton { get set}
    var signUpButton: UXButton {get set}
}
class LoginView: UIViewController, LoginViewType {
    private let appIcon: UIImageView = UIImageView.image()
    private let loginTitle: UILabel = UILabel.labelWith(font: ViewProperties.loginTitleFont, txtColor: ViewProperties.loginTitleColor, background: ViewProperties.titleBackground, text: ViewProperties.loginTitle, alignment: .center)
    // MARK: - LoginViewType Properties
    var backButton = Icons.backButton
    var emailField = UXTextField.field(textColor: ViewProperties.emailColor, background: ViewProperties.emailBackground, font: ViewProperties.emailFont, placeholder: ViewProperties.emailPlaceholder, dismissOnEnter: true)
    var passwordField = UXTextField.field(textColor: ViewProperties.passwordColor, background: ViewProperties.passwordBackground, font: ViewProperties.passwordFont, placeholder: ViewProperties.passwordPlaceholder, dismissOnEnter: true)
    var loginButton = UXButton.button(font: ViewProperties.loginButtonFont, color: ViewProperties.loginButtonTitleColor, background: ViewProperties.loginButtonColor, title: ViewProperties.loginButtonTitle, radius: ViewProperties.loginButtonRadius)
    var signUpButton = UXButton.button(font: ViewProperties.signUpButtonFont, color: ViewProperties.signUpButtonColor, background: ViewProperties.signUpButtonBackground, title: ViewProperties.signUpButtonTitle)
    ////
    private let loginContainer: UIView = UIView.container(background: ViewProperties.loginContainerColor, radius: ViewProperties.loginContainerRadius).addingShadow(4, dy: 4, color: .black, radius: 10, opacity: 0.8)
    private let emailSeparatingBar: UIView = UIView.containerView(background: ViewProperties.separationBarColor)
    private let passwordSeparatingBar: UIView = UIView.containerView(background: ViewProperties.separationBarColor)
    private let backgroundImage: UIImageView = Backgrounds.backgroundImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    private func setViews() {
        //TODO: Draw layout
        view.add(views: backgroundImage, loginTitle, backButton, signUpButton, loginContainer)
        loginContainer.add(views: emailField, emailSeparatingBar, passwordField, passwordSeparatingBar, loginButton)
        backgroundImage.constrainInView(view: self.view, top: -50, left: 0, right: 0, bottom: 0)
        signUpButton.constrainInView(view: self.view, top: 10, right: -10)
        backButton.constrainInView(view: self.view, top: 10, left: 10)
        loginTitle.setTopTo(con: self.view.top(), by: 50)
        loginTitle.setXTo(con: self.view.x(), by: 0)
        loginContainer.setTopTo(con: loginTitle.bottom(), by: 20)
        loginContainer.setXTo(con: self.view.x(), by: 0)
        loginContainer.setWidth_Height(width: 300, height: 225)
        emailField.constrainInView(view: loginContainer, top: 20, left: 10, right: -10)
        emailSeparatingBar.setTopTo(con: emailField.bottom(), by: 20)
        emailSeparatingBar.setLeftTo(con: emailField.left(), by: 0)
        emailSeparatingBar.setRightTo(con: emailField.right(), by: 0)
        emailSeparatingBar.setHeightTo(constant: ViewProperties.separationBarHeight)
        passwordField.setTopTo(con: emailSeparatingBar.bottom(), by: 20)
        passwordField.constrainInView(view: loginContainer, left: 10, right: -10)
        passwordSeparatingBar.setTopTo(con: passwordField.bottom(), by: 20)
        passwordSeparatingBar.setHeightTo(constant: ViewProperties.separationBarHeight)
        passwordSeparatingBar.setLeftTo(con: passwordField.left(), by: 0)
        passwordSeparatingBar.setRightTo(con: passwordField.right(), by: 0)
        loginButton.constrainInView(view: loginContainer, left: 50, right: -50, bottom: -10)
        loginButton.setHeightTo(constant: ViewProperties.loginButtonHeight)
    }
}
