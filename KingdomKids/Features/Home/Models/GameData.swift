//
//  GameData.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import Foundation

struct Game {
    let id: UUID = UUID()
    let emoji: String
    let title: String
    let subtitle: String
    let isLocked: Bool
    let ageGroups: [AgeGroup]
}

let gamesData: [Game] = [
    Game(
        emoji: "🃏",
        title: "Card Match",
        subtitle: "Bible characters",
        isLocked: false,
        ageGroups: [.toddler, .explorer]
    ),
    Game(
        emoji: "🎨",
        title: "Coloring",
        subtitle: "Bible scenes",
        isLocked: false,
        ageGroups: [.toddler, .explorer]
    ),
    Game(
        emoji: "🧩",
        title: "Noah's Puzzle",
        subtitle: "Build the ark",
        isLocked: true,
        ageGroups: [.toddler, .explorer]
    ),
    Game(
        emoji: "🪨",
        title: "David & Goliath",
        subtitle: "Aim and launch",
        isLocked: true,
        ageGroups: [.toddler, .explorer]
    ),
    Game(
        emoji: "🚢",
        title: "Noah's Animals",
        subtitle: "Match the pairs",
        isLocked: true,
        ageGroups: [.toddler, .explorer]
    ),
    Game(
        emoji: "🐟",
        title: "Jonah's Escape",
        subtitle: "Dodge obstacles",
        isLocked: true,
        ageGroups: [.explorer]
    ),
]
