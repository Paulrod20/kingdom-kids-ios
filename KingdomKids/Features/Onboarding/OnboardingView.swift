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
            Color.kkPurpleDark.ignoresSafeArea()

            // Decorative background
            decorativeBackground

            VStack(spacing: 0) {
                // Top section
                VStack(spacing: 4) {
                    Text("👑")
                        .font(.system(size: 72))

                    Text("Kingdom Kids")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.kkGold)
                        .padding(.top, 8)

                    Text("A safe place to learn & grow in faith")
                        .font(.caption)
                        .foregroundStyle(Color.kkPurpleLight)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }
                .padding(.top, 80)

                // Divider
                Divider()
                    .overlay(Color.white.opacity(0.08))
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)

                // Question
                Text("Who is this for?")
                    .font(.headline)
                    .foregroundStyle(Color.kkTextWhite)
                    .padding(.bottom, 12)

                // Age buttons
                VStack(spacing: 10) {
                    AgeButton(
                        emoji: "🐣",
                        title: "Little One",
                        subtitle: "Ages 2 – 4 · Toddler",
                        ageGroup: .toddler,
                        color: Color.kkPurpleMid,
                        borderColor: Color(red: 0.498, green: 0.467, blue: 0.867)
                    )
                    AgeButton(
                        emoji: "🌟",
                        title: "Explorer",
                        subtitle: "Ages 5 – 8 · Growing faith",
                        ageGroup: .explorer,
                        color: Color(red: 0.059, green: 0.431, blue: 0.337),
                        borderColor: Color(red: 0.114, green: 0.620, blue: 0.459)
                    )
                }
                .padding(.horizontal, 40)

                // Verse card
                HStack {
                    Text("\"Let the little children come to me.\"")
                        .font(.caption2)
                        .italic()
                        .foregroundStyle(Color.kkGold)
                    Text("— Matthew 19:14")
                        .font(.caption2)
                        .foregroundStyle(Color.kkGold.opacity(0.7))
                }
                .multilineTextAlignment(.center)
                .padding(12)
                .frame(maxWidth: .infinity)
                .background(Color.kkGold.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal, 30)
                .padding(.top, 16)

                Spacer()
            }
        }
    }

    private var decorativeBackground: some View {
        ZStack {
            Text("✝")
                .font(.system(size: 60))
                .opacity(0.05)
                .offset(x: -120, y: -300)

            Text("⭐")
                .font(.system(size: 50))
                .opacity(0.05)
                .offset(x: 160, y: -150)

            Text("⭐")
                .font(.system(size: 50))
                .opacity(0.05)
                .offset(x: -140, y: 205)

            Text("✝")
                .font(.system(size: 40))
                .opacity(0.05)
                .offset(x: 140, y: 230)
        }
    }
}

struct AgeButton: View {
    @Environment(AppState.self) private var appState

    let emoji: String
    let title: String
    let subtitle: String
    let ageGroup: AgeGroup
    let color: Color
    let borderColor: Color

    var body: some View {
        Button {
            appState.ageGroup = ageGroup
            appState.hasCompletedOnboarding = true
        } label: {
            HStack(spacing: 12) {
                Text(emoji)
                    .font(.system(size: 40))

                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .foregroundStyle(Color.kkGold)

                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(Color.white.opacity(0.6))
                }

                Spacer()
            }
            .padding(16)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(borderColor, lineWidth: 1.5)
            )
        }
    }
}

#Preview {
    OnboardingView()
        .environment(AppState())
}
