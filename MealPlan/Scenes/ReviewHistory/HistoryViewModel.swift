//
//  HistoryViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import MealPlanDomain
import CleanModelViewIntent
struct HistoryViewModel: ViewModelLink {
    
    typealias Link = HistoryViewModelLink
    typealias ResultType = Link.ResultType
    typealias ServiceType = NilServiceType
    typealias DelegateType = NilDelegateType
    
    static var serviceHandler: ((HistoryViewModelLink.HistoryIntent, HistoryViewModelLink.HistoryViewState, NilServiceType?) -> Void)?
    
    static var delegateHandler: ((HistoryViewModelLink.HistoryIntent, HistoryViewModelLink.HistoryViewState, NilDelegateType?) -> Void)?
    
    static var initialIntent: HistoryViewModelLink.HistoryIntent?
    
    static var intentHandler: ((HistoryViewModelLink.HistoryIntent) -> HistoryViewModelLink.HistoryResult)? =
    {
        intent in
        switch intent {
        default: return ResultType.notSet
        }
    }
    static var partialResultHandler: ((Result) -> HistoryViewModelLink.HistoryResult?)?
    
    static func reduce(viewState: HistoryViewModelLink.HistoryViewState?, result: HistoryViewModelLink.HistoryResult?) -> HistoryViewModelLink.HistoryViewState? {
        return viewState
    }
    
}
struct HistoryViewModelLink: ViewStateIntentLink {
    
    typealias ViewStateType = HistoryViewState
    typealias IntentType = HistoryIntent
    typealias ResultType = HistoryResult
    
    
    struct HistoryViewState: ViewState {
        let account: StudentAccount
    }
    enum HistoryIntent: Intent, ActionIntent {
        case initial(account: StudentAccount)
    }
    enum HistoryResult: Result {
        case notSet
        case initial(account: StudentAccount)
    }
}
