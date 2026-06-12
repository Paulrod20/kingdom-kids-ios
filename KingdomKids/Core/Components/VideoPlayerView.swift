//
//  VideoPlayerView.swift
//  KingdomKids
//

import SwiftUI
import SafariServices

struct VideoPlayerView: UIViewControllerRepresentable {
    let video: YouTubeVideo

    func makeUIViewController(context: Context) -> SFSafariViewController {
        let url = URL(string: video.videoURL)!
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = false
        let safari = SFSafariViewController(url: url, configuration: config)
        return safari
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}
