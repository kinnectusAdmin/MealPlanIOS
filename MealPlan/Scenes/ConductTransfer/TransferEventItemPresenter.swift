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
    typealias View = TransferEventItemType
    typealias Link = TransferEventItemViewModelLink
    static var action: (TransferEventItemViewModelLink.ItemViewState?, TransferEventItemViewModelLink.ItemViewState?, TransferEventItemType) -> Void
        = { viewState, _, view in
        
    }
    static var interaction: (TransferEventItemType, Box<Link.IntentType?>) -> Void = { item, interactor in
    }
}
