//
//  MoreTabView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import SwiftUI

struct MoreTabView: View {
    @Environment(AppState.self) private var appState
    @State private var showAvatarPicker = false
    
    let avatars = ["⭐️", "🦁", "🐣", "🌟", " 🦋", "🐬", "🦊", "🐸"]
    
    var body: some View {
        List {
            profileSection
            subscriptionSection
            appSection
            supportSection
        }
        .scrollContentBackground(.hidden)
        .background(Color.kkPurpleDark.ignoresSafeArea())
        .navigationTitle("More")
        .sheet(isPresented: $showAvatarPicker) {
            AvatarPickerView(avatars: avatars)
                .environment(appState)
        }
    }
    
    // MARK: - Profile Section
    private var profileSection: some View {
        Section {
            HStack(spacing: 16) {
                Text(appState.selectedAvatar)
                    .font(.system(size: 48))
                    .frame(width: 64, height: 64)
                    .background(Color.kkPurpleLight.opacity(0.2))
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Your Avatar")
                        .font(.headline)
                        .foregroundStyle(Color.kkTextWhite)
                    Text("Tap to change")
                        .font(.caption)
                        .foregroundStyle(Color.kkTextLight)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.kkPurpleLight)
                    .font(.caption)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                showAvatarPicker = true
            }
            
            HStack {
                Label("Age Group", systemImage: "person.fill")
                    .foregroundStyle(Color.kkTextWhite)
                Spacer()
                Picker("", selection: Binding(
                    get: { appState.ageGroup ?? .toddler },
                    set: { appState.ageGroup = $0}
                )) {
                    Text("🐣 Toddler").tag(AgeGroup.toddler)
                    Text("🌟 Explorer").tag(AgeGroup.explorer)
                }
                .pickerStyle(.menu)
                .tint(Color.kkGold)
            }
        } header: {
            Text("Profile")
                .foregroundStyle(Color.kkTextLight)
        }
        .listRowBackground(Color.kkPurpleMid.opacity(0.3))
    }
    
    // MARK: - Subscription Section
    private var subscriptionSection: some View {
        Section {
            HStack {
                Label("Current Plan", systemImage: "crown.fill")
                    .foregroundStyle(Color.kkTextWhite)
                Spacer()
                Text("Free")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkOrangeDark)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.kkOrange)
                    .clipShape(Capsule())
            }
            
            Button {
                // paywall - wire up later
            } label: {
                HStack {
                    Label("Upgrade to Premium", systemImage: "star.fill")
                        .foregroundStyle(Color.kkGold)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.kkPurpleLight)
                        .font(.caption)
                }
            }
            
            Button {
                // restore purchases - wire up later
            } label: {
                Label("Restore Purchases", systemImage: "arrow.clockwise")
                    .foregroundStyle(Color.kkTextLight)
            }
        } header: {
            Text("Subscription")
                .foregroundStyle(Color.kkTextLight)
        }
        .listRowBackground(Color.kkPurpleMid.opacity(0.3))
    }
    
    // MARK: - App Section
    private var appSection: some View {
        Section {
            Button {
                
            } label: {
                HStack {
                    Label("About Kingdom Kids", systemImage: "info.circle")
                        .foregroundStyle(Color.kkTextWhite)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.kkPurpleLight)
                        .font(.caption)
                }
            }
            
            Button {
                
            } label: {
                HStack {
                    Label("Privacy Policy", systemImage: "lock.shield")
                        .foregroundStyle(Color.kkTextWhite)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.kkPurpleLight)
                        .font(.caption)
                }
            }
            
            Button {
                
            } label: {
                HStack {
                    Label("Terms of Use", systemImage: "doc.text")
                        .foregroundStyle(Color.kkTextWhite)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.kkPurpleLight)
                        .font(.caption)
                }
            }
            
            Button {
                 
            } label: {
                HStack {
                    Label("Rate on the App Store", systemImage: "star.fill")
                        .foregroundStyle(Color.kkTextWhite)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.kkPurpleLight)
                        .font(.caption)
                }
            }
        } header: {
            Text("App")
                .foregroundStyle(Color.kkTextLight)
        }
        .listRowBackground(Color.kkPurpleMid.opacity(0.3))
    }
    
    // MARK: - Support Section
    private var supportSection: some View {
        Section {
            Button {
                
            } label: {
                HStack {
                    Label("Contact Us", systemImage: "envelope")
                        .foregroundStyle(Color.kkTextWhite)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.kkPurpleLight)
                        .font(.caption)
                }
            }
            
            Button {
            } label: {
                HStack {
                    Label("Request a Bible Story", systemImage: "book")
                        .foregroundStyle(Color.kkTextWhite)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.kkPurpleLight)
                        .font(.caption)
                }
            }
            
            Button {
            } label: {
                HStack {
                    Label("Request a Channel", systemImage: "play.circle")
                        .foregroundStyle(Color.kkTextWhite)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.kkPurpleLight)
                        .font(.caption)
                }
            }
        } header: {
            Text("Support")
                .foregroundStyle(Color.kkTextLight)
        }
        .listRowBackground(Color.kkPurpleMid.opacity(0.3))
    }
}

// MARK: - Avatar Picker
struct AvatarPickerView: View {
    @Environment(AppState.self) private var appState
    @Environment(\.dismiss) private var dismiss
    let avatars: [String]
    
    var body: some View {
        ZStack {
            Color.kkPurpleDark.ignoresSafeArea()
            
            VStack(spacing: 24) {
                Text("Choose Your Avatar")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkGold)
                    .padding (.top, 32)
                
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                ], spacing: 16) {
                    ForEach(avatars, id: \.self) { avatar in
                        Button {
                            appState.selectedAvatar = avatar
                            dismiss()
                        } label : {
                            Text(avatar)
                                .font(.system(size: 44))
                                .frame(width: 64, height: 64)
                                .background(appState.selectedAvatar == avatar ? Color.kkOrange : Color.kkPurpleMid)
                                .clipShape(Circle())
                        }
                    }
                }
                .padding(.horizontal, 24)
                Spacer()
            }
        }
    }
}

#Preview {
    MoreTabView()
        .environment(AppState())
}
