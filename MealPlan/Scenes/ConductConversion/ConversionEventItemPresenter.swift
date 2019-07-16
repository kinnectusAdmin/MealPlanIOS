//
//  ConversionEventItemPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 6/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import MealPlanDomain
import CleanModelViewIntent

struct ConversionEventItemPresenter: ItemPresenterLink {
    typealias Link = ConversionEventItemViewModelLink
    typealias View = EventItemType
    static var action: (Link.ViewStateType?, Link.ViewStateType?, EventItemType) -> Void = { viewState, _, view in
        guard let state  = viewState else { return }
        view.descriptionLabel.text = state.eventDescription
        view.dateLabel.text = state.eventDate
        view.avatar.loadImageWithURL(url: MealPlanUser.local.imageURL, defaultImage: AppImages.person.image())
    }
    static var interaction: (EventItemType, Box<Link.IntentType?>) -> Void = { item, interactor in
        
    }
}
