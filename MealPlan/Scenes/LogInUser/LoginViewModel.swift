//
//  LoginViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import Utilities
struct LoginViewModel: ViewModelLink {
    
    typealias Link = LoginViewModelLink
    typealias ViewState = Link.ViewStateType
    typealias ResultType = Link.LoginResult
    
    static var serviceHandler: ((ServiceIntent?, LoginViewModelLink.ViewStateType) -> Void)?
    
    static var delegateHandler: ((DelegateIntent?, LoginViewModelLink.ViewStateType) -> Void)?
    
    static var initialIntent: LoginViewModelLink.LoginIntent?
    
    static var intentHandler: (LoginViewModelLink.LoginIntent) -> LoginViewModelLink.LoginResult =
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
    static var partialResultHandler: (Result) -> LoginViewModelLink.LoginResult? = { _ in return nil}
    
    static func reduce(viewState: LoginViewModelLink.LoginViewState?, result: LoginViewModelLink.LoginResult?) -> LoginViewModelLink.LoginViewState? {
        let state = viewState.otherwise(ViewState.empty)
        switch result {
        case let .updateEmail(email)?:
            return ViewState.init(email: email, password: state.password)
        case let .updatePassword(password)?:
            return ViewState.init(email: state.email, password: password)
        default: return viewState
        }
    }
}
struct LoginViewModelLink: ViewStateIntentLink {
    
    typealias ViewStateType = LoginViewState
    typealias IntentType = LoginIntent
    typealias ResultType = LoginResult
    
    struct LoginViewState: ViewState {
        let email: String
        let password: String
        static var empty: LoginViewState {
            return LoginViewState.init(email: "", password: "")
        }
    }
    enum LoginIntent: Intent, ActionIntent {
        case didSelectReturn
        case didSelectLogin
        case didSelectSignUp
        case didUpdateEmail(String)
        case didUpdatePassword(String)
    }
    enum LoginResult: Result {
        case notSet
        case updateEmail(String)
        case updatePassword(String)
    }
}

