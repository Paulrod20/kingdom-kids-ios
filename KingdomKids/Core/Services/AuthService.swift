//
//  AuthService.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 6/8/26.
//

import Foundation
import FirebaseAuth

@MainActor
final class AuthService {
    static let shared = AuthService()

    private var authStateHandle: AuthStateDidChangeListenerHandle?

    func observeAuthenticationState(onChange: @escaping (Bool) -> Void) {
        guard authStateHandle == nil else { return }

        authStateHandle = Auth.auth().addStateDidChangeListener { _, user in
            onChange(user != nil)
        }
    }

    func stopObservingAuthenticationState() {
        guard let authStateHandle else { return }

        Auth.auth().removeStateDidChangeListener(authStateHandle)
        self.authStateHandle = nil
    }
    
    func signIn(email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func signUp(email: String, password: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    var currentUser: FirebaseAuth.User? {
        Auth.auth().currentUser
    }
    
    var isLoggedIn: Bool {
        Auth.auth().currentUser != nil
    }
}
