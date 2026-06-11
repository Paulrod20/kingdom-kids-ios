//
//  FeaturedStoryCard.swift
//  KingdomKids
//

import SwiftUI

// MARK: - Featured Story Card

struct FeaturedStoryCard: View {
    let story: Story

    var body: some View {
        Button {
            if !story.isLocked {
                print("Tapped \(story.title)")
            }
        } label: {
            VStack(spacing: 6) {
                Text(story.emoji)
                    .font(.system(size: 36))

                Text(story.title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkPurpleDeep)
                    .multilineTextAlignment(.center)

                Text(story.subtitle)
                    .font(.caption2)
                    .foregroundStyle(Color.kkPurpleMid)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 140, height: 100)
            .padding(.vertical, 14)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .opacity(story.isLocked ? 0.55 : 1.0)
        }
        .buttonStyle(.plain)
    }
}
