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
        let coordinator = CoordinatorProvider.makeLoginCoordinator()
        window?.rootViewController = coordinator.router.controller.view()
        window?.makeKeyAndVisible()
        coordinators[coordinator.provideIdentifier()] = coordinator
        return self
    }
    /// Presents controller if coordinator exists. Otherwise creates and presents
    ///
    /// - Parameter coordinatorType: Coordinators (enum to identify coordinators)
    private func findAndPush(coordinatorType: Objects.Coordinators) {
        guard let coordinator = coordinator(type: coordinatorType) else {
            switch coordinatorType {
            case .onboard:
                coordinators.updateValue(CoordinatorProvider.makeOnboardCoordinator(), forKey: coordinatorType.identifier())
            case .login:
                coordinators.updateValue(CoordinatorProvider.makeLoginCoordinator(), forKey: coordinatorType.identifier())
            case .createAccount:
                coordinators.updateValue(CoordinatorProvider.makeCreateAccountCoordinator(), forKey: coordinatorType.identifier())
            case .mainNavigation:
                coordinators.updateValue(CoordinatorProvider.makeMainNavigationCoordinator(), forKey: coordinatorType.identifier())
            }

            window?.rootViewController = coordinators[coordinatorType.identifier()]?.controller().view()
            window?.makeKeyAndVisible()
            return
        }
        window?.rootViewController = coordinator.controller().view()
        window?.makeKeyAndVisible()
    }
    /// Find and present main navigation
    func presentMainNavigation() {
        findAndPush(coordinatorType: .mainNavigation)
    }
    /// Find and present login
    func presentLogin() {
        findAndPush(coordinatorType: .login)
    }
    /// Find and present create account
    func presentCreateAccount() {
       findAndPush(coordinatorType: .createAccount)
    }
    /// Find and present onboarding
    func presentOnboarding() {
        findAndPush(coordinatorType: .onboard)
    }
}
