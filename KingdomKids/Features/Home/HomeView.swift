//
//  HomeView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: String = "Home"

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "house", value: "Home") {
                NavigationStack {
                    HomeTabView(selectedTab: $selectedTab)
                }
            }
            Tab("Games", systemImage: "gamecontroller", value: "Games") {
                NavigationStack {
                    GamesTabView()
                }
            }
            Tab("Stories", systemImage: "book", value: "Stories") {
                NavigationStack {
                    StoriesTabView()
                }
            }
            Tab("Videos", systemImage: "play.circle", value: "Videos") {
                NavigationStack {
                    VideosTabView()
                }
            }
            Tab("More", systemImage: "ellipsis.circle", value: "More") {
                NavigationStack {
                    MoreTabView()
                }
                .toolbarColorScheme(.dark, for: .navigationBar)
            }
        }
        .tint(Color.kkGold)
    }
}

#Preview {
    HomeView()
        .environment(AppState())
}
