//
//  AboutView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 6/8/26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            Color.kkPurpleDark
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    headerSection
                    missionSection
                    featuresSection
                    creditSection
                }
                .padding(24)
            }
        }
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 12) {
            Text("👑")
                .font(.system(size: 64))
            
            Text("Kingdom Kids")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)
            
            Text("Version 1.0.0")
                .font(.caption)
                .foregroundStyle(Color.kkTextLight)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 20)
    }
    
    // MARK: - Mission
    private var missionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Our Mission")
                .font(.headline)
                .foregroundStyle(Color.kkGold)
            
            Text("Kingdom Kids is a safe, faith-based app designed for Christian families with young children ages 2–8. Our goal is to give parents a screen time option they can feel good about — one that quietly reinforces faith, scripture, and values while kids think they're just having fun.")
                .font(.subheadline)
                .foregroundStyle(Color.kkTextLight)
                .lineSpacing(6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color.kkPurpleMid.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    // MARK: - Features
    private var featuresSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("What's Inside")
                .font(.headline)
                .foregroundStyle(Color.kkGold)
            
            VStack(alignment: .leading, spacing: 10) {
                featureRow(emoji: "🎮", title: "Faith-Themed Games", description: "Bible character card matching, puzzles, and more")
                featureRow(emoji: "📖", title: "Bible Stories", description: "Illustrated stories from the Old and New Testament")
                featureRow(emoji: "📺", title: "Curated Videos", description: "Hand-picked Christian kids YouTube channels")
                featureRow(emoji: "🐣", title: "Age Appropriate", description: "Content tailored for Toddlers (2–4) and Explorers (5–8)")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color.kkPurpleMid.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    private func featureRow(emoji: String, title: String, description: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text(emoji)
                .font(.title3)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkTextWhite)
                
                Text(description)
                    .font(.caption)
                    .foregroundStyle(Color.kkTextLight)
            }
        }
    }
    
    // MARK: - Credit
    private var creditSection: some View {
        VStack(spacing: 8) {
            Text("Made with ❤️ and faith")
                .font(.subheadline)
                .foregroundStyle(Color.kkTextLight)
            
            Text("© 2026 Kingdom Kids")
                .font(.caption)
                .foregroundStyle(Color.kkTextLight.opacity(0.6))
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 20)
    }
}

#Preview {
    NavigationStack {
        AboutView()
    }
}
