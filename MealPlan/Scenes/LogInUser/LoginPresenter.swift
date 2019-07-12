//
//  LoginPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct LoginPresenter: PresenterLink {
    typealias Link = LoginViewModelLink
    typealias View = LoginViewType
    static var action: (Link.ViewStateType?, Link.ViewStateType?, View) -> Void = { state, _, view in
        guard let state = state else { return }
        switch state.loginState {
        case .loading:
            break
        default: break
        }
        switch state.alertState {
        case let .alert(message):
            view.showAlert(message: message)
        case .dismiss:
            view.dismissAlert()
        default: break
        }
    }
    static var interaction: (LoginViewType, Box<Link.IntentType?>) -> Void = { view, interactor in
        view.emailField.textValue.bindListener { text, _ in
            interactor.accept(Link.IntentType.didUpdateEmail(text))
        }
        view.passwordField.textValue.bindListener { text, _ in
            interactor.accept(Link.IntentType.didUpdatePassword(text))
        }
        view.backButton.setAction {
            interactor.accept(Link.IntentType.didSelectReturn)
        }
        view.loginButton.setAction {
            interactor.accept(Link.IntentType.didSelectLogin)
        }
        view.signUpButton.setAction {
            interactor.accept(Link.IntentType.didSelectSignUp)
        }
        view.alertScreen.addTapGestureRecognizer(action: {
            interactor.accept(Link.IntentType.didAcknowledgeAlert)
        })
    }
}
