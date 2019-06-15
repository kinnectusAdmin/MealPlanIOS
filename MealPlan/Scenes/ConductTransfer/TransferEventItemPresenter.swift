//
//  TransferEventItemPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 6/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent

struct TransferEventItemPresenter: ItemPresenterLink {
    typealias View = EventItemType
    typealias Link = TransferEventItemViewModelLink
    static var action: (TransferEventItemViewModelLink.ItemViewState?, TransferEventItemViewModelLink.ItemViewState?, EventItemType) -> Void
        = { viewState, _, view in
            guard let state  = viewState else { return }
            view.avatar.loadImageWithURL(url: state.userImage, defaultImage: AppImages.person.image())
//            view.descriptionLabel.text = state.eventDescription
//            view.dateLabel.text = state.eventDate
    }
    static var interaction: (EventItemType, Box<Link.IntentType?>) -> Void = { item, interactor in
        
    }
}
