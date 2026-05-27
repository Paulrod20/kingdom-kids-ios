//
//  HomeView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeTabView()
            }
            Tab("Games", systemImage: "gamecontroller") {
                GamesTabView()
            }
            Tab("Stories", systemImage: "book") {
                StoriesTabView()
            }
            Tab("Videos", systemImage: "play.circle") {
                VideosTabView()
            }
            Tab("More", systemImage: "ellipsis.circle") {
                MoreTabView()
            }
        }
        .tint(Color.kkGold)
    }
}


#Preview {
    HomeView()
        .environment(AppState())
}
