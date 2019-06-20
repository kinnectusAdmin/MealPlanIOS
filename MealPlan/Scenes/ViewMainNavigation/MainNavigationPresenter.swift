//
//  MainNavigationPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import Foundation
import CleanModelViewIntent
struct MainNavigationPresenter: PresenterLink {
    typealias Link = MainNavigationViewModelLink
    typealias View = MainNavigationViewType
    static var action: (Link.ViewStateType?, Link.ViewStateType?, View) -> Void =
    { state, prevState,view in
        guard let page = state?.page , let prevPage = prevState?.page else { return }
        switch page {
        case .mainView:
            view.setController(controller: MainNavigationCoordinator.mainFeedController()?.view(), isForward: prevPage.isAfter(page))
        case .conversion:
            view.setController(controller: MainNavigationCoordinator.conversionController()?.view(), isForward: prevPage.isAfter(page))
        case .transfer:
            view.setController(controller: MainNavigationCoordinator.transferController()?.view(), isForward: prevPage.isAfter(page))
        case .menu:
            view.setController(controller: MainNavigationCoordinator.menuController()?.view(), isForward: prevPage.isAfter(page))
        }
    }
    static var interaction: (MainNavigationViewType, Box<Link.IntentType?>) -> Void =
    { view, interactor in
        view.navigationView.menuButton.setAction({
            interactor.accept(.didSelectAppMenu)
        })
        view.navigationView.historyButton.setAction({
            interactor.accept(.didSelectHistory)
        })
        view.navigationView.conversionButton.setAction({
            interactor.accept(.didSelectConversion)
        })
        view.navigationView.transferButton.setAction({
            interactor.accept(.didSelectTransfer)
        })
    }
}
