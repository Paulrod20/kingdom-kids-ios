//
//  StoryReaderView.swift
//  KingdomKids
//

import SwiftUI

struct StoryReaderView: View {
    let story: Story
    @Environment(AppState.self) private var appState

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                heroSection
                divider
                storyBody
                scriptureCard
                completionBadge
            }
            .padding(.bottom, 32)
        }
        .background(Color(red: 0.961, green: 0.941, blue: 0.910).ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Hero

    private var heroSection: some View {
        VStack(spacing: 8) {
            Text(story.emoji)
                .font(.system(size: 80))
                .padding(.top, 24)

            Text(story.title)
                .font(.custom("Georgia", size: 22))
                .fontWeight(.bold)
                .foregroundStyle(Color(red: 0.235, green: 0.165, blue: 0.0))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            Text(story.subtitle)
                .font(.caption)
                .foregroundStyle(Color(red: 0.545, green: 0.412, blue: 0.078))
                .padding(.top, 2)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 16)
    }

    // MARK: - Divider

    private var divider: some View {
        Rectangle()
            .fill(Color(red: 0.545, green: 0.412, blue: 0.078).opacity(0.2))
            .frame(height: 1)
            .padding(.horizontal, 24)
            .padding(.bottom, 20)
    }

    // MARK: - Story Body

    private var storyBody: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(story.pages, id: \.self) { page in
                Text(page)
                    .font(.custom("Georgia", size: 16))
                    .foregroundStyle(Color(red: 0.235, green: 0.165, blue: 0.0))
                    .lineSpacing(6)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
    }

    // MARK: - Scripture Card

    private var scriptureCard: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("SCRIPTURE")
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundStyle(Color(red: 0.545, green: 0.412, blue: 0.078))

            Text("\"\(story.scriptureText)\"")
                .font(.custom("Georgia", size: 13))
                .italic()
                .foregroundStyle(Color(red: 0.360, green: 0.290, blue: 0.0))
                .lineSpacing(4)

            Text(story.scripture)
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundStyle(Color(red: 0.722, green: 0.525, blue: 0.043))
                .padding(.top, 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color(red: 0.918, green: 0.702, blue: 0.024).opacity(0.15))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color(red: 0.918, green: 0.702, blue: 0.024).opacity(0.4), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .padding(.horizontal, 24)
        .padding(.bottom, 16)
    }

    // MARK: - Completion Badge

    private var completionBadge: some View {
        Group {
            if appState.readStoryIDs.contains(story.id.uuidString) {
                Text("✓ You read this story!")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(red: 0.031, green: 0.314, blue: 0.255))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color(red: 0.031, green: 0.314, blue: 0.255).opacity(0.12))
                    .overlay(
                        Capsule()
                            .stroke(Color(red: 0.031, green: 0.314, blue: 0.255).opacity(0.3), lineWidth: 1)
                    )
                    .clipShape(Capsule())
                    .padding(.horizontal, 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .onAppear {
            appState.markStoryAsRead(story)
        }
    }
}

#Preview {
    NavigationStack {
        StoryReaderView(story: storiesData[0])
    }
    .environment(AppState())
}
