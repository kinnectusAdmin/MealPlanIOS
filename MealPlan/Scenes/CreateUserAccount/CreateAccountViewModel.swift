//
//  CreateAccountViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct CreateAccountViewModel: ViewModelLink {
    
    typealias Link = CreateAccountViewModelLink
    typealias ViewState = Link.CreateAccountViewState
    typealias ResultType = Link.CreateAccountResult
    typealias ServiceType = NilServiceType
    typealias DelegateType = NilDelegateType
    
    static var initialIntent: CreateAccountViewModelLink.CreateAccountIntent?
    static var serviceHandler: ((CreateAccountViewModelLink.CreateAccountIntent, CreateAccountViewModelLink.CreateAccountViewState, NilServiceType?) -> Void)?
    static var delegateHandler: ((CreateAccountViewModelLink.CreateAccountIntent, CreateAccountViewModelLink.CreateAccountViewState, NilDelegateType?) -> Void)?
    static var intentHandler: ((CreateAccountViewModelLink.CreateAccountIntent) -> CreateAccountViewModelLink.CreateAccountResult)? =
    {
        intent in
        switch intent {
        case let .didUpdateEmail(email):
            return ResultType.updateEmail(email)
        case let .didUpdatePassword(password):
            return ResultType.updatePassword(password)
        default: return ResultType.notSet
        }
    }
    static var partialResultHandler: ((Result) -> CreateAccountViewModelLink.CreateAccountResult?)?
    
    static func reduce(viewState: CreateAccountViewModelLink.CreateAccountViewState?, result: CreateAccountViewModelLink.CreateAccountResult?) -> CreateAccountViewModelLink.CreateAccountViewState? {
        guard let state = viewState else { return ViewState.init(email: "", password: "")}
        switch result {
        case let .updateEmail(email)?:
            return ViewState(email: email, password: state.password)
        case let .updatePassword(password)?:
            return ViewState(email: state.email, password: password)
        default: return ViewState.init(email: "", password: "")
        }
    }
}
struct CreateAccountViewModelLink: ViewStateIntentLink {
    
    typealias ViewStateType = CreateAccountViewState
    typealias IntentType = CreateAccountIntent
    typealias ResultType = CreateAccountResult
    
    
    struct CreateAccountViewState: ViewState {
        let email: String
        let password: String
    }
    enum CreateAccountIntent: Intent, ActionIntent, ServiceIntent {
        case didSelectReturn
        case didSelectLogin
        case didSelectCreateAccount
        case didUpdateEmail(String)
        case didUpdatePassword(String)
    }
    enum CreateAccountResult: Result {
        case notSet
        case updateEmail(String)
        case updatePassword(String)
    }
}
