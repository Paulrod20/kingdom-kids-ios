//
//  KingdomKidsApp.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import SwiftUI

@main
struct KingdomKidsApp: App {
    @State private var appState = AppState()
    @State private var showSplash = true
    
    init() {
        // Build configuration and Info.plist diagnostics
        let info = Bundle.main.infoDictionary ?? [:]
        let plistKey = info["YOUTUBE_API_KEY"] as? String
        print("🧭 Scheme build configuration should be Debug (check Scheme > Run).")
        print("📄 Info.plist YOUTUBE_API_KEY (raw):", plistKey as Any)
        print("📦 Bundle identifier:", Bundle.main.bundleIdentifier ?? "nil")
        print("🧩 All Info.plist keys (subset):", Array(info.keys.prefix(10)).map { "\($0)" })
    }
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                showSplash = false
                            }
                        }
                    }
            } else if appState.hasCompletedOnboarding {
                HomeView()
            } else {
                OnboardingView()
            }
        }
        .environment(appState)
    }
}
