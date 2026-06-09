//
//  TermsOfUseView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 6/9/26.
//

//
//  TermsOfUseView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 6/9/26.
//

import SwiftUI

struct TermsOfUseView: View {
    var body: some View {
        ZStack {
            Color.kkPurpleDark
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    headerSection
                    
                    section(
                        title: "Acceptance of Terms",
                        content: "By using Kingdom Kids, you agree to these Terms of Use. Parents or guardians are responsible for supervising their child’s use of the app."
                    )
                    
                    section(
                        title: "Educational Purpose",
                        content: "Kingdom Kids is designed to provide faith-based educational and entertainment content for children in a safe and encouraging environment."
                    )
                    
                    section(
                        title: "Content Disclaimer",
                        content: "We strive to provide age-appropriate Christian content. Some videos and media are provided through third-party services such as YouTube."
                    )
                    
                    section(
                        title: "Parental Responsibility",
                        content: "Parents and guardians are responsible for monitoring their child’s activity and determining whether content is appropriate for their family."
                    )
                    
                    section(
                        title: "Prohibited Use",
                        content: "Users may not misuse the app, attempt unauthorized access, disrupt services, or upload inappropriate content."
                    )
                    
                    section(
                        title: "Changes to the App",
                        content: "Kingdom Kids may update features, content, or policies at any time to improve the experience and maintain safety."
                    )
                    
                    section(
                        title: "Contact",
                        content: "If you have questions regarding these Terms of Use, please contact us through the Support section of the app."
                    )
                    
                    Text("Last updated: June 2026")
                        .font(.caption)
                        .foregroundStyle(Color.kkTextLight.opacity(0.6))
                        .padding(.bottom, 20)
                }
                .padding(24)
            }
        }
        .navigationTitle("Terms of Use")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Terms of Use")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)
            
            Text("Please review these terms before using Kingdom Kids.")
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
        TermsOfUseView()
    }
}
