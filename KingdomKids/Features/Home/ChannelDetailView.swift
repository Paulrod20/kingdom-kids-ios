//
//  ChannelDetailView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import SwiftUI

struct ChannelDetailView: View {
    let channel: Channel
    
    var body: some View {
        ZStack {
            Color.kkPurpleDark
                .ignoresSafeArea()
            
            Text("\(channel.channelName) coming soon!")
                .foregroundStyle(Color.kkGold)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
        }
        .navigationTitle(channel.channelName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChannelDetailView(channel: channelData[0])
}
