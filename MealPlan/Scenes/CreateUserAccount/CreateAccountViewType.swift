//
//  CreateAccountViewType.swift
//  MealPlan
//
//  Created by blakerogers on 5/19/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import Foundation
import CleanModelViewIntent
import Utilities
protocol CreateAccountViewType: Presentation, Controller, Alerting {
    var emailField: UXTextField { get set}
    var passwordField: UXTextField { get set}
    var loginButton: UXButton { get set}
    var createButton: UXButton {get set}
    var backButton: UXButton { get set}
}
