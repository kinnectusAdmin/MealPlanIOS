//
//  CreateAccountViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanNetwork
import MealPlanDomain

struct CreateAccountViewModel: ViewModelLink {
    
    typealias Link = CreateAccountViewModelLink
    typealias ViewState = Link.CreateAccountViewState
    typealias ResultType = Link.CreateAccountResult
    typealias ServiceType = MealPlanNetwork.StudentAccountUseCase
    typealias DelegateType = NilDelegateType
    
    static var initialIntent: CreateAccountViewModelLink.CreateAccountIntent?
    static var serviceHandler: ((CreateAccountViewModelLink.CreateAccountIntent, CreateAccountViewModelLink.CreateAccountViewState, MealPlanNetwork.StudentAccountUseCase?) -> Void)? =
    {
        intent, viewState, studentAccountNetwork in
        switch intent {
        case .didSelectCreateAccount:
            studentAccountNetwork?.fetchStudentAccount(id: viewState.email)
        default: break
        }
    }
    static var delegateHandler: ((CreateAccountViewModelLink.CreateAccountIntent, CreateAccountViewModelLink.CreateAccountViewState, NilDelegateType?) -> Void)?
    static var intentHandler: ((CreateAccountViewModelLink.CreateAccountIntent) -> CreateAccountViewModelLink.CreateAccountResult)? =
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
    static var partialResultHandler: ((Result) -> CreateAccountViewModelLink.CreateAccountResult?)? =
    {
        result in
        switch result as? StudentAccountNetwork.StudentAccountNetworkResult {
        case let .didFetchStudentAccount(account)?:
            return ResultType.createAccountResult(.signUpSucceeded(account))
        case .fetchStudentAccountFailure?:
            return ResultType.createAccountResult(.signUpFailure)
        default:
            return ResultType.notSet
        }
    }
    static func reduce(viewState: CreateAccountViewModelLink.CreateAccountViewState?, result: CreateAccountViewModelLink.CreateAccountResult?) -> CreateAccountViewModelLink.CreateAccountViewState? {
        guard let state = viewState else { return ViewState.init(email: "", password: "", createAccountState: .none, alertState: .notDisplayed)}
        switch result {
        case let .updateEmail(email)?:
            return ViewState(email: email, password: state.password, createAccountState: state.createAccountState, alertState: .notDisplayed)
        case let .updatePassword(password)?:
            return ViewState(email: state.email, password: password, createAccountState: state.createAccountState, alertState: state.alertState)
        case let .createAccountResult(signUpState)?:
            switch signUpState {
            case .signUpFailure:
                return ViewState(email: "", password: "", createAccountState: signUpState, alertState: .alert(message: "Oops There was an error during Sign Up, Check your credentials."))
            case .loading, .signUpSucceeded:
                return ViewState(email: "", password: "", createAccountState: signUpState, alertState: .alert(message: "Welcome!"))
            default:
                return ViewState(email: "", password: "", createAccountState: signUpState, alertState: state.alertState)
            }
        default: return viewState
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
        let createAccountState: Objects.StudentAccountSignUpState
        let alertState: Objects.AlertState
    }
    enum CreateAccountIntent: Intent, ActionIntent, ServiceIntent {
        case didSelectReturn
        case didSelectLogin
        case didSelectCreateAccount
        case didUpdateEmail(String)
        case didUpdatePassword(String)
        case didAcknowledgeAlert
    }
    enum CreateAccountResult: Result {
        case notSet
        case updateEmail(String)
        case updatePassword(String)
        case createAccountResult(Objects.StudentAccountSignUpState)
        case acknowledgeAlert
    }
}
