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
    Channel(
        channelName: "Hillsong Kids",
        description: "Engaging children of this generation in worship — Building the lives of children all over the globe.",
        bannerImageChannel: "hillsongkids-profile",
        channelId: "UCbVGLnrXJzqwvxS9hyTsWDw",
        ageGroup: [.toddler, .explorer]
    ),
    Channel(
        channelName: "LifeKids",
        description: "LifeKids is the children’s ministry of Life.Church for kids birth—6th grade (ages 0—12 years).",
        bannerImageChannel: "lifekids-profile",
        channelId: "UCcGvV66gr1IItGbbBodqc7A",
        ageGroup: [.explorer]
    ),
    Channel(
        channelName: "Crossroads Kids' Club",
        description: "Welcome to the Crossroads’ Kids’ Club Channel! We have all kinds of cool stuff here for you and your kids to explore, and we’re always updating with brand new content.",
        bannerImageChannel: "crossroads-profile",
        channelId: "UCmMySSzKknjgAVVCOPXu_qg",
        ageGroup: [.explorer]
    ),
    Channel(
        channelName: "Smile and Learn - English",
        description: "Our channel features didactic stories and videos about values, Geography, History, Literacy, Science, Modern Languages, emotions, yoga... and so much more!",
        bannerImageChannel: "smileandlearn-profile",
        channelId: "UCxoDMG0tvaYO5Xobvtqw5nw",
        ageGroup: [.toddler, .explorer]
    ),
    Channel(
        channelName: "The Smiley Bunch",
        description: "Life of a Florida family 🌴🫶🌊🌸",
        bannerImageChannel: "smiley-profile",
        channelId: "UCdRiMyV5vKihQk-rl-2c6XA",
        ageGroup: [.toddler]
    ),
    Channel(
        channelName: "School Drives Me",
        description: "I’m Ms. Nkechi, a children’s book author, educator, & mom who believes every child is smart, loved, & capable of greatness.",
        bannerImageChannel: "schooldrivesme-profile",
        channelId: "UCdqEGnouLhD5S7zjkWCREfQ",
        ageGroup: [.toddler, .explorer]
    ),
    Channel(
        channelName: "What's In The Bible?",
        description: "Christian video trailers, bible lessons for kids and more from the new series from VeggieTales creator Phil Vischer.",
        bannerImageChannel: "whatsinthebible-profile",
        channelId: "UCiFIuW5SWY2HwVi878DVdug",
        ageGroup: [.toddler, .explorer]
    ),
    Channel(
        channelName: "eKidzOnline",
        description: "Elevation eKidz Online is a place where kids all over the world have fun and learn about Jesus.",
        bannerImageChannel: "ekidzonline-profile",
        channelId: "UCH7ATI2bl5u-uLygXJzfYsg",
        ageGroup: [.explorer]
    )
]
