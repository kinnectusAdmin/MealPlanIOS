//
//  MainNavigationView.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent

class MainNavigationView: UIPageViewController, MainNavigationViewType {
    var welcomeLabel: UILabel = UILabel.labelWith(font: ViewProperties.welcomeFont, txtColor: ViewProperties.welcomeColor, background: ViewProperties.welcomeBackground, alignment: .center, numberOfLines: 0)
    var navigationView: NavigationView = NavigationView.view()
}
extension MainNavigationView {
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    func setViews() {
        title = "MainNavigationView"
        view.backgroundColor = UIColor.App.currentScheme.colors.light
        view.add(views: navigationView, welcomeLabel)
        navigationView.constrainInView(view: self.view, left: 0, right: 0, bottom: 0)
        navigationView.setHeightTo(constant: Layout.navigationViewHeight)
        navigationView.addSubview(welcomeLabel)
        welcomeLabel.constrainCenterXTo(view: navigationView, constant: 0)
        welcomeLabel.constrainTopToTop(of: navigationView, constant: Layout.welcomeLabelTopOffset)
    }
}
extension MainNavigationView {
    func setController(controller: UIViewController?, isForward: Bool) {
        if let controller = controller {
            setViewControllers([controller], direction: isForward ? .reverse : .forward, animated: true, completion: nil)
        }
    }
}
