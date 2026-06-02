//
//  VideoData.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/29/26.
//

import Foundation

struct VideoChannel {
    let id: UUID = UUID()
    let channelName: String
    let description: String
    let emoji: String
    let channelURL: String
    let ageGroups: [AgeGroup]
}
