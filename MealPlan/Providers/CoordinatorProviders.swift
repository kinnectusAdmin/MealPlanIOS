//
//  Providers.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import Utilities
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
    static func makeConversionCoordinator(parent: Coordinator? = nil) -> ConversionCoordinator {
        return ConversionCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
    static func makeMenuCoordinator(parent: Coordinator? = nil) -> MenuCoordinator {
        return MenuCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
    static func makeMainNavigationCoordinator(parent: Coordinator? = nil) -> MainNavigationCoordinator {
        return MainNavigationCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
    static func makeHistoryCoordinator() -> HistoryCoordinator {
        return HistoryCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
    static func makeTransferCoordinator(parent: Coordinator? = nil) -> TransferCoordinator {
        return TransferCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
    static func makeMainFeedCoordinator(parent: Coordinator? = nil) -> MainFeedCoordinator {
        return MainFeedCoordinator.configure(viewModelDelegate: nil, service: nil)
    }
    static func provideMainCoordinators() -> [String: Coordinator] {
        let coordinators: [Coordinator] = [makeMainFeedCoordinator(), makeTransferCoordinator(), makeConversionCoordinator(), makeMenuCoordinator()]
        return coordinators.map { coordinator -> [String: Coordinator] in
            [coordinator.provideIdentifier() : coordinator]
            }.reduce([:], { (dict, dictPartition) -> [String: Coordinator] in
                guard let key = dictPartition.keys.first, let value = dictPartition[key] else { return dict}
                return dict.updating(value: value, for: key)
            })
    }
}
