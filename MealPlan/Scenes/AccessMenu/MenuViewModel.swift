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
    
    static var serviceHandler: ((ServiceIntent?, MenuViewModelLink.ViewStateType) -> Void)? = nil
    
    static var delegateHandler: ((DelegateIntent?, MenuViewModelLink.ViewStateType) -> Void)? = nil
    
    static var initialIntent: MenuViewModelLink.MenuIntent? = nil
    
    static var intentHandler: (MenuViewModelLink.MenuIntent) -> MenuViewModelLink.MenuResult =
    {
        intent in
        switch intent {
        case .didSelectProfile:
            return ResultType.displayProfile
        case .didSelectSettings:
            return ResultType.displaySettings
        case .didSelectSupport:
            return ResultType.displaySupport
        case .didSelectFeedback:
            return ResultType.displayFeedback
        case .didSelectLegal:
            return ResultType.displayLegal
        case .didSelectTutorial:
            return ResultType.displayTutorial
        case .didSelectInvite:
            return ResultType.displayInvite
        case .didSelectDone:
            return ResultType.dismissDisplayedMenu
        default: return ResultType.notSet
        }
    }
    static var partialResultHandler: (Result) -> MenuViewModelLink.MenuResult? = { _ in return nil}
    
    static func reduce(viewState: MenuViewModelLink.MenuViewState?, result: MenuViewModelLink.MenuResult?) -> MenuViewModelLink.MenuViewState? {
        switch result {
        default:
            return viewState
        }
    }
}
struct MenuViewModelLink: ViewStateIntentLink {
    
    typealias ViewStateType = MenuViewState
    typealias IntentType = MenuIntent
    typealias ResultType = MenuResult
    
    enum MenuMode {
        case initial
        case profile
        case settings
        case feedback
        case legal
    }
    struct MenuViewState: ViewState {
        let user: MealPlanUser
        let menuMode: MenuMode
        var userName: String { return user.name }
        var userImage: String { return user.imageURL }
        var mealPlan: String  { return user.mealPlan.type}
        var school: String { return user.school.name}
    }
    enum MenuIntent: Intent, ActionIntent {
        case didSelectProfile
        case didSelectSettings
        case didSelectSupport
        case didSelectFeedback
        case didSelectLegal
        case didSelectTutorial
        case didSelectInvite
        case didSelectLogout
        case didSelectDone
    }
    enum MenuResult: Result {
        case notSet
        case displayProfile
        case displaySettings
        case displaySupport
        case displayFeedback
        case displayLegal
        case displayTutorial
        case displayInvite
        case dismissDisplayedMenu
    }
}
