//
//  RequestChannelView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 6/9/26.
//

import SwiftUI

struct RequestChannelView: View {
    private enum Field: Hashable {
        case channelName
        case channelURL
        case details
    }

    @State private var channelName = ""
    @State private var channelURL = ""
    @State private var ageRange = "Ages 2-4"
    @State private var details = ""
    @State private var isSubmitting = false
    @State private var showSuccessAlert = false
    @State private var errorMessage: String?
    @FocusState private var focusedField: Field?

    private let ageRanges = ["Ages 2-4", "Ages 5-6", "Ages 7-8", "All Ages"]

    private var isFormValid: Bool {
        !normalized(channelName).isEmpty && isValidYouTubeURL
    }

    private var isValidYouTubeURL: Bool {
        let value = normalized(channelURL)
        guard
            let components = URLComponents(string: value),
            components.scheme?.lowercased() == "https",
            let host = components.host?.lowercased()
        else {
            return false
        }

        return host == "youtube.com" || host.hasSuffix(".youtube.com") || host == "youtu.be"
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
                            RequestTextField(
                                title: "Channel Name",
                                text: $channelName,
                                placeholder: "Example: Saddleback Kids",
                                field: .channelName,
                                focusedField: $focusedField,
                                capitalization: .words,
                                keyboardType: .default,
                                submitLabel: .next
                            ) {
                                focusedField = .channelURL
                            }

                            VStack(alignment: .leading, spacing: 6) {
                                RequestTextField(
                                    title: "YouTube Channel URL",
                                    text: $channelURL,
                                    placeholder: "https://youtube.com/...",
                                    field: .channelURL,
                                    focusedField: $focusedField,
                                    capitalization: .never,
                                    keyboardType: .URL,
                                    submitLabel: .next
                                ) {
                                    focusedField = .details
                                }

                                if !normalized(channelURL).isEmpty && !isValidYouTubeURL {
                                    Text("Enter a valid HTTPS YouTube channel URL.")
                                        .font(.caption)
                                        .foregroundStyle(Color.kkOrange)
                                }
                            }

                            RequestAgeRangePicker(
                                title: "Recommended Age Range",
                                selection: $ageRange,
                                ageRanges: ageRanges
                            )

                            RequestDetailsField(
                                title: "Why should we add this channel? (Optional)",
                                text: $details,
                                placeholder: "Tell us why this channel would be a great fit for Kingdom Kids",
                                field: .details,
                                focusedField: $focusedField
                            )
                        }
                    }

                    RequestSubmitButton(
                        title: "Submit Channel Request",
                        isFormValid: isFormValid,
                        isSubmitting: isSubmitting,
                        action: submitRequest
                    )

                    InfoCard {
                        Text("Channel Review")
                            .font(.headline)
                            .foregroundStyle(Color.kkGold)

                        Text("All channel requests are reviewed to help ensure content is safe, age-appropriate, Bible-centered, and encouraging for children.")
                            .font(.subheadline)
                            .foregroundStyle(Color.kkTextLight)
                            .lineSpacing(6)
                    }
                }
                .padding(24)
            }
            .scrollDismissesKeyboard(.interactively)
        }
        .navigationTitle("Request a Channel")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .alert("Channel Request Sent", isPresented: $showSuccessAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Thanks for your suggestion!")
        }
        .alert("Unable to Send Request", isPresented: errorAlertBinding) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage ?? "Please try again.")
        }
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Request a Channel")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)

            Text("Suggest a Christian YouTube channel you'd love to see added to Kingdom Kids.")
                .font(.subheadline)
                .foregroundStyle(Color.kkTextLight)
        }
    }

    private var errorAlertBinding: Binding<Bool> {
        Binding(
            get: { errorMessage != nil },
            set: { isPresented in
                if !isPresented {
                    errorMessage = nil
                }
            }
        )
    }

    private func submitRequest() {
        focusedField = nil
        isSubmitting = true

        channelName = normalized(channelName)
        channelURL = normalized(channelURL)
        details = normalized(details)

        // Replace this local completion with the Firebase request later.
        completeSubmission()
    }

    private func completeSubmission() {
        isSubmitting = false
        showSuccessAlert = true
        channelName = ""
        channelURL = ""
        ageRange = ageRanges[0]
        details = ""
    }

    private func normalized(_ value: String) -> String {
        value.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

#Preview {
    NavigationStack {
        RequestChannelView()
    }
}
