//
//  OnboardingView.swift
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
            
            VStack(spacing: 0) {
                // Top section
                VStack(spacing: 0) {
                    Text("👑")
                        .font(.system(size: 72))
                    
                    Text("Kingdom Kids")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.kkGold)
                        .padding(.top, 12)
                    
                    Text("A safe place to learn & grow in faith")
                        .font(.subheadline)
                        .foregroundStyle(Color.kkTextLight)
                        .multilineTextAlignment(.center)
                        .padding(.top, 8)
                        .padding(.horizontal, 40)
                }
                .padding(.top, 80)
                
                Spacer()
                
                // Bottom section
                VStack(spacing: 0) {
                    Text("How old is your little one?")
                        .font(.headline)
                        .foregroundStyle(Color.kkTextWhite)
                    
                    VStack(spacing: 12) {
                        AgeButton(
                            emoji: "🐣",
                            title: "Toddler",
                            subtitle: "Ages 2 – 4",
                            ageGroup: .toddler
                        )
                        AgeButton(
                            emoji: "🌟",
                            title: "Explorer",
                            subtitle: "Ages 5 – 8",
                            ageGroup: .explorer
                        )
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                }
                .padding(.bottom, 250)
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
            .background(Color.kkPurpleMid)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.kkPurpleLight, lineWidth: 1.5)
            )
        }
    }
}

#Preview {
    OnboardingView()
        .environment(AppState())
}
