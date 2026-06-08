//
//  KingdomKidsApp.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct KingdomKidsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var appState = AppState()
    @State private var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            Group {
                if showSplash {
                    SplashView()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    showSplash = false
                                }
                            }
                        }
                } else if !appState.isAuthenticated {
                    AuthView()
                } else if appState.hasCompletedOnboarding {
                    HomeView()
                } else {
                    OnboardingView()
                }
            }
            .task {
                AuthService.shared.observeAuthenticationState { isAuthenticated in
                    appState.isAuthenticated = isAuthenticated
                }
            }
        }
        .environment(appState)
    }
}
