//
//  MenuPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct MenuPresenter: PresenterLink {
    typealias Link = MenuViewModelLink
    typealias View = MenuViewType
    static var action: (Link.ViewStateType?, Link.ViewStateType?, View) -> Void =
    { state, _,view in
        guard let state = state else { return }
        view.emailLabel.text = "blake@mail.com"//state.email
        view.nameLabel.text = state.userName
        view.mealPlanLabel.text = "Meal Plan 1"//state.mealPlan
        view.schoolLabel.text = "Old Dominion University"//state.school
        view.profileImage.loadImageWithURL(url: state.userImage, defaultImage: AppImages.person.image())
    }
    static var interaction: (MenuViewType, Box<Link.IntentType?>) -> Void =
    { view, interactor in
        view.legalButton.setAction({
            interactor.accept(.didSelectLegal)
        })
        view.logoutButton.setAction({
            interactor.accept(.didSelectLogout)
        })
    }
}
