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
import MealPlanNetwork

struct MainFeedViewModel: ViewModelLink {
    
    typealias Link = MainFeedViewModelLink
    typealias ResultType = Link.ResultType
    typealias ServiceType = MealPlanNetwork.MainFeedUseCase
    typealias DelegateType = NilDelegateType
    
    static var serviceHandler: ((MainFeedViewModelLink.MainFeedIntent, MainFeedViewModelLink.MainFeedViewState, MealPlanNetwork.MainFeedUseCase?) -> Void)? =
    {
        intent, viewState, service in
        switch intent {
        case let .initial(user):
            service?.fetchStudentAccount(id: "")
            service?.fetchDiningEvents(userID: "")
        default: break
        }
    }
    
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
    
    static var partialResultHandler: ((Result) -> MainFeedViewModelLink.MainFeedResult?)? =
    {
        result in
        switch result as? MealPlanNetwork.EventNetwork.EventNetworkResult {
        case let .didFetchDiningEvents(events)?:
            return ResultType.updateDiningEvents(events: events)
        case .fetchDiningEventsFailure?:
            return ResultType.notSet
        default: break
        }
        switch result as? MealPlanNetwork.StudentAccountNetwork.StudentAccountNetworkResult {
        case let .didFetchStudentAccount(account)?:
            return ResultType.updateAccount(account: account)
        default: return ResultType.notSet
        }
    }
    
    static func reduce(viewState: MainFeedViewModelLink.MainFeedViewState?, result: MainFeedViewModelLink.MainFeedResult?) -> MainFeedViewModelLink.MainFeedViewState? {
        guard let state = viewState else { return Link.ViewStateType.empty}
        switch result {
        case let .initial(user)?:
            return Link.ViewStateType(events: [], transferEvents: [], account: StudentAccount.empty, user: user)
        case let .updateAccount(account)?:
            return Link.ViewStateType(events: state.events, transferEvents: state.transferEvents, account: account, user: state.user)
        case let .updateDiningEvents(events)?:
            return Link.ViewStateType(events: events, transferEvents: state.transferEvents, account: state.account, user: state.user)
        default: return viewState
        }
    }
}
struct MainFeedViewModelLink: ViewStateIntentLink {
    
    typealias ViewStateType = MainFeedViewState
    typealias IntentType = MainFeedIntent
    typealias ResultType = MainFeedResult
    
    struct MainFeedViewState: ViewState {
        let events: [DiningEvent]
        let transferEvents: [TransferEvent]
        let account: StudentAccount
        let user: MealPlanUser
        static let empty: MainFeedViewState = MainFeedViewState(events: [], transferEvents: [], account: StudentAccount.empty, user: MealPlanUser.empty)
    }
    enum MainFeedIntent: Intent, ActionIntent {
        case initial(user: MealPlanUser)
        case didSelectTransactionDetails
        case didSelectSpendingDetails
    }
    enum MainFeedResult: Result {
        case notSet
        case initial(user: MealPlanUser)
        case updateAccount(account: StudentAccount)
        case updateDiningEvents(events: [DiningEvent])
    }
}
