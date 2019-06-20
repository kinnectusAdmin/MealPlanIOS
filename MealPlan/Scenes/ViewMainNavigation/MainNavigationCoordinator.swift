//
//  MainNavigationCoordinator.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent
import MealPlanDomain

final class MainNavigationCoordinator: NSObject, SceneCoordinator {
    typealias Link = MainNavigationViewModel
    typealias ViewLink = MainNavigationPresenter
    typealias RouteLink = MainNavigationRouter
    var parentCoordinator: Coordinator?
    var coordinators: [String : Coordinator] = CoordinatorProvider.provideMainCoordinators()
    var viewModel: MVIViewModelType!
    var presenter: Presenter<ViewLink>!
    var router: Router<MainNavigationRouter>!
    private lazy var navigationController: UIPageViewController = {
        let controller = MainNavigationView(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        controller.setViewControllers([fetch(identifier: MainFeedCoordinator.identifier)!.controller().view()], direction: .forward, animated: false, completion: nil)
        controller.delegate = self
        controller.dataSource = self
        return controller
    }()
    func controller() -> Controller {
        return presenter?.presentation ?? navigationController
    }
}
extension MainNavigationCoordinator {
    static func mainFeedController() -> Controller? {
        let application = Application.shared
    return application.coordinator(type: .mainNavigation)?
        .coordinators[MainFeedCoordinator.identifier]?.controller().view()
    }
    static func conversionController() -> Controller? {
        let application = Application.shared
        return application.coordinator(type: .mainNavigation)?
            .coordinators[ConversionCoordinator.identifier]?.controller().view()
    }
    static func transferController() -> Controller? {
        let application = Application.shared
        return application.coordinator(type: .mainNavigation)?
            .coordinators[TransferCoordinator.identifier]?.controller().view()
    }
    static func menuController() -> Controller? {
        let application = Application.shared
        return application.coordinator(type: .mainNavigation)?
            .coordinators[MenuCoordinator.identifier]?.controller().view()
    }
}
extension MainNavigationCoordinator: UIPageViewControllerDelegate {
    
}
extension MainNavigationCoordinator: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        switch viewController.identifier {
        case Objects.NavigationPage.mainView.id:
            return nil
        case Objects.NavigationPage.transfer.id:
            return coordinators[MainFeedCoordinator.identifier]?.controller().view()
        case Objects.NavigationPage.conversion.id:
            return coordinators[TransferCoordinator.identifier]?.controller().view()
        case Objects.NavigationPage.menu.id:
            return coordinators[ConversionCoordinator.identifier]?.controller().view()
        default:
            return nil
        }
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        switch viewController.identifier {
        case Objects.NavigationPage.mainView.id:
            return coordinators[TransferCoordinator.identifier]?.controller().view()
        case Objects.NavigationPage.transfer.id:
            return coordinators[ConversionCoordinator.identifier]?.controller().view()
        case Objects.NavigationPage.conversion.id:
            return coordinators[MenuCoordinator.identifier]?.controller().view()
        case Objects.NavigationPage.menu.id:
            return nil
        default:
            return nil
        }
    }
}
