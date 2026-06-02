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
//    let profileImageChannel: String
    let bannerImageChannel: String
    let channelId: String
    let ageGroup: [AgeGroup]
}

let channelData: [Channel] = [
    Channel(
        channelName: "Little Lights - Christian Toddler Learning",
        description: "A Channel to help toddlers learn how to Worship God and marvel at His world!",
        bannerImageChannel: "littlelights-profile",
        channelId: "UCbUvDWwtWgSSKwcyIfAn7EQ",
        ageGroup: [.toddler]
    ),
    Channel(
        channelName: "Chosen Kids",
        description: "We are parents who decided to make a wholesome Christian channel for children.",
        bannerImageChannel: "chosenkids-profile",
        channelId: "UClr4rj31fB-O1s3SRGjUCQg",
        ageGroup: [.toddler]
    ),
    Channel(
        channelName: "Holy Sprouts",
        description: "This channel is dedicated to teaching little ones about God & His love while making education fun.",
        bannerImageChannel: "holysprouts-profile",
        channelId: "UClBtBR6O7Gsmpja7Sj97xKg",
        ageGroup: [.toddler]
    ),
    Channel(
        channelName: "Minno - Bible Stories",
        description: "✝️ FUN Bible stories from the Minno Laugh and Grow Bible for Kids",
        bannerImageChannel: "minno-profile",
        channelId: "UC_oVYDT613F6viE3JENV-Yg",
        ageGroup: [.toddler, .explorer]
    ),
    Channel(
        channelName: "VeggieTales",
        description: "VeggieTales is the leading faith-based studio and producer of children's and family programming",
        bannerImageChannel: "veggietales-profile",
        channelId: "UChddokv0fxIN3BS-KZpxFfA",
        ageGroup: [.toddler, .explorer]
    ),
    Channel(
        channelName: "Superbook Kids",
        description: "Superbook teaches children timeless moral truths and life lessons through the captivating, Bible-based adventures of two time-traveling children and their robot friend.",
        bannerImageChannel: "superbook-profile",
        channelId: "UCmkgg5el8Fg3IX_baZyfSaQ",
        ageGroup: [.explorer]
    ),
]
