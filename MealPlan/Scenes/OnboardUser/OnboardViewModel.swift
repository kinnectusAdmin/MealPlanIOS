//
//  OnboardViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/1/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import MealPlanDomain
import CleanModelViewIntent
struct OnboardViewModel: ViewModelLink {
    
    typealias Link = OnboardViewModelLink
    typealias ViewState = Link.ViewStateType
    typealias ResultType = Link.ResultType
    
    
    static var intentHandler: (OnboardViewModelLink.OnboardIntent) -> OnboardViewModelLink.OnboardResult =
    {
        intent in
        switch intent {
        case let .initial(page):
            return ResultType.initial(page: page)
        case .didSelectNext:
            return ResultType.toNext
        case .didSelectPrevious:
            return ResultType.toPrevious
        case let .didSwipeToPosition(position):
            return ResultType.toPosition(position)
        default: return ResultType.notSet
        }
    }
    static var serviceHandler: ((ServiceIntent?, OnboardViewModelLink.ViewStateType) -> Void)?
    
    static var delegateHandler: ((DelegateIntent?, OnboardViewModelLink.ViewStateType) -> Void)?
    
    static var initialIntent: OnboardViewModelLink.OnboardIntent? = .initial(page: .first)
    
    static var partialResultHandler: (Result) -> OnboardViewModelLink.OnboardResult? = { _ in return nil}
    
    static func reduce(viewState: OnboardViewModelLink.OnboardViewState?, result: OnboardViewModelLink.OnboardResult?) -> OnboardViewModelLink.OnboardViewState? {
            switch result {
            case let .initial(page)?:
                return ViewState.init(page: page)
            case .toNext?:
                guard let state = viewState else { return ViewState(page: .first)}
                return ViewState(page: state.page.alternate.next )
            case .toPrevious?:
                guard let state = viewState else { return ViewState(page: .first)}
                return ViewState(page: state.page.alternate.previous)
            case let .toPosition(page)?:
                guard let state = viewState else { return ViewState(page: .first)}
                guard page != state.page else { return state}
                return ViewState(page: page)
            default: return viewState
        }
    }
    
}
struct OnboardViewModelLink: ViewStateIntentLink {
    
    typealias ViewStateType = OnboardViewState
    typealias IntentType = OnboardIntent
    typealias ResultType = OnboardResult
    
    struct OnboardViewState: ViewState {
        let page: Objects.OnboardPage
    }
    enum OnboardIntent: Intent, ActionIntent {
        case initial(page: Objects.OnboardPage)
        case didSelectNext
        case didSelectPrevious
        case didSelectLogin
        case didSelectSignUp
        case didSwipeToPosition(Objects.OnboardPage)
    }
    enum OnboardResult: Result {
        case notSet
        case initial(page: Objects.OnboardPage)
        case toNext
        case toPrevious
        case toPosition(Objects.OnboardPage)
    }
}
