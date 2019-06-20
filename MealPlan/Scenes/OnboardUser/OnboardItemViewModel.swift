//
//  OnboardItemViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/7/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain
struct OnboardItemViewModel: ViewModelLink {
    
    typealias Link = OnboardItemViewModelLink
    typealias ViewState = Link.ViewStateType
    typealias ResultType = Link.ResultType
    
    static var intentHandler: (OnboardItemViewModelLink.ItemIntent) -> OnboardItemViewModelLink.ItemResult =
    {
        intent in
        switch intent {
        case let .initial(page):
            return ResultType.initial(page: page)
        default: return ResultType.notSet
        }
    }
    static var partialResultHandler: (Result) -> OnboardItemViewModelLink.ItemResult? = { _ in return nil}
    
    static var serviceHandler: ((ServiceIntent?, OnboardItemViewModelLink.ViewStateType) -> Void)?
    
    static var delegateHandler: ((DelegateIntent?, OnboardItemViewModelLink.ViewStateType) -> Void)?
    
    static var initialIntent: OnboardItemViewModelLink.ItemIntent? = OnboardItemViewModelLink.IntentType.initial(page: .first)
    
    static func reduce(viewState: OnboardItemViewModelLink.ItemViewState?, result: OnboardItemViewModelLink.ItemResult?) -> OnboardItemViewModelLink.ItemViewState? {
        switch result {
        case let .initial(page)?:
            return ViewState(page: page)
        default: return viewState
        }
    }
}
struct OnboardItemViewModelLink: ViewStateIntentLink {
    typealias ViewStateType = ItemViewState
    typealias IntentType = ItemIntent
    typealias ResultType = ItemResult
    
    
    enum ItemIntent: Intent, ActionIntent {
        case initial(page: Objects.OnboardPage)
        case didSelectPage
    }
    enum ItemResult: Result {
        case notSet
        case initial(page: Objects.OnboardPage)
    }
    struct ItemViewState: ViewState {
        let page: Objects.OnboardPage
    }
}
