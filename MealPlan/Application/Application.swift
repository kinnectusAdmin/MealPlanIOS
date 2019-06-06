//
//  Application.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
class Application {
    static var shared: Application = Application()
    private var window: UIWindow?
    func configureApp(window: UIWindow?) {
        self.window = window
        let coordinator = CoordinatorProvider.makeMainFeedCoordinator()
        window?.rootViewController = coordinator.router.controller as? UIViewController
        window?.makeKeyAndVisible()
    }
}
