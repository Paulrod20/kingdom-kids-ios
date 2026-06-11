//
//  HomeGameCard.swift
//  KingdomKids
//

import SwiftUI

// MARK: - Home Game Card

struct HomeGameCard: View {
    let game: Game

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 6) {
                Text(game.emoji)
                    .font(.system(size: 36))

                Text(game.title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkPurpleDeep)

                Text(game.subtitle)
                    .font(.caption2)
                    .foregroundStyle(Color.kkPurpleMid)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .opacity(game.isLocked ? 0.55 : 1.0)

            if game.isLocked {
                Text("🔒")
                    .font(.caption2)
                    .padding(5)
                    .background(Color.kkOrange)
                    .clipShape(Circle())
                    .padding(6)
            }
        }
    }
}
