//
//  VideosTabView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import SwiftUI

struct VideosTabView: View {
    var body: some View {
        ZStack {
            Color.kkPurpleDark
                .ignoresSafeArea()

            Text("Videos coming soon!")
                .foregroundStyle(Color.kkGold)
                .font(.headline)
        }
    }
}

#Preview {
    VideosTabView()
}
