//
//  ChannelCard.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 6/11/26.
//

import SwiftUI

// MARK: - Channel Card

struct ChannelCard: View {
    let channel: Channel
    
    var body: some View {
        VStack(spacing: 0) {
            Image(channel.bannerImageChannel)
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 90)
                .clipped()
            
            Text(channel.channelName)
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkPurpleDeep)
                .multilineTextAlignment(.center)
                .padding(8)
                .frame(width: 160, height: 45)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
