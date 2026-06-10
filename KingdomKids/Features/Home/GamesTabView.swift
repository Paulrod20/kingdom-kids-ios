//
//  GamesTabView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import SwiftUI

struct GamesTabView: View {
    @Environment(AppState.self) private var appState

    private var filteredGames: [Game] {
        gamesData.filter { $0.ageGroups.contains(appState.ageGroup ?? .toddler) }
    }

    private var featuredGames: [Game] {
        filteredGames.filter { !$0.isLocked }
    }

    private var lockedGames: [Game] {
        filteredGames.filter { $0.isLocked }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerView
                ageBadgeRow

                VStack(spacing: 12) {
                    featuredSection
                    if !lockedGames.isEmpty {
                        comingSoonSection
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
        }
        .background(Color.kkPurpleDark.ignoresSafeArea())
        .navigationDestination(for: GameDestination.self) { destination in
            switch destination {
            case .bibleTrivia:
                BibleTriviaView()
            case .cardMatch:
                CardMatchView()
            }
        }
    }

    // MARK: - Header

    private var headerView: some View {
        VStack(spacing: 4) {
            Text("👑")
                .font(.system(size: 36))
            Text("Games")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)
            Text("Learn while you play!")
                .font(.caption)
                .foregroundStyle(Color.kkTextLight)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
    }

    // MARK: - Age Badge Row

    private var ageBadgeRow: some View {
        HStack(spacing: 8) {
            ageBadge(label: "🐣 Toddler", group: .toddler)
            ageBadge(label: "🌟 Explorer", group: .explorer)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
    }

    private func ageBadge(label: String, group: AgeGroup) -> some View {
        let isActive = appState.ageGroup == group
        return Text(label)
            .font(.caption)
            .fontWeight(.semibold)
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
            .background(isActive ? Color.kkOrange : Color.kkPurpleMid)
            .foregroundStyle(isActive ? Color.kkOrangeDark : Color.kkTextLight)
            .clipShape(Capsule())
    }

    // MARK: - Featured Section

    private var featuredSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("PLAY NOW")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkPurpleLight)

            ForEach(featuredGames, id: \.id) { game in
                if let destination = game.destination, let color = game.bannerColor {
                    NavigationLink(value: destination) {
                        BannerGameCard(game: game, color: color)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    // MARK: - Coming Soon Section

    private var comingSoonSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("COMING SOON")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkPurpleLight)

            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 8) {
                ForEach(lockedGames, id: \.id) { game in
                    LockedGameCard(game: game)
                }
            }
        }
    }
}

// MARK: - Banner Game Card

struct BannerGameCard: View {
    let game: Game
    let color: Color

    var body: some View {
        ZStack {
            decorativeBackground
            contentRow
        }
        .frame(maxWidth: .infinity)
        .frame(height: 110)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }

    private var decorativeBackground: some View {
        ZStack {
            color

            Circle()
                .fill(Color.white.opacity(0.08))
                .frame(width: 120, height: 120)
                .offset(x: 100, y: -30)

            Circle()
                .fill(Color.white.opacity(0.06))
                .frame(width: 80, height: 80)
                .offset(x: 120, y: 40)

            Circle()
                .fill(Color.white.opacity(0.05))
                .frame(width: 60, height: 60)
                .offset(x: -20, y: 40)
        }
    }

    private var contentRow: some View {
        HStack(spacing: 16) {
            Text(game.emoji)
                .font(.system(size: 52))
                .padding(.leading, 20)

            VStack(alignment: .leading, spacing: 4) {
                Text(game.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.kkTextWhite)

                Text(game.description)
                    .font(.caption)
                    .foregroundStyle(Color.white.opacity(0.75))

                Text("▶  PLAY FREE")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.kkOrangeDark)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .background(Color.kkGold)
                    .clipShape(Capsule())
                    .padding(.top, 2)
            }

            Spacer()
        }
    }
}

// MARK: - Locked Game Card

struct LockedGameCard: View {
    let game: Game

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 6) {
                Text(game.emoji)
                    .font(.system(size: 28))
                Text(game.title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkTextLight.opacity(0.5))
                    .multilineTextAlignment(.center)
                Text(game.subtitle)
                    .font(.caption2)
                    .foregroundStyle(Color.kkPurpleLight.opacity(0.5))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .opacity(0.6)

            Text("🔒")
                .font(.caption2)
                .padding(5)
                .background(Color.kkPurpleMid)
                .clipShape(Circle())
                .padding(6)
        }
    }
}

#Preview {
    NavigationStack {
        GamesTabView()
    }
    .environment(AppState())
}
