//
//  PrivacyPolicyView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 6/9/26.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ZStack {
            Color.kkPurpleDark
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    headerSection
                    section(title: "Information We Collect", content: "Kingdom Kids does not collect personal information from children. Parents may create an account using an email address or Sign in with Apple. We do not collect names, addresses, phone numbers, or any personal information from children using the app.")
                    section(title: "How We Use Information", content: "Parent account information is used solely to provide access to the app and sync preferences across devices. We do not sell, trade, or share personal information with third parties.")
                    section(title: "Children's Privacy (COPPA)", content: "Kingdom Kids is designed for children ages 2-8 and is operated in compliance with the Children's Online Privacy Protection Act (COPPA). We do not knowingly collect personal information from children under 13 without verifiable parental consent.")
                    section(title: "YouTube Content", content: "Kingdom Kids displays content from YouTube via the YouTube Data API. YouTube's privacy policy applies to video content displayed within the app. We curate channels to ensure age-appropriate content but cannot guarantee all content on external platforms.")
                    section(title: "Data Storage", content: "App preferences and progress are stored locally on your device and synced via Apple's CloudKit service. We do not operate our own data servers for user data storage.")
                    section(title: "Contact Us", content: "If you have questions about this Privacy Policy, please contact us through the Support section of the app.")
                    
                    Text("Last updated: June 2026")
                        .font(.caption)
                        .foregroundStyle(Color.kkTextLight.opacity(0.6))
                        .padding(.bottom, 20)
                }
                .padding(24)
            }
        }
        .navigationTitle("Privacy Policy")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Privacy Policy")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)
            
            Text("Your family's privacy is important to us.")
                .font(.subheadline)
                .foregroundStyle(Color.kkTextLight)
        }
    }
    
    private func section(title: String, content: String) -> some View {
        InfoCard {
            Text(title)
                .font(.headline)
                .foregroundStyle(Color.kkGold)
            
            Text(content)
                .font(.subheadline)
                .foregroundStyle(Color.kkTextLight)
                .lineSpacing(6)
        }
    }
}

#Preview {
    NavigationStack {
        PrivacyPolicyView()
    }
}
