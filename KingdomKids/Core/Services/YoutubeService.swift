//
//  YouTubeService.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/29/26.
//

import Foundation

struct YouTubeVideo: Identifiable {
    let id: String
    let title: String
    let thumbnail: String
    let channelName: String
    let videoURL: String
}

struct YouTubeSearchResponse: Codable {
    let items: [YouTubeItem]
}

struct YouTubeItem: Codable {
    let id: YouTubeItemID
    let snippet: YouTubeSnippet
}

struct YouTubeItemID: Codable {
    let videoId: String?
}

struct YouTubeSnippet: Codable {
    let title: String
    let channelTitle: String
    let thumbnails: YouTubeThumbnails
}

struct YouTubeThumbnails: Codable {
    let medium: YouTubeThumbnail
}

struct YouTubeThumbnail: Codable {
    let url: String
}

class YouTubeService {
    static let shared = YouTubeService()
    
    private let apiKey = Config.youtubeAPIKey
    
    func fetchVideos(channelID: String, maxResults: Int = 10) async throws -> [YouTubeVideo] {
        let urlString = "https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=\(channelID)&maxResults=\(maxResults)&type=video&order=date&key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(YouTubeSearchResponse.self, from: data)
        
        return response.items.compactMap { item in
            guard let videoId = item.id.videoId else { return nil }
            return YouTubeVideo(
                id: videoId,
                title: item.snippet.title,
                thumbnail: item.snippet.thumbnails.medium.url,
                channelName: item.snippet.channelTitle,
                videoURL: "https://www.youtube.com/watch?v=\(videoId)"
            )
        }
    }
}
