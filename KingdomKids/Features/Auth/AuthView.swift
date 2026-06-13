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
    @State private var confirmPassword = ""
    @State private var isSignIn = true
    @State private var isLoading = false
    @State private var errorMessage = ""

    private var passwordsMatch: Bool {
        isSignIn || password == confirmPassword
    }

    private var passwordIsStrong: Bool {
        let hasMinLength = password.count >= 8
        let hasUppercase = password.contains(where: { $0.isUppercase })
        let hasNumber = password.contains(where: { $0.isNumber })
        return hasMinLength && hasUppercase && hasNumber
    }
    
    private var emailIsValid: Bool {
        // Simple RFC 5322-like regex; good enough for app input validation
        let pattern = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"
        return email.range(of: pattern, options: [.regularExpression, .caseInsensitive]) != nil
    }

    private var canSubmit: Bool {
        !email.isEmpty &&
        emailIsValid &&
        !password.isEmpty &&
        passwordsMatch &&
        (isSignIn || passwordIsStrong) &&
        !isLoading
    }

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
            if !isSignIn {
                confirmPasswordField
                passwordRequirements
            }
            if !errorMessage.isEmpty {
                errorBanner
            }
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
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 12) {
                Image(systemName: "envelope")
                    .foregroundStyle(Color.kkTextWhite)
                    .frame(width: 20)

                TextField("Email", text: $email, prompt: Text("Email")
                    .foregroundStyle(Color.kkTextLight))
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    .foregroundStyle(Color.kkTextWhite)
                    .tint(Color.kkGold)
            }
            .padding(14)
            .background(Color.kkPurpleMid.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(email.isEmpty || emailIsValid ? Color.kkPurpleLight.opacity(0.4) : Color.red.opacity(0.6), lineWidth: 1)
            )

            if !email.isEmpty && !emailIsValid {
                HStack(spacing: 6) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundStyle(Color.red)
                        .font(.caption)
                    Text("Please enter a valid email address.")
                        .font(.caption)
                        .foregroundStyle(Color.red)
                }
                .transition(.opacity)
            }
        }
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
                .foregroundStyle(Color.kkTextWhite)
                .textContentType(.newPassword)
        }
        .padding(14)
        .background(Color.kkPurpleMid.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.kkPurpleLight.opacity(0.4), lineWidth: 1)
        )
    }

    // MARK: - Confirm Password Field

    private var confirmPasswordField: some View {
        HStack(spacing: 12) {
            Image(systemName: "lock.fill")
                .foregroundStyle(Color.kkTextLight)
                .frame(width: 20)

            SecureField("Confirm Password", text: $confirmPassword, prompt: Text("Confirm Password")
                    .foregroundStyle(Color.kkTextLight))
                .tint(Color.kkGold)
                .foregroundStyle(Color.kkTextWhite)
                .textContentType(.newPassword)
        }
        .padding(14)
        .background(Color.kkPurpleMid.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    confirmPassword.isEmpty ? Color.kkPurpleLight.opacity(0.4) :
                    passwordsMatch ? Color.green.opacity(0.6) : Color.red.opacity(0.6),
                    lineWidth: 1
                )
        )
    }

    // MARK: - Password Requirements

    private var passwordRequirements: some View {
        VStack(alignment: .leading, spacing: 6) {
            requirementRow(
                met: password.count >= 8,
                text: "At least 8 characters"
            )
            requirementRow(
                met: password.contains(where: { $0.isUppercase }),
                text: "At least one uppercase letter"
            )
            requirementRow(
                met: password.contains(where: { $0.isNumber }),
                text: "At least one number"
            )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func requirementRow(met: Bool, text: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: met ? "checkmark.circle.fill" : "circle")
                .font(.caption)
                .foregroundStyle(met ? Color.green : Color.kkTextLight.opacity(0.5))

            Text(text)
                .font(.caption)
                .foregroundStyle(met ? Color.kkTextWhite : Color.kkTextLight.opacity(0.5))
        }
    }

    // MARK: - Error Banner

    private var errorBanner: some View {
        HStack(spacing: 8) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundStyle(Color.red)
                .font(.caption)

            Text(errorMessage)
                .font(.caption)
                .foregroundStyle(Color.red)
                .fixedSize(horizontal: false, vertical: true)

            Spacer()
        }
        .padding(12)
        .background(Color.red.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.red.opacity(0.3), lineWidth: 1)
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
        .disabled(!canSubmit)
        .opacity(canSubmit ? 1.0 : 0.6)
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
                    confirmPassword = ""
                    errorMessage = ""
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

    // MARK: - Auth Functions

    private func signIn() {
        isLoading = true
        errorMessage = ""
        Task {
            do {
                try await AuthService.shared.signIn(email: email, password: password)
            } catch {
                errorMessage = friendlyError(error)
                isLoading = false
            }
        }
    }

    private func signUp() {
        guard passwordIsStrong else {
            errorMessage = "Please meet all password requirements."
            return
        }
        guard passwordsMatch else {
            errorMessage = "Passwords do not match."
            return
        }
        isLoading = true
        errorMessage = ""
        Task {
            do {
                try await AuthService.shared.signUp(email: email, password: password)
            } catch {
                errorMessage = friendlyError(error)
                isLoading = false
            }
        }
    }

    private func signInWithApple() {
        appState.isAuthenticated = true
    }

    private func friendlyError(_ error: Error) -> String {
        let message = error.localizedDescription
        if message.contains("email") { return "Please enter a valid email address." }
        if message.contains("password") { return "Incorrect password. Please try again." }
        if message.contains("network") { return "No internet connection. Please try again." }
        if message.contains("exists") { return "An account with this email already exists." }
        if message.contains("found") { return "No account found with this email." }
        return "Something went wrong. Please try again."
    }
}

#Preview {
    AuthView()
        .environment(AppState())
}
