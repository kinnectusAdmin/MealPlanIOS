//
//  Providers.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
class CoordinatorProvider {
    static func makeOnboardCoordinator() -> OnboardCoordinator {
        return OnboardCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
    static func makeCreateAccountCoordinator() -> CreateAccountCoordinator {
        return CreateAccountCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
    static func makeLoginCoordinator() -> LoginCoordinator {
        return LoginCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
    static func makeConversionCoordinator() -> ConversionCoordinator {
        return ConversionCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
    static func makeMenuCoordinator() -> MenuCoordinator {
        return MenuCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
    static func makeMainNavigationCoordinator() -> MainNavigationCoordinator {
        return MainNavigationCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
    static func makeHistoryCoordinator() -> HistoryCoordinator {
        return HistoryCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
    static func makeTransferCoordinator() -> TransferCoordinator {
        return TransferCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
    static func makeMainFeedCoordinator() -> MainFeedCoordinator {
        return MainFeedCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
}
