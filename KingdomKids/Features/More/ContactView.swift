//
//  ContactView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 6/9/26.
//

import SwiftUI

struct ContactView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""
    @State private var showSuccessAlert = false
    
    private var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty &&
        !email.trimmingCharacters(in: .whitespaces).isEmpty &&
        !message.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        ZStack {
            Color.kkPurpleDark
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    headerSection
                    
                    InfoCard {
                        VStack(alignment: .leading, spacing: 16) {
                            inputField(title: "Name", text: $name, placeholder: "Your name")
                            inputField(title: "Email", text: $email, placeholder: "your@email.com")
                            messageField
                        }
                    }
                    
                    Button {
                        showSuccessAlert = true
                        name = ""
                        email = ""
                        message = ""
                    } label: {
                        Text("Send Message")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isFormValid ? Color.kkGold : Color.gray.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                    .disabled(!isFormValid)
                    
                    InfoCard {
                        Text("Need help?")
                            .font(.headline)
                            .foregroundStyle(Color.kkGold)
                        
                        Text("For questions about Kingdom Kids, content suggestions, or support, send us a message and we’ll get back to you as soon as possible.")
                            .font(.subheadline)
                            .foregroundStyle(Color.kkTextLight)
                            .lineSpacing(6)
                    }
                }
                .padding(24)
            }
        }
        .navigationTitle("Contact Us")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .alert("Message Sent", isPresented: $showSuccessAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Thanks for reaching out! This is currently a placeholder until message sending is connected.")
        }
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Contact Us")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)
            
            Text("Have a question, suggestion, or concern? We’d love to hear from you.")
                .font(.subheadline)
                .foregroundStyle(Color.kkTextLight)
        }
    }
    
    private func inputField(title: String, text: Binding<String>, placeholder: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)
            
            TextField(
                "",
                text: text,
                prompt: Text(placeholder)
                    .foregroundStyle(Color.kkTextLight.opacity(0.5))
            )
            .textInputAutocapitalization(.words)
            .autocorrectionDisabled()
            .padding()
            .background(Color.kkPurpleDark.opacity(0.6))
            .foregroundStyle(Color.kkTextLight)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
    
    private var messageField: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Message")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)
            
            TextEditor(text: $message)
                .frame(minHeight: 140)
                .padding(8)
                .background(Color.kkPurpleDark.opacity(0.6))
                .foregroundStyle(Color.kkTextLight)
                .scrollContentBackground(.hidden)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

#Preview {
    NavigationStack {
        ContactView()
    }
}
