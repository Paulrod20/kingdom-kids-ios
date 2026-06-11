//
//  VideosTabView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import SwiftUI

struct VideosTabView: View {
    @Environment(AppState.self) private var appState
    @State private var channelVideos: [String: [YouTubeVideo]] = [:]
    @State private var isLoading = true
    
    private var filteredChannels: [Channel] {
        channelData.filter { $0.ageGroup.contains(appState.ageGroup ?? .toddler) }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerView
                
                if isLoading {
                    loadingView
                } else {
                    channelsRow
                    videosByChannelSection
                }
            }
        }
        .background(Color.kkPurpleDark.ignoresSafeArea())
        .scrollContentBackground(.hidden)
        .task {
            await loadAllVideos()
        }
    }
    
    // MARK: - Header
    private var headerView: some View {
        VStack(spacing: 4) {
            Text("📺")
                .font(.system(size: 36))
            Text("Videos")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)
            Text("Curated Christian content for your little one")
                .font(.caption)
                .foregroundStyle(Color.kkTextLight)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.kkPurpleDark)
    }
    
    // MARK: - Loading
    private var loadingView: some View {
        VStack(spacing: 16) {
            ProgressView()
                .tint(Color.kkGold)
                .scaleEffect(1.5)
            Text("Loading videos...")
                .font(.caption)
                .foregroundStyle(Color.kkTextLight)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 60)
    }
    
    // MARK: - Channels Row
    private var channelsRow: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("CHANNELS")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkPurpleLight)
                .padding(.horizontal, 16)
                .padding(.top, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(filteredChannels, id: \.id) { channel in
                        NavigationLink(destination: ChannelDetailView(channel: channel)) {
                            ChannelCard(channel: channel)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
    
    // MARK: - Videos by Channel
    private var videosByChannelSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(filteredChannels, id: \.id) { channel in
                if let videos = channelVideos[channel.channelId], !videos.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text(channel.channelName)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.kkPurpleLight)
                            Spacer()
                            NavigationLink(destination: ChannelDetailView(channel: channel)) {
                                Text("See All")
                                    .font(.caption)
                                    .foregroundStyle(Color.kkGold)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(videos.prefix(5)) { video in
                                    VideoCard(video: video)
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                }
            }
        }
        .padding(.bottom, 16)
    }
    
    // MARK: - Load Videos
    private func loadAllVideos() async {
        await withTaskGroup(of: (String, [YouTubeVideo]).self) { group in
            for channel in filteredChannels {
                group.addTask {
                    do {
                        let videos = try await YouTubeService.shared.fetchVideos(channelID: channel.channelId)
                        return (channel.channelId, videos)
                    } catch {
                        return (channel.channelId, [])
                    }
                }
            }
            for await (channelId, videos) in group {
                channelVideos[channelId] = videos
            }
        }
        isLoading = false
    }
}

#Preview {
    VideosTabView()
        .environment(AppState())
}
