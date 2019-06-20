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
    typealias ServiceType = NilServiceType
    typealias DelegateType = NilDelegateType
    static var serviceHandler: ((MainFeedViewModelLink.MainFeedIntent, MainFeedViewModelLink.MainFeedViewState, NilServiceType?) -> Void)?
    static var delegateHandler: ((MainFeedViewModelLink.MainFeedIntent, MainFeedViewModelLink.MainFeedViewState, NilDelegateType?) -> Void)?

    static var initialIntent: MainFeedViewModelLink.MainFeedIntent? = .initial(user: MealPlanUser.local)
    
    static var intentHandler: ((MainFeedViewModelLink.MainFeedIntent) -> MainFeedViewModelLink.MainFeedResult)? =
    {
        intent in
        switch intent {
        case let .initial(user):
            return ResultType.initial(user: user)
        default: return ResultType.notSet
        }
    }
    
    static var partialResultHandler: ((Result) -> MainFeedViewModelLink.MainFeedResult?)? 
    
    static func reduce(viewState: MainFeedViewModelLink.MainFeedViewState?, result: MainFeedViewModelLink.MainFeedResult?) -> MainFeedViewModelLink.MainFeedViewState? {
        switch result {
        case let .initial(user)?:
            return Link.ViewStateType(events: [], transferEvents: [], account: StudentAccount.empty, user: user)
        default: return viewState
        }
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
    enum MainFeedIntent: Intent, ActionIntent {
        case initial(user: MealPlanUser)
        case didSelectTransactionDetails
        case didSelectSpendingDetails
    }
    enum MainFeedResult: Result {
        case notSet
        case initial(user: MealPlanUser)
    }
}
