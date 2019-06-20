//
//  MainNavigationViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain

struct MainNavigationViewModel: ViewModelLink {
    
    typealias Link = MainNavigationViewModelLink
    typealias ResultType = Link.MainNavigationResult
    
    static var serviceHandler: ((ServiceIntent?, MainNavigationViewModelLink.ViewStateType) -> Void)?
    
    static var delegateHandler: ((DelegateIntent?, MainNavigationViewModelLink.ViewStateType) -> Void)?
    
    static var initialIntent: MainNavigationViewModelLink.MainNavigationIntent?
    
    static var intentHandler: (MainNavigationViewModelLink.MainNavigationIntent) -> MainNavigationViewModelLink.MainNavigationResult =
    {
        intent in
        switch intent {
        case .didSelectConversion:
            return ResultType.selectPage(.conversion)
        case .didSelectHistory:
            return ResultType.selectPage(.mainView)
        case .didSelectTransfer:
            return ResultType.selectPage(.transfer)
        default: return ResultType.notSet
        }
    }
    
    static var partialResultHandler: (Result) -> MainNavigationViewModelLink.MainNavigationResult? = { _ in return nil}
    
    static func reduce(viewState: MainNavigationViewModelLink.MainNavigationViewState?, result: MainNavigationViewModelLink.MainNavigationResult?) -> MainNavigationViewModelLink.MainNavigationViewState?
    {
        switch result ?? .notSet {
        case let .selectPage(page):
            return Link.MainNavigationViewState.init(page: page)
        default: return viewState
        }
    }
}
struct MainNavigationViewModelLink: ViewStateIntentLink {
    
    typealias ViewStateType = MainNavigationViewState
    typealias IntentType = MainNavigationIntent
    typealias ResultType = MainNavigationResult
    
    
    struct MainNavigationViewState: ViewState {
        let page: Objects.NavigationPage
    }
    enum MainNavigationIntent: Intent, ActionIntent {
        case didSelectHistory
        case didSelectConversion
        case didSelectTransfer
        case didSelectAppMenu
    }
    enum MainNavigationResult: Result {
        case notSet
        case selectPage(Objects.NavigationPage)
    }
}
