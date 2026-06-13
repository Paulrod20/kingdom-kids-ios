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
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerView
                storiesSection
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
    
    // MARK: - Stories Section
    private var storiesSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("STORIES")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkPurpleLight)
                .padding(.horizontal, 16)
                .padding(.top, 16)
            
            VStack(spacing: 10) {
                ForEach(filteredStories, id: \.id) { story in
                    StoryCard(story: story)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
    }
}

// MARK: - Story Card
struct StoryCard: View {
    let story: Story

    var body: some View {
        NavigationLink(value: story) {
            HStack(spacing: 14) {
                Text(story.emoji)
                    .font(.system(size: 40))
                    .frame(width: 56, height: 56)
                    .background(Color.kkPurpleLight.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                VStack(alignment: .leading, spacing: 4) {
                    Text(story.title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.kkPurpleDeep)

                    Text(story.subtitle)
                        .font(.caption)
                        .foregroundStyle(Color.kkPurpleMid)
                }

                Spacer()

                if story.isLocked {
                    Text("🔒")
                        .font(.caption)
                        .padding(6)
                        .background(Color.kkOrange)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundStyle(Color.kkPurpleLight)
                }
            }
            .padding(14)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .opacity(story.isLocked ? 0.7 : 1.0)
        }
        .buttonStyle(.plain)
        .disabled(story.isLocked)
    }
}

//#Preview {
//    StoriesTabView()
//        .environment(AppState())
//}
