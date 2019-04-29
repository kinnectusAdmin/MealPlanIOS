//
//  OnboardPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/1/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct OnboardPresenter: PresenterLink {
    typealias View = OnboardViewType
    typealias Link = OnboardViewModelLink
    static var action: (OnboardViewModelLink.ViewStateType?, OnboardViewModelLink.ViewStateType?,  View) -> Void = { state, _, view in
        guard let state = state else { return }
        view.indicator.currentPage = state.page.rawValue
        view.onboardCollection.model.accept(OnboardSectionModel(viewState: state))
    }
    static var interaction: (View, Box<OnboardViewModelLink.IntentType?>) -> Void = { view, interactor in
        view.loginButton.setAction {
            interactor.accept(OnboardViewModelLink.IntentType.didSelectLogin)
        }
        view.signUpButton.setAction {
            interactor.accept(OnboardViewModelLink.IntentType.didSelectSignUp)
        }
        view.onboardCollection.parentInteractor.bind({ intent , _ in
            guard let intent = intent else { return }
            interactor.accept(intent)
        })
    }
}
