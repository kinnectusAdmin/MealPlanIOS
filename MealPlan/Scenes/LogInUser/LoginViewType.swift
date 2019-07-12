//
//  LoginViewType.swift
//  MealPlan
//
//  Created by blakerogers on 5/19/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import Utilities
protocol LoginViewType: Presentation, Controller, Alerting {
    var backButton: UXButton { get set}
    var emailField: UXTextField { get set}
    var passwordField: UXTextField { get set }
    var loginButton: UXButton { get set}
    var signUpButton: UXButton {get set}
}
