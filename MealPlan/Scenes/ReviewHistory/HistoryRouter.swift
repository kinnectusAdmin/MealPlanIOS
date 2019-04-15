//
//  HistoryRouter.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct HistoryRouter: RouterLink {
    typealias Link = HistoryViewModelLink

    static var route: (HistoryViewModelLink.HistoryViewState?, HistoryViewModelLink.HistoryIntent, Router<HistoryRouter>) -> Void =
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
