//
//  InfoCard.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 6/9/26.
//

import SwiftUI

struct InfoCard<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.kkPurpleMid.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ZStack {
        Color.kkPurpleDark
            .ignoresSafeArea()
        
        InfoCard {
            Text("Example Title")
                .font(.headline)
                .foregroundStyle(Color.kkGold)
            
            Text("Reusable card styling for Kingdom Kids.")
                .font(.subheadline)
                .foregroundStyle(Color.kkTextLight)
        }
        .padding()
    }
}
