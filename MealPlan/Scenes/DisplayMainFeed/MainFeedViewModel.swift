//
//  MainFeedViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain
struct MainFeedViewModel: ViewModelLink {
    
    typealias Link = MainFeedViewModelLink
    typealias ResultType = Link.ResultType
    
    static var serviceHandler: ((ServiceIntent?, MainFeedViewModelLink.ViewStateType) -> Void)?

    static var delegateHandler: ((DelegateIntent?, MainFeedViewModelLink.ViewStateType) -> Void)?

    static var initialIntent: MainFeedViewModelLink.MainFeedIntent?
    
    static var intentHandler: (MainFeedViewModelLink.MainFeedIntent) -> MainFeedViewModelLink.MainFeedResult =
    {
        intent in
        switch intent {
        default: return ResultType.notSet
        }
    }
    
    static var partialResultHandler: (Result) -> MainFeedViewModelLink.MainFeedResult? = { _ in return nil}
    
    static func reduce(viewState: MainFeedViewModelLink.MainFeedViewState?, result: MainFeedViewModelLink.MainFeedResult?) -> MainFeedViewModelLink.MainFeedViewState? {
        return viewState
    }
    
    
}
struct MainFeedViewModelLink: ViewStateIntentLink {
    
    typealias ViewStateType = MainFeedViewState
    typealias IntentType = MainFeedIntent
    typealias ResultType = MainFeedResult
    
    struct MainFeedViewState: ViewState {
        let events: [EventType]
        let transferEvents: [TransferEvent]
        let account: StudentAccount
        let user: MealPlanUser
    }
    enum MainFeedIntent: Intent {
        case didSelectTransactionDetails
        case didSelectSpendingDetails
    }
    enum MainFeedResult: Result {
        case notSet
    }
}
