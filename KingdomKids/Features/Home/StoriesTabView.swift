//
//  StoriesTabView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import SwiftUI

struct StoriesTabView: View {
    @Environment(AppState.self) private var appState

    private var filteredStories: [Story] {
        storiesData.filter { $0.ageGroups.contains(appState.ageGroup ?? .toddler) }
    }

    private var unlockedStories: [Story] {
        filteredStories.filter { !$0.isLocked }
    }

    private var lockedStories: [Story] {
        filteredStories.filter { $0.isLocked }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerView

                VStack(alignment: .leading, spacing: 12) {
                    unlockedSection
                    if !lockedStories.isEmpty {
                        lockedSection
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
        }
        .background(Color.kkPurpleDark.ignoresSafeArea())
        .scrollContentBackground(.hidden)
        .navigationDestination(for: Story.self) { story in
            StoryReaderView(story: story)
        }
    }

    // MARK: - Header

    private var headerView: some View {
        VStack(spacing: 4) {
            Text("📖")
                .font(.system(size: 36))
            Text("Bible Stories")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)
            Text("Learn from the greatest book ever written")
                .font(.caption)
                .foregroundStyle(Color.kkTextLight)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.kkPurpleDark)
    }

    // MARK: - Unlocked Section

    private var unlockedSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("READ NOW")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkPurpleLight)
                .padding(.top, 8)

            ForEach(unlockedStories, id: \.id) { story in
                NavigationLink(value: story) {
                    StoryCard(story: story)
                }
                .buttonStyle(.plain)
            }
        }
    }

    // MARK: - Locked Section

    private var lockedSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("COMING SOON")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkPurpleLight)

            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 8) {
                ForEach(lockedStories, id: \.id) { story in
                    LockedStoryCard(story: story)
                }
            }
        }
    }
}

// MARK: - Story Card

struct StoryCard: View {
    @Environment(AppState.self) private var appState
    let story: Story

    var body: some View {
        ZStack {
            decorativeBackground
            contentRow
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }

    private var decorativeBackground: some View {
        ZStack {
            story.color

            Circle()
                .fill(Color.white.opacity(0.08))
                .frame(width: 100, height: 100)
                .offset(x: 100, y: -20)

            Circle()
                .fill(Color.white.opacity(0.06))
                .frame(width: 70, height: 70)
                .offset(x: 120, y: 40)

            Text(story.emoji)
                .font(.system(size: 50))
                .opacity(0.15)
                .offset(x: 100, y: 0)
        }
    }

    private var contentRow: some View {
        HStack(spacing: 14) {
            Text(story.emoji)
                .font(.system(size: 44))
                .padding(.leading, 16)

            VStack(alignment: .leading, spacing: 4) {
                Text(story.title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.kkTextWhite)
                    .lineLimit(2)

                Text(story.subtitle)
                    .font(.caption2)
                    .foregroundStyle(Color.white.opacity(0.7))

                if appState.readStoryIDs.contains(story.id.uuidString) {
                    Text("✓ Read")
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(Color.white.opacity(0.2))
                        .clipShape(Capsule())
                }
            }

            Spacer()
        }
    }
}

// MARK: - Locked Story Card

struct LockedStoryCard: View {
    let story: Story

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 6) {
                Text(story.emoji)
                    .font(.system(size: 28))
                Text(story.title)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkTextLight.opacity(0.5))
                    .multilineTextAlignment(.center)
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
        StoriesTabView()
    }
    .environment(AppState())
}
