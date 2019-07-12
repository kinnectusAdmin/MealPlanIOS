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
import MealPlanNetwork
import MealPlanDomain

struct LoginViewModel: ViewModelLink {
    
    typealias Link = LoginViewModelLink
    typealias ViewState = Link.ViewStateType
    typealias ResultType = Link.LoginResult
    typealias ServiceType = MealPlanNetwork.MealPlanUserUseCase
    typealias DelegateType = NilDelegateType
    
    static var serviceHandler: ((LoginViewModelLink.LoginIntent, LoginViewModelLink.LoginViewState, MealPlanNetwork.MealPlanUserUseCase?) -> Void)? =
    {
        intent, viewState, service in
        switch intent {
        case .didSelectLogin:
            service?.loginUser(email: viewState.email, password: viewState.password)
        default: break
        }
    }
    
    static var delegateHandler: ((LoginViewModelLink.LoginIntent, LoginViewModelLink.LoginViewState, NilDelegateType?) -> Void)?
    
    static var initialIntent: LoginViewModelLink.LoginIntent?
    
    static var intentHandler: ((LoginViewModelLink.LoginIntent) -> LoginViewModelLink.LoginResult)? =
    {
        intent in
        switch intent {
        case let .didUpdateEmail(email):
            return ResultType.updateEmail(email)
        case let .didUpdatePassword(password):
            return ResultType.updatePassword(password)
        case .didAcknowledgeAlert:
            return ResultType.acknowledgeAlert
        default: return ResultType.notSet
        }
    }
    static var partialResultHandler: ((Result) -> LoginViewModelLink.LoginResult?)? =
    {
        result in
        switch result as? MealPlanNetwork.UserNetwork.UserNetworkResult {
        case let .didLoginUser(user)?:
            return ResultType.loginResult(.loginSucceeded(user))
        case .loginUserFailure?:
            return ResultType.loginResult(.loginFailure)
        default:
            return ResultType.notSet
        }
    }
    
    static func reduce(viewState: LoginViewModelLink.LoginViewState?, result: LoginViewModelLink.LoginResult?) -> LoginViewModelLink.LoginViewState? {
        let state = viewState.otherwise(ViewState.empty)
        switch result {
        case let .updateEmail(email)?:
            return ViewState.init(email: email, password: state.password, loginState: state.loginState, alertState: state.alertState)
        case let .updatePassword(password)?:
            return ViewState.init(email: state.email, password: password, loginState: state.loginState, alertState: state.alertState)
        case let .loginResult(loginState)?:
            switch loginState {
            case .loginSucceeded:
                return ViewState.init(email: "", password: "", loginState: loginState, alertState: .alert(message: "Welcome Back!"))
            case .loginFailure:
                return ViewState.init(email: "", password: "", loginState: loginState, alertState: .alert(message: "Oops There was an error logging in. Check your credentials."))
            case .loading:
                return viewState
            default: return viewState
                
            }
        case .acknowledgeAlert?:
            return ViewState.init(email: state.email, password: state.password, loginState: state.loginState, alertState: .dismiss)
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
        let loginState: Objects.UserLoginState
        let alertState: Objects.AlertState
        static var empty: LoginViewState {
            return LoginViewState.init(email: "", password: "", loginState: .none, alertState: .notDisplayed)
        }
    }
    
    enum LoginIntent: Intent, ActionIntent {
        case didSelectReturn
        case didSelectLogin
        case didSelectSignUp
        case didUpdateEmail(String)
        case didUpdatePassword(String)
        case didAcknowledgeAlert
    }
    
    enum LoginResult: Result {
        case notSet
        case updateEmail(String)
        case updatePassword(String)
        case loginResult(Objects.UserLoginState)
        case acknowledgeAlert
    }
}

