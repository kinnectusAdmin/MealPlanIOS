//
//  MenuViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain
struct MenuViewModel: ViewModelLink {

    typealias Link = MenuViewModelLink
    typealias ResultType = Link.MenuResult
    typealias ServiceType = NilServiceType
    typealias DelegateType = NilDelegateType
    
    static var serviceHandler: ((MenuViewModelLink.MenuIntent, MenuViewModelLink.MenuViewState, NilServiceType?) -> Void)?
    static var delegateHandler: ((MenuViewModelLink.MenuIntent, MenuViewModelLink.MenuViewState, NilDelegateType?) -> Void)?
    
    static var initialIntent: MenuViewModelLink.MenuIntent? = .initial
    
    static var intentHandler: ((MenuViewModelLink.MenuIntent) -> MenuViewModelLink.MenuResult)? =
    {
        intent in
        switch intent {
        case .initial:
            return ResultType.initial
        case .didSelectLegal:
            return ResultType.displayLegal
        case .didSelectInvite:
            return ResultType.displayInvite
        default:
            return ResultType.notSet
        }
    }
    static var partialResultHandler: ((Result) -> MenuViewModelLink.MenuResult?)?
    
    static func reduce(viewState: MenuViewModelLink.MenuViewState?, result: MenuViewModelLink.MenuResult?) -> MenuViewModelLink.MenuViewState? {
        switch result {
        case .initial?:
            return Link.MenuViewState()
        default:
            return viewState
        }
    }
}
struct MenuViewModelLink: ViewStateIntentLink {
    
    typealias ViewStateType = MenuViewState
    typealias IntentType = MenuIntent
    typealias ResultType = MenuResult
    
    
    enum MenuIntent: Intent, ActionIntent {
        case initial
        case didSelectLegal
        case didSelectInvite
        case didSelectLogout
    }
    enum MenuResult: Result {
        case notSet
        case initial
        case displayLegal
        case displayInvite
    }
    struct MenuViewState: ViewState {
        let user: MealPlanUser = MealPlanUser.local
        var userName: String { return user.name }
        var userImage: String { return user.imageURL }
        var mealPlan: String  { return user.mealPlan.type}
        var school: String { return user.school.name}
        var email: String { return user.email}
    }
}
