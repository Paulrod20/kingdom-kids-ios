//
//  Config.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/29/26.
//

import Foundation

enum Config {
    static var youtubeAPIKey: String {
        guard let key = Bundle.main.infoDictionary?["YOUTUBE_API_KEY"] as? String else {
            fatalError("Missing YouTube API key in Info.plist")
        }
        return key
    }
}
