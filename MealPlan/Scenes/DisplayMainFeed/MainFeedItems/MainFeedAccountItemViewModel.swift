//
//  MainFeedAccountItemViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 6/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain



struct MainFeedAccountItemViewModel: ViewModelLink {
    
    typealias Link = MainFeedAccountItemViewModelLink
    
    static var intentHandler: (MainFeedAccountItemViewModelLink.ItemIntent) -> MainFeedAccountItemViewModelLink.ItemResult = {
        intent in
        switch intent {
        case let .initial(account):
            return MainFeedAccountItemViewModelLink.ResultType.initial(account: account)
        }
    }
    
    static var partialResultHandler: (Result) -> MainFeedAccountItemViewModelLink.ItemResult? =
    {
        _ in
        return nil
    }
    
    static var serviceHandler: ((ServiceIntent?, MainFeedAccountItemViewModelLink.ViewStateType) -> Void)? = nil
    
    static var delegateHandler: ((DelegateIntent?, MainFeedAccountItemViewModelLink.ViewStateType) -> Void)? = nil
    
    static var initialIntent: MainFeedAccountItemViewModelLink.ItemIntent? = nil
    
    static func reduce(viewState: MainFeedAccountItemViewModelLink.ItemViewState?, result: MainFeedAccountItemViewModelLink.ItemResult?) -> MainFeedAccountItemViewModelLink.ItemViewState? {
        switch result {
        case let .initial(account)?:
            return MainFeedAccountItemViewModelLink.ViewStateType.init(account: account)
        default: return viewState
        }
    }
}
struct MainFeedAccountItemViewModelLink: ViewStateIntentLink {
    typealias ViewStateType = ItemViewState
    
    typealias IntentType = ItemIntent
    
    typealias ResultType = ItemResult
    
    enum ItemIntent: Intent, ActionIntent {
        case initial(account: StudentAccount)
    }
    enum ItemResult: Result {
        case initial(account: StudentAccount)
    }
    struct ItemViewState: ViewState {
        let account: StudentAccount
        
        var swipesRemaining: String { return "\(account.swipesBalance?.remaining ?? 0)"}
        var swipesSpent: String { return "\(account.swipesBalance?.spent ?? 0)"}
        var swipesReceived: String { return "\(account.swipesBalance?.received ?? 0)"}
        var swipesConverted: String { return "\(account.swipesBalance?.converted ?? 0)"}
        
        var flexRemaining: String { return "\(account.flexBalance?.remaining ?? 0)"}
        var flexSpent: String { return "\(account.flexBalance?.spent ?? 0)"}
        var flexReceived: String { return "\(account.flexBalance?.received ?? 0)"}
        var flexConverted: String { return "\(account.flexBalance?.converted ?? 0)"}
    }
}
