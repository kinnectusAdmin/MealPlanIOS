//
//  CreateAccountPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct CreateAccountPresenter: PresenterLink {
    typealias Link = CreateAccountViewModelLink
    typealias View = CreateAccountViewType
    static var action: (Link.ViewStateType?, Link.ViewStateType?, CreateAccountViewType) -> Void = { state, _, view in
    
    }
    static var interaction: (CreateAccountViewType, Box<Link.IntentType?>) -> Void = { view, interactor in
        view.emailField.textValue.bindListener { text, _ in
            interactor.accept(Link.IntentType.didUpdateEmail(text))
        }
        view.passwordField.textValue.bindListener { text, _ in
            interactor.accept(Link.IntentType.didUpdatePassword(text))
        }
        view.backButton.setAction {
            interactor.accept(Link.IntentType.didSelectReturn)
        }
        view.createButton.setAction({
            interactor.accept(Link.IntentType.didSelectCreateAccount)
        })
        view.loginButton.setAction({
            interactor.accept(Link.IntentType.didSelectLogin)
        })
    }
}
