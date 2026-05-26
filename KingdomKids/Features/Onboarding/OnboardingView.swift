//
//  Untitled.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        ZStack {
            Color.kkPurpleDark
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Spacer()
                
                Text("👑")
                    .font(.system(size: 72))
                
                Text("Kingdom Kids")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkGold)
                
                Text("A safe palce to learn & grow in faith")
                    .font(.subheadline)
                    .foregroundStyle(Color.kkTextLight)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Text("How old is your little one?")
                    .font(.headline)
                    .foregroundStyle(Color.kkTextWhite)
                
                VStack(spacing: 12) {
                    AgeButton(
                        emoji: "🐣",
                        title: "Toddler",
                        subtitle: "Ages 2 - 4",
                        ageGroup: .toddler
                    )
                    
                    AgeButton(
                        emoji: "🌟",
                        title: "Explorer",
                        subtitle: "Ages 5 - 8",
                        ageGroup: .explorer
                    )
                }
                .padding(.horizontal, 24)
                
                Spacer()
            }
        }
    }
}

struct AgeButton: View {
    @Environment(AppState.self) private var appState
    
    let emoji: String
    let title: String
    let subtitle: String
    let ageGroup: AgeGroup
    
    var body: some View {
        Button {
            appState.ageGroup = ageGroup
            appState.hasCompletedOnboarding = true
        } label: {
            HStack(spacing: 16) {
                Text(emoji)
                    .font(.system(size: 40))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .foregroundStyle(Color.kkGold)
                    
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(Color.kkTextLight)
                }
                
                Spacer()
            }
            .padding(16)
            .background(Color(red: 0.325, green: 0.290, blue: 0.718))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(red: 0.498, green: 0.467, blue: 0.867), lineWidth: 1.5)
            )
        }
    }
}
