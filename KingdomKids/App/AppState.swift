//
//  AppState.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/26/26.
//

import Foundation

enum AgeGroup {
    case toddler
    case explorer
}

@Observable
class AppState {
    var ageGroup: AgeGroup? = nil
    var hasCompletedOnboarding: Bool = false
}
