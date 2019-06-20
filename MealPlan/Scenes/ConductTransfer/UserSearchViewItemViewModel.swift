//
//  UserSearchViewItemViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 6/8/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain

struct UserSearchItemViewModel: ItemViewModelLink {
    
    typealias Link = UserSearchViewItemViewModelLink
    
    static var intentHandler: (UserSearchViewItemViewModelLink.ItemIntent) -> UserSearchViewItemViewModelLink.ItemResult =
    {
        intent in
        switch intent {
        case let .initial(user):
            return Link.ItemResult.initial(user: user)
        }
    }
    
    static var partialResultHandler: (Result) -> UserSearchViewItemViewModelLink.ItemResult? =
    {
        _ in
        return nil
    }
    
    static var initialIntent: UserSearchViewItemViewModelLink.ItemIntent?
    
    static func reduce(viewState: UserSearchViewItemViewModelLink.ItemViewState?, result: UserSearchViewItemViewModelLink.ItemResult?) -> UserSearchViewItemViewModelLink.ItemViewState? {
        switch result {
        case let .initial(user)?:
            return Link.ItemViewState.init(user: user)
        default: return viewState
        }
    }
    
}
struct UserSearchViewItemViewModelLink: ViewStateIntentLink {
    typealias IntentType = ItemIntent
    typealias ResultType = ItemResult
    typealias ViewStateType = ItemViewState
    
    
    enum ItemIntent: Intent, ActionIntent, DelegateIntent {
        case initial(user: MealPlanUser)
    }
    enum ItemResult: Result {
        case initial(user: MealPlanUser)
    }
    struct ItemViewState: ViewState {
        let user: MealPlanUser
        var userImage: String { return user.imageURL }
        var userName: String { return user.firstName }
    }
}
