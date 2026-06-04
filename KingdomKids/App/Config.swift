//
//  Config.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/29/26.
//

import Foundation

enum Config {
    static var youtubeAPIKey: String {
        // Diagnostics: which Info.plist is being used
        if let plistPath = Bundle.main.path(forResource: "Info", ofType: "plist") {
            print("📍 Using Info.plist at path:", plistPath)
        } else {
            print("⚠️ Could not resolve Info.plist path in bundle.")
        }
        
        if let key = Bundle.main.infoDictionary?["YOUTUBE_API_KEY"] as? String, !key.isEmpty {
            print("🔐 Loaded API key present: true")
            return key
        } else {
            print("🔐 Loaded API key present: false")
            fatalError("Missing YouTube API key in Info.plist")
        }
    }
}

