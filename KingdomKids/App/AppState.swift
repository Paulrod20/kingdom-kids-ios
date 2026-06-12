//
//  AppState.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/26/26.
//

import Foundation

enum AgeGroup {
    case toddler
    case explorer
}

@Observable
class AppState {
    var ageGroup: AgeGroup? = nil
    var hasCompletedOnboarding: Bool = false
    var selectedAvatar: String = "⭐️"
    var isAuthenticated: Bool = false

    var channelVideos: [String: [YouTubeVideo]] = [:]
    var isLoadingVideos: Bool = true

    func loadVideos() async {
        let filtered = channelData.filter {
            $0.ageGroup.contains(ageGroup ?? .toddler)
        }
        await withTaskGroup(of: (String, [YouTubeVideo]).self) { group in
            for channel in filtered {
                group.addTask {
                    do {
                        let videos = try await YouTubeService.shared.fetchVideos(
                            channelID: channel.channelId
                        )
                        return (channel.channelId, videos)
                    } catch {
                        return (channel.channelId, [])
                    }
                }
            }
            for await (channelId, videos) in group {
                self.channelVideos[channelId] = videos
            }
        }
        isLoadingVideos = false
    }
}
