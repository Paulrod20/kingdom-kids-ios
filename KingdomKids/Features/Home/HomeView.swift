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
                NavigationStack {
                    HomeTabView()
                }
            }
            Tab("Games", systemImage: "gamecontroller") {
                NavigationStack {
                    GamesTabView()
                }
            }
            Tab("Stories", systemImage: "book") {
                NavigationStack {
                    StoriesTabView()
                }
            }
            Tab("Videos", systemImage: "play.circle") {
                NavigationStack {
                    VideosTabView()
                }
            }
            Tab("More", systemImage: "ellipsis.circle") {
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
