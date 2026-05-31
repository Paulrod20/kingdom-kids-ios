//
//  StoryData.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import Foundation

struct Story {
    let id: UUID = UUID()
    let title: String
    let subtitle: String
    let emoji: String
    let ageGroups: [AgeGroup]
    let isLocked: Bool
}

let storiesData: [Story] = [
    Story(
        title: "The Beginning of the World",
        subtitle: "A story of creation",
        emoji: "🌍",
        ageGroups: [.toddler, .explorer],
        isLocked: false
    ),
    Story(
        title: "Adam & Eve",
        subtitle: "The beginning of everything",
        emoji: "🌳",
        ageGroups: [.toddler, .explorer],
        isLocked: false
    ),
    Story(
        title: "Noah's Ark",
        subtitle: "God saves Noah and the animals",
        emoji: "🚢",
        ageGroups: [.toddler, .explorer],
        isLocked: false
    ),
    Story(
        title: "Joseph's Coat of Many Colors",
        subtitle: "A colorful coat and a big dream",
        emoji: "🌈",
        ageGroups: [.toddler, .explorer],
        isLocked: true
    ),
    Story(
        title: "Baby Moses",
        subtitle: "God protects baby Moses",
        emoji: "🧺",
        ageGroups: [.toddler, .explorer],
        isLocked: true
    ),
    Story(
        title: "David & Goliath",
        subtitle: "A small boy defeats a giant",
        emoji: "🪨",
        ageGroups: [.explorer],
        isLocked: true
    ),
    Story(
        title: "Daniel & the Lions",
        subtitle: "God protects Daniel",
        emoji: "🦁",
        ageGroups: [.toddler, .explorer],
        isLocked: true
    ),
    Story(
        title: "Jonah & the Whale",
        subtitle: "God gives Jonah a second chance",
        emoji: "🐋",
        ageGroups: [.toddler, .explorer],
        isLocked: true
    ),
    Story(
        title: "The Birth of Jesus",
        subtitle: "A new beginning",
        emoji: "👶",
        ageGroups: [.toddler, .explorer],
        isLocked: true
    ),
    Story(
        title: "The Good Samaritan",
        subtitle: "Love your neighbor",
        emoji: "🤝",
        ageGroups: [.explorer],
        isLocked: true
    ),
    Story(
        title: "Jesus Feeds 5000",
        subtitle: "A little becomes a lot",
        emoji: "🍞",
        ageGroups: [.toddler, .explorer],
        isLocked: true
    ),
]
