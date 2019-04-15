//
//  ConversionRouter.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct ConversionRouter: RouterLink, ConversionUseCase {
    
    
    typealias Link = ConversionViewModelLink

    static var route: (ConversionViewModelLink.ConversionViewState?, ConversionViewModelLink.ConversionIntent, Router<ConversionRouter>) -> Void =
    {
        viewState, intent, router in
    }
    
    static var onDismiss: () -> Void =
    {
        
    }
    
    static var onDismissWithInfo: (RouterInfo) -> Void =
    {
        info in
    }
}
