//
//  AuthView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 6/4/26.
//

import SwiftUI

struct AuthView: View {
    @Environment(AppState.self) private var appState
    @State private var email = ""
    @State private var password = ""
    @State private var isSignIn = true
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Color.kkPurpleDark
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 0) {
                    logoSection
                    authCard
                    toggleSection
                }
                .padding(.horizontal, 24)
            }
        }
    }
    
    // MARK: - Logo Section
    private var logoSection: some View {
        VStack(spacing: 12) {
            Text("👑")
                .font(.system(size: 64))
                .padding(.top, 60)
            
            Text("Kingdom Kids")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkTextLight)
                .multilineTextAlignment(.center)
            
            Text("A safe place to learn & grow in faith")
                .font(.subheadline)
                .foregroundStyle(Color.kkTextLight)
                .multilineTextAlignment(.center)
        }
        .padding(.bottom, 40)
    }
    
    // MARK: - Auth Card
    private var authCard: some View {
        VStack(spacing: 16) {
            appleSignInButton
            divider
            emailField
            passwordField
            submitButton
        }
        .padding(24)
        .background(Color.kkPurpleMid.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.kkPurpleLight.opacity(0.3), lineWidth: 1)
        )
    }
    
    // MARK: - Apple Sign In Button
    private var appleSignInButton: some View {
        Button {
            signInWithApple()
        } label: {
            HStack(spacing: 8) {
                Image(systemName: "apple.logo")
                    .font(.title3)
                Text(isSignIn ? "Sign in with Apple" : "Sign up with Apple")
                    .font(.headline)
            }
            .foregroundStyle(Color.kkPurpleDark)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }
    
    // MARK: - Divider
    private var divider: some View {
        HStack {
            Rectangle()
                .fill(Color.kkPurpleLight.opacity(0.4))
                .frame(height: 1)
            Text("Or")
                .font(.caption)
                .foregroundStyle(Color.kkTextLight)
                .padding(.horizontal, 12)
            Rectangle()
                .fill(Color.kkPurpleLight.opacity(0.4))
                .frame(height: 1)
        }
    }
    
    // MARK: - Email Field
    private var emailField: some View {
        HStack(spacing: 12) {
            Image(systemName: "envelope")
                .foregroundStyle(Color.kkTextWhite)
                .frame(width: 20)
            
            TextField("Email", text: $email, prompt: Text("email")
                    .foregroundStyle(Color.kkTextLight))
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .foregroundStyle(Color.kkTextWhite)
                .tint(Color.kkGold)
        }
        .padding(14)
        .background(Color.kkPurpleMid.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.kkPurpleLight.opacity(0.4), lineWidth: 1)
        )
    }
    
    // MARK: - Password Field
    private var passwordField: some View {
        HStack(spacing: 12) {
            Image(systemName: "lock")
                .foregroundStyle(Color.kkTextLight)
                .frame(width: 20)
            
            SecureField("Password", text: $password, prompt: Text("Password")
                    .foregroundStyle(Color.kkTextLight))
                .tint(Color.kkGold)
        }
        .padding(14)
        .background(Color.kkPurpleMid.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.kkPurpleLight.opacity(0.4), lineWidth: 1)
        )
    }
    
    // MARK: - Submit Button
    private var submitButton: some View {
        Button {
            isSignIn ? signIn() : signUp()
        } label: {
            HStack {
                if isLoading {
                    ProgressView()
                        .tint(Color.kkPurpleDark)
                } else {
                    Text(isSignIn ? "Sign In" : "Create Account")
                        .font(.headline)
                        .foregroundStyle(Color.kkPurpleDark)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.kkGold)
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        .disabled(isLoading || email.isEmpty || password.isEmpty)
        .opacity(email.isEmpty || password.isEmpty ? 0.6 : 1.0)
    }
    
    // MARK: - Toggle Section
    private var toggleSection: some View {
        HStack {
            Text(isSignIn ? "Don't have an account?" : "Already have an account?")
                .foregroundStyle(Color.kkTextLight)
                .font(.subheadline)
            
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isSignIn.toggle()
                    email = ""
                    password = ""
                }
            } label: {
                Text(isSignIn ? "Sign Up" : "Sign In")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kkGold)
            }
        }
        .padding(.top, 20)
        .padding(.bottom, 40)
    }
    
    // MARK: - Auth Functions (placerholder)
    private func signIn() {
        isLoading = true
        Task {
            do {
                try await AuthService.shared.signIn(email: email, password: password)
            } catch {
                print("❌ Sign in error: \(error.localizedDescription)")
                isLoading = false
            }
        }
    }
    
    private func signUp() {
        isLoading = true
        Task {
            do {
                try await AuthService.shared.signUp(email: email, password: password)
            } catch {
                print("❌ Sign up error: \(error.localizedDescription)")
                isLoading = false
            }
        }
    }
    
    private func signInWithApple() {
        // Sign in with Apple - wire up later
        appState.isAuthenticated = true
    }
}

#Preview {
    AuthView()
        .environment(AppState())
}
