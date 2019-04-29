//
//  ConversionPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct ConversionPresenter: PresenterLink {
    typealias Link = ConversionViewModelLink
    typealias View = ConversionViewType
    static var action: (Link.ViewStateType?, Link.ViewStateType?, View) -> Void = { state, _, view in
        
    }
    static var interaction: (ConversionViewType, Box<Link.IntentType?>) -> Void = { view, interactor in
        
    }
}

