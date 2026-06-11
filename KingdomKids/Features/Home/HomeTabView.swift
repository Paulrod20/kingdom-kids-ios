//
//  HomeTabView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/27/26.
//

import SwiftUI

struct HomeTabView: View {
    @Environment(AppState.self) private var appState
    
    private var todaysVerse: Verse {
        verseOfTheDayList.randomElement() ?? verseOfTheDayList[0]
    }
    
    private var featuredGames: [Game] {
        gamesData
            .filter { $0.ageGroups.contains(appState.ageGroup ?? .toddler) }
            .prefix(4)
            .map { $0 }
    }
    
    private var featuredStories: [Story] {
        storiesData
            .filter { $0.ageGroups.contains(appState.ageGroup ?? .toddler) }
            .prefix(4)
            .map { $0 }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerView
                verseCard
                featuredGamesSection
                featuredStoriesSection
            }
        }
        .background(Color.kkPurpleDark.ignoresSafeArea())
        .scrollContentBackground(.hidden)
    }
    
    // MARK: - Header
    private var headerView: some View {
        VStack(spacing: 4) {
            Text("👑")
                .font(.system(size: 36))
            Text("Kingdom Kids")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)
            Text(appState.ageGroup == .toddler ? "🐣 Toddler Mode" : "🌟 Explorer Mode")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkTextLight)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.kkPurpleDark)
    }
    
    // MARK: - Verse Card
    private var verseCard: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "book.fill")
                .foregroundStyle(Color.kkOrangeDark)
                .font(.title3)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\"\(todaysVerse.text)\"")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkOrangeDark)
                
                Text("\(todaysVerse.reference) · Verse of the day")
                    .font(.caption)
                    .foregroundStyle(Color.kkOrangeDark.opacity(0.7))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(Color.kkOrange)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .padding(.horizontal, 16)
        .padding(.top, 14)
    }
    
    // MARK: - Featured Games
    private var featuredGamesSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("GAMES")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkPurpleLight)
                Spacer()
                Text("See All")
                    .font(.caption)
                    .foregroundStyle(Color.kkGold)
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(featuredGames, id: \.id) { game in
                        HomeGameCard(game: game)
                            .frame(width: 140)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
    
    // MARK: - Featured Stories
    private var featuredStoriesSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("STORIES")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkPurpleLight)
                Spacer()
                Text("See All")
                    .font(.caption)
                    .foregroundStyle(Color.kkGold)
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(featuredStories, id: \.id) { story in
                        FeaturedStoryCard(story: story)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
        }
    }
}

#Preview {
    HomeTabView()
        .environment(AppState())
}
