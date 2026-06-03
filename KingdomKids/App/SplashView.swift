//
//  SplashView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 6/3/26.
//

import SwiftUI

struct SplashView: View {
    @State private var opacity = 0.0
    @State private var scale = 0.0
    
    var body: some View {
        ZStack {
            Color.kkPurpleDark
                .ignoresSafeArea()
            
            VStack {
                Text("👑")
                    .font(.system(size: 80))
                    .scaleEffect(scale)
                
                Text("Kingdom Kids")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkGold)
                
                Text("A safe place to learn & grow in faith")
                    .font(.subheadline)
                    .foregroundStyle(Color.kkTextLight)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            .opacity(opacity)
        }
        .onAppear {
            withAnimation(.easeIn(duration: 0.8)) {
                opacity = 1.0
                scale = 1.0
            }
        }
    }
}

#Preview {
    SplashView()
}
