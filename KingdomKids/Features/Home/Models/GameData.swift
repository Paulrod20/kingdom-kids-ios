//
//  GameData.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import SwiftUI

// Hashable so NavigationStack can route to each game destination
enum GameDestination: Hashable {
    case bibleTrivia
    case cardMatch
}

struct Game {
    let id: UUID = UUID()
    let emoji: String
    let title: String
    let subtitle: String
    let description: String
    let isLocked: Bool
    let ageGroups: [AgeGroup]
    let destination: GameDestination?
    let bannerColor: Color?
}

let gamesData: [Game] = [
    Game(
        emoji: "🎯",
        title: "Bible Trivia",
        subtitle: "Test your knowledge",
        description: "How well do you know God's Word?",
        isLocked: false,
        ageGroups: [.toddler, .explorer],
        destination: .bibleTrivia,
        bannerColor: .kkPurpleMid
    ),
    Game(
        emoji: "🃏",
        title: "Card Match",
        subtitle: "Bible characters",
        description: "Match Bible characters and animals",
        isLocked: false,
        ageGroups: [.toddler, .explorer],
        destination: .cardMatch,
        bannerColor: Color(red: 0.094, green: 0.431, blue: 0.337)
    ),
    Game(
        emoji: "🧩",
        title: "Noah's Puzzle",
        subtitle: "Build the ark",
        description: "Put the pieces together",
        isLocked: true,
        ageGroups: [.toddler, .explorer],
        destination: nil,
        bannerColor: nil
    ),
    Game(
        emoji: "🪨",
        title: "David & Goliath",
        subtitle: "Aim and launch",
        description: "Face the giant with faith",
        isLocked: true,
        ageGroups: [.toddler, .explorer],
        destination: nil,
        bannerColor: nil
    ),
    Game(
        emoji: "🚢",
        title: "Noah's Animals",
        subtitle: "Match the pairs",
        description: "Two by two onto the ark",
        isLocked: true,
        ageGroups: [.toddler, .explorer],
        destination: nil,
        bannerColor: nil
    ),
    Game(
        emoji: "🐟",
        title: "Jonah's Escape",
        subtitle: "Dodge obstacles",
        description: "Swim through the deep",
        isLocked: true,
        ageGroups: [.explorer],
        destination: nil,
        bannerColor: nil
    ),
]
