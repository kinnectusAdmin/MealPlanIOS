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
    typealias View = LoginView
    static var action: (Link.ViewStateType?, Link.ViewStateType?, View) -> Void = { state, _, view in
        
    }
    static var interaction: (LoginView, Box<Link.IntentType?>) -> Void = { view, interactor in
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
    }
}
