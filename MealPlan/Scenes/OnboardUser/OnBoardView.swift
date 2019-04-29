//
//  OnBoardView.swift
//  MealPlan
//
//  Created by blakerogers on 3/1/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent
import Utilities
protocol OnboardViewType: Presentation, Controller {
    var loginButton: UXButton { get set}
    var signUpButton: UXButton { get set}
    var onboardCollection: UXCollectionView<OnboardSectionModel> { get set}
    var indicator: UIPageControl { get set}
}
class OnboardView: UIViewController, OnboardViewType {
    private let appIcon: UIImageView = UIImageView.image()
    private let appTitle: UILabel = UILabel.labelWith(font: ViewProperties.appTitleFont, txtColor: ViewProperties.appTitleColor, background: ViewProperties.appTitleBackground, text: ViewProperties.appTitle, alignment: .center)
    var loginButton = UXButton.button(font: ViewProperties.loginButtonFont, color: ViewProperties.loginButtonTitleColor, title: ViewProperties.loginButtonTitle)
    var signUpButton = UXButton.button(font: ViewProperties.signUpButtonFont, color: ViewProperties.signUpButtonTitleColor, background: ViewProperties.signUpButtonColor, title: ViewProperties.signUpButtonTitle, radius: ViewProperties.signUpButtonRadius)
    private let backgroundImage: UIImageView = Backgrounds.backgroundImage()
    var onboardCollection = UXCollectionView<OnboardSectionModel>(model: OnboardSectionModel(viewState: nil), direction: .horizontal, frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    var indicator: UIPageControl = UIPageControl.view(count: ViewProperties.indicatorCount, firstIndex: 0, tint: ViewProperties.indicatorTints.0, currentTint: ViewProperties.indicatorTints.1)
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    private func setViews() {
        /// TODO: Draw layout
        view.add(views: backgroundImage, loginButton, appIcon, appTitle, signUpButton,onboardCollection, indicator)
        backgroundImage.constrainInView(view: self.view, top: -50, left: 0, right: 0, bottom: 0)
        loginButton.constrainInView(view: self.view, top: 10, right: -10)
        appTitle.constrainInView(view: self.view, top: 100)
        appTitle.setXTo(con: self.view.x(), by: 0)
        appIcon.setWidth_Height(width: ViewProperties.appIconWidthHeight, height: ViewProperties.appIconWidthHeight)
        appIcon.setTopTo(con: appTitle.bottom(), by: 10)
        appIcon.setXTo(con: appTitle.x(), by: 0)
        onboardCollection.constrainInView(view: self.view, left: 0, right: 0, bottom: -100)
        onboardCollection.setTopTo(con: appIcon.bottom(), by: 10)
        indicator.setXTo(con: onboardCollection.x(), by: 0)
        indicator.setTopTo(con: onboardCollection.bottom(), by: 0)
        indicator.setWidth_Height(width: ViewProperties.indicatorWidth, height:ViewProperties.indicatorHeight)
        signUpButton.constrainInView(view: self.view, left: 10, right: -10, bottom: -10)
        signUpButton.setHeightTo(constant: ViewProperties.signUpButtonHeight)
    }
}
