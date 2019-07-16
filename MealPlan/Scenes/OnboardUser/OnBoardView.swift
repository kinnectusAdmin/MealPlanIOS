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

class OnboardView: UIViewController, OnboardViewType {
    private let appIcon: UIImageView = UIImageView.image()
    private let appTitle: UILabel = UILabel.labelWith(text: ViewProperties.appTitle, font: ViewProperties.appTitleFont, txtColor: ViewProperties.appTitleColor, background: ViewProperties.appTitleBackground, alignment: .center)
    var loginButton = UXButton.button(font: ViewProperties.loginButtonFont, color: ViewProperties.loginButtonTitleColor, title: ViewProperties.loginButtonTitle)
    var signUpButton = UXButton.button(font: ViewProperties.signUpButtonFont, color: ViewProperties.signUpButtonTitleColor, background: ViewProperties.signUpButtonColor, title: ViewProperties.signUpButtonTitle, radius: Layout.signUpButtonRadius)
    var onboardCollection = UXCollectionView<OnboardSectionModel>(model: OnboardSectionModel(), direction: .horizontal, frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    var indicator: UIPageControl = UIPageControl.view(count: ViewProperties.indicatorCount, firstIndex: 0, tint: ViewProperties.indicatorTints.0, currentTint: ViewProperties.indicatorTints.1)
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    private func setViews() {
        title = "OnboardView"
        /// TODO: Draw layout
        view.backgroundColor = ViewProperties.backgroundColor
        view.add(views: appIcon, appTitle, signUpButton, onboardCollection, indicator, loginButton)
        constrainSubViewSafely(subView: loginButton, top: Layout.loginButtonEdgeOffset, right: -Layout.loginButtonEdgeOffset)
        constrainSubViewSafely(subView: appTitle, top: Layout.appTitleTopOffset)
        appTitle.setXTo(con: self.view.x(), by: 0)
        appIcon.setWidth_Height(width: Layout.appIconWidthHeight, height: Layout.appIconWidthHeight)
        appIcon.setTopTo(con: appTitle.bottom(), by: Layout.appIconTopOffset)
        appIcon.setXTo(con: appTitle.x(), by: 0)
        onboardCollection.constrainInView(view: self.view, left: 0, right: 0, bottom: Layout.collectionBottomOffset)
        onboardCollection.setTopTo(con: appIcon.bottom(), by: Layout.collectionTopOffset)
        indicator.setXTo(con: onboardCollection.x(), by: 0)
        indicator.setTopTo(con: onboardCollection.bottom(), by: 0)
        indicator.setWidth_Height(width: Layout.indicatorWidth, height: Layout.indicatorHeight)
        signUpButton.constrainInView(view: self.view, left: Layout.signUpButtonEdgeOffset, right: -Layout.signUpButtonEdgeOffset, bottom: -Layout.signUpButtonEdgeOffset)
        signUpButton.setHeightTo(constant: Layout.signUpButtonHeight)
    }
}
