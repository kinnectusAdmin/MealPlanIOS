//
//  ConversionEventItemPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 6/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent

struct ConversionEvenItemPresenter: ItemPresenterLink {
    typealias Link = ConversionEventItemViewModelLink
    typealias View = ConversionEventItemType
    static var action: (Link.ViewStateType?, Link.ViewStateType?, ConversionEventItemType) -> Void = { viewState, _, view in
      
    }
    static var interaction: (ConversionEventItemType, Box<Link.IntentType?>) -> Void = { item, interactor in
        
    }
}
