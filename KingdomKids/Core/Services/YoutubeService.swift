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

struct GoogleAPIErrorResponse: Decodable {
    struct ErrorBody: Decodable {
        let code: Int
        let message: String
        let status: String
    }
    let error: ErrorBody
}

class YouTubeService {
    static let shared = YouTubeService()
    
    private let apiKey = Config.youtubeAPIKey
    
    func fetchVideos(channelID: String, maxResults: Int = 10) async throws -> [YouTubeVideo] {
        #if DEBUG
        print("🔑 Using API Key from Config (hidden)")
        #endif
        let urlString = "https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=\(channelID)&maxResults=\(maxResults)&type=video&order=date&key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let http = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...299).contains(http.statusCode) else {
            #if DEBUG
            if let apiError = try? JSONDecoder().decode(GoogleAPIErrorResponse.self, from: data) {
                print("YouTube API error: \(apiError.error.code) \(apiError.error.status) - \(apiError.error.message)")
            } else {
                print("YouTube API error: HTTP \(http.statusCode)")
            }
            #endif
            throw URLError(.badServerResponse)
        }
        
        let responseModel = try JSONDecoder().decode(YouTubeSearchResponse.self, from: data)
        
        return responseModel.items.compactMap { item in
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
