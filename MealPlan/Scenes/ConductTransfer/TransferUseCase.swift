//
//  TransferUseCase.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import MealPlanDomain
protocol TransferUseCase {
    func didSelectViewUser(user: MealPlanUser)
}
