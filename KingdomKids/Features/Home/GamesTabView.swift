//
//  GamesTabView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/26/26.
//

import SwiftUI

struct GamesTabView: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        ZStack {
            Color.kkPurpleDark
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Text("👑")
                    .font(.system(size: 48))
                
                Text("Kingdom Kids")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkGold)
                
                Text(appState.ageGroup == .toddler ? "🐣 Toddler Mode" : "🌟Explorer Mode")
                    .font(.headline)
                    .foregroundStyle(Color.kkTextLight)
                
                Text("Games coming soon!")
                    .foregroundStyle(Color.kkTextLight)
            }
        }
    }
}

#Preview {
    GamesTabView()
        .environment(AppState())
}
