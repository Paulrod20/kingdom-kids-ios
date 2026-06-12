//
//  ChannelDetailView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import SwiftUI

struct ChannelDetailView: View {
    @Environment(AppState.self) private var appState
    let channel: Channel

    private var videos: [YouTubeVideo] {
        appState.channelVideos[channel.channelId] ?? []
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                bannerSection
                infoSection
                videosSection
            }
        }
        .background(Color.kkPurpleDark.ignoresSafeArea())
        .navigationTitle(channel.channelName)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Banner

    private var bannerSection: some View {
        Image(channel.bannerImageChannel)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .frame(height: 120)
            .clipped()
    }

    // MARK: - Info

    private var infoSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(channel.channelName)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.kkGold)

            Text(channel.description)
                .font(.caption)
                .foregroundStyle(Color.kkTextLight)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.kkPurpleMid.opacity(0.4))
    }
    
    // MARK: - Videos

    private var videosSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("VIDEOS")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkPurpleLight)
                .padding(.horizontal, 16)
                .padding(.top, 16)

            if appState.isLoadingVideos {
                ProgressView()
                    .tint(Color.kkGold)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 40)
            } else if videos.isEmpty {
                Text("No videos available")
                    .font(.caption)
                    .foregroundStyle(Color.kkTextLight)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 40)
            } else {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 12) {
                    ForEach(videos) { video in
                        VideoCard(video: video)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ChannelDetailView(channel: channelData[0])
    }
    .environment(AppState())
}
