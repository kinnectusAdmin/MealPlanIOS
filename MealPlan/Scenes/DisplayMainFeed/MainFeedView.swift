//
//  MainFeedView.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities
import CleanModelViewIntent

class MainFeedView: UIViewController, MainFeedViewType {
    var welcomeLabel: UILabel = UILabel.labelWith(font: ViewProperties.welcomeFont, txtColor: ViewProperties.welcomeColor, background: ViewProperties.welcomeBackground, alignment: .center, numberOfLines: 0)
    var navigationView: NavigationView = NavigationView.view()
    var mainFeedCollectionView = UXCollectionView<MainFeedSectionModel>(model: nil, frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    
}
extension MainFeedView {
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    func setViews() {
        view.backgroundColor = UIColor.App.currentScheme.colors.light
        view.add(views: mainFeedCollectionView, navigationView, welcomeLabel)
        mainFeedCollectionView.constrainInView(view: self.view, top: 0, left: 0, right: 0, bottom: 0)
        navigationView.constrainInView(view: self.view, left: 0, right: 0, bottom: 0)
        navigationView.setHeightTo(constant: Layout.navigationViewHeight)
        welcomeLabel.constrainInView(view: self.view, left: 0, right: 0)
        welcomeLabel.setHeightTo(constant: Layout.welcomeLabelHeight)
        welcomeLabel.setBottomTo(con: navigationView.top(), by: Layout.welcomeLabelBottomOffset)
    }
}
