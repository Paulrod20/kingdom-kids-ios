//
//  VideoCard.swift
//  KingdomKids
//

import SwiftUI

// MARK: - Video Card

struct VideoCard: View {
    @Environment(\.openURL) private var openURL
    @State private var showPlayer = false
    
    let video: YouTubeVideo

    var body: some View {
        Button {
            showPlayer = true
        } label: {
            VStack(alignment: .leading, spacing: 6) {
                AsyncImage(url: URL(string: video.thumbnail)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure(_), .empty:
                        ZStack {
                            Color.kkPurpleMid
                            Image(systemName: "play.circle.fill")
                                .font(.system(size: 32))
                                .foregroundStyle(Color.kkGold)
                        }
                    @unknown default:
                        Color.kkPurpleMid
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 90)
                .clipped()

                Text(video.title)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkPurpleDeep)
                    .lineLimit(2)
                    .padding(.horizontal, 8)

                Text(video.channelName)
                    .font(.caption2)
                    .foregroundStyle(Color.kkPurpleMid)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 8)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $showPlayer) {
            VideoPlayerView(video: video)
        }
    }
}
