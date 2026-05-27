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
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerView
                ageBadgeRow
                gamesSection
            }
        }
        .background(Color.kkPurpleDark.ignoresSafeArea())
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
    
    // MARK: - Games Section
    private var gamesSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("GAMES")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkPurpleLight)
                .padding(.horizontal, 16)
                .padding(.top, 16)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 10) {
                ForEach(filteredGames, id: \.id) { game in
                    GameCard(game: game)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
    }
}

struct GameCard: View {
    let game: Game
    
    var body: some View {
        Button {
            if !game.isLocked {
                // navigate to game — we'll wire this up later
                print("Tapped \(game.title)")
            }
        } label: {
            ZStack(alignment: .topTrailing) {
                VStack(spacing: 6) {
                    Text(game.emoji)
                        .font(.system(size: 36))
                    
                    Text(game.title)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.kkPurpleDeep)
                    
                    Text(game.subtitle)
                        .font(.caption2)
                        .foregroundStyle(Color.kkPurpleMid)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .opacity(game.isLocked ? 0.55 : 1.0)
                
                if game.isLocked {
                    Text("🔒")
                        .font(.caption2)
                        .padding(5)
                        .background(Color.kkOrange)
                        .clipShape(Circle())
                        .padding(6)
                } else {
                    Text("FREE")
                        .font(.system(size: 8))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.kkMintDark)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 2)
                        .background(Color.kkMint)
                        .clipShape(Capsule())
                        .padding(6)
                }
            }
        }
        .buttonStyle(.plain)
    }
} 

#Preview {
    GamesTabView()
        .environment(AppState())
}
