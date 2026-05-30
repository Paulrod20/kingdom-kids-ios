//
//  ChannelData.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/29/26.
//

import Foundation

struct Channel {
    let id: UUID = UUID()
    let channelName: String
    let description: String
    let emoji: String
    let channelID: String
    let ageGroup: [AgeGroup]
}

