//
//  MoreTabView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import SwiftUI

struct MoreTabView: View {
    var body: some View {
        ZStack {
            Color.kkPurpleDark
                .ignoresSafeArea()

            Text("More coming soon!")
                .foregroundStyle(Color.kkGold)
                .font(.headline)
        }
    }
}

#Preview {
    MoreTabView()
}
