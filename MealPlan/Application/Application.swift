//
//  Application.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent
import MealPlanDomain
class Application {
    static var shared: Application = (UIApplication.shared.delegate as? AppDelegate)?.applicationManager ?? Application()
    private var window: UIWindow?
    private var coordinators: [String: Coordinator] = [:]
}
extension Application {
    /// Provide a coordinator if it is held by the Application
    ///
    /// - Parameter type: Coordinators
    /// - Returns: Coordinator (optional)
    func coordinator(type: Objects.Coordinators) -> Coordinator? {
        switch type {
        case .onboard:
            return coordinators[OnboardCoordinator.identifier]
        case .login:
            return coordinators[LoginCoordinator.identifier]
        case .createAccount:
            return coordinators[CreateAccountCoordinator.identifier]
        case .mainNavigation:
            return coordinators[MainNavigationCoordinator.identifier]
        }
    }
    /// Sets primary coordinator of the app and shares window from App Delegate
    ///
    /// - Parameter window: UIWindow
    /// - Returns: Application
    func configureApp(window: UIWindow?) -> Application {
        self.window = window
        let coordinator = CoordinatorProvider.makeMainNavigationCoordinator()
        window?.rootViewController = coordinator.router.controller.view()
        window?.makeKeyAndVisible()
        coordinators[MainNavigationCoordinator.identifier] = coordinator
        return self
    }
}
