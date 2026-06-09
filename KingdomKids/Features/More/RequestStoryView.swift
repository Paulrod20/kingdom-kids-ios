//
//  RequestStoryView.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 6/9/26.
//

import SwiftUI

struct RequestStoryView: View {
    private enum Field: Hashable {
        case storyTitle
        case bibleReference
        case details
    }

    @State private var storyTitle = ""
    @State private var bibleReference = ""
    @State private var ageRange = "Ages 2-4"
    @State private var details = ""
    @State private var isSubmitting = false
    @State private var showSuccessAlert = false
    @State private var errorMessage: String?
    @FocusState private var focusedField: Field?

    private let ageRanges = ["Ages 2-4", "Ages 5-6", "Ages 7-8", "All Ages"]

    private var isFormValid: Bool {
        !normalized(storyTitle).isEmpty && !normalized(details).isEmpty
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
                                title: "Story Title",
                                text: $storyTitle,
                                placeholder: "Example: David and Goliath",
                                field: .storyTitle,
                                focusedField: $focusedField,
                                capitalization: .words,
                                keyboardType: .default,
                                submitLabel: .next
                            ) {
                                focusedField = .bibleReference
                            }

                            RequestTextField(
                                title: "Bible Reference",
                                text: $bibleReference,
                                placeholder: "Example: 1 Samuel 17",
                                field: .bibleReference,
                                focusedField: $focusedField,
                                capitalization: .words,
                                keyboardType: .default,
                                submitLabel: .next
                            ) {
                                focusedField = .details
                            }

                            RequestAgeRangePicker(
                                title: "Age Range",
                                selection: $ageRange,
                                ageRanges: ageRanges
                            )

                            RequestDetailsField(
                                title: "Details",
                                text: $details,
                                placeholder: "Share any details you would like us to consider",
                                field: .details,
                                focusedField: $focusedField
                            )
                        }
                    }

                    RequestSubmitButton(
                        title: "Submit Story Request",
                        isFormValid: isFormValid,
                        isSubmitting: isSubmitting,
                        action: submitRequest
                    )

                    InfoCard {
                        Text("What happens next?")
                            .font(.headline)
                            .foregroundStyle(Color.kkGold)

                        Text("Story requests help us decide which Bible stories to add next. We review suggestions and choose content that is age-appropriate, encouraging, and centered on God’s Word.")
                            .font(.subheadline)
                            .foregroundStyle(Color.kkTextLight)
                            .lineSpacing(6)
                    }
                }
                .padding(24)
            }
            .scrollDismissesKeyboard(.interactively)
        }
        .navigationTitle("Request a Story")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .alert("Story Request Sent", isPresented: $showSuccessAlert) {
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
            Text("Request a Story")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)

            Text("Suggest a Bible story you’d love to see added to Kingdom Kids.")
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

        storyTitle = normalized(storyTitle)
        bibleReference = normalized(bibleReference)
        details = normalized(details)

        // Replace this local completion with the Firebase request later.
        completeSubmission()
    }

    private func completeSubmission() {
        isSubmitting = false
        showSuccessAlert = true
        storyTitle = ""
        bibleReference = ""
        ageRange = ageRanges[0]
        details = ""
    }

    private func normalized(_ value: String) -> String {
        value.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

#Preview {
    NavigationStack {
        RequestStoryView()
    }
}
