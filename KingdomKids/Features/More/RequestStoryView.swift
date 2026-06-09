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
                            inputField(
                                title: "Story Title",
                                text: $storyTitle,
                                placeholder: "Example: David and Goliath",
                                field: .storyTitle,
                                submitLabel: .next
                            ) {
                                focusedField = .bibleReference
                            }

                            inputField(
                                title: "Bible Reference",
                                text: $bibleReference,
                                placeholder: "Example: 1 Samuel 17",
                                field: .bibleReference,
                                submitLabel: .next
                            ) {
                                focusedField = .details
                            }

                            ageRangePicker
                            detailsField
                        }
                    }

                    Button(action: submitRequest) {
                        Group {
                            if isSubmitting {
                                ProgressView()
                                    .tint(Color.kkPurpleDark)
                            } else {
                                Text("Submit Story Request")
                            }
                        }
                        .font(.headline)
                        .foregroundStyle(isFormValid ? Color.kkPurpleDark : Color.kkTextLight)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isFormValid ? Color.kkGold : Color.gray.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                    .disabled(!isFormValid || isSubmitting)

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

    private func inputField(
        title: String,
        text: Binding<String>,
        placeholder: String,
        field: Field,
        submitLabel: SubmitLabel,
        onSubmit: @escaping () -> Void
    ) -> some View {
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
            .submitLabel(submitLabel)
            .focused($focusedField, equals: field)
            .onSubmit(onSubmit)
            .padding()
            .background(Color.kkPurpleDark.opacity(0.6))
            .foregroundStyle(Color.kkTextLight)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }

    private var ageRangePicker: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Age Range")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)

            Picker("Age Range", selection: $ageRange) {
                ForEach(ageRanges, id: \.self) { range in
                    Text(range)
                        .tag(range)
                }
            }
            .pickerStyle(.menu)
            .tint(Color.kkGold)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.kkPurpleDark.opacity(0.6))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }

    private var detailsField: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Details")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)

            ZStack(alignment: .topLeading) {
                if details.isEmpty {
                    Text("Share any details you would like us to consider")
                        .foregroundStyle(Color.kkTextLight.opacity(0.5))
                        .padding(.horizontal, 13)
                        .padding(.vertical, 16)
                        .allowsHitTesting(false)
                }

                TextEditor(text: $details)
                    .focused($focusedField, equals: .details)
                    .frame(minHeight: 140)
                    .padding(8)
                    .foregroundStyle(Color.kkTextLight)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
            }
            .background(Color.kkPurpleDark.opacity(0.6))
            .clipShape(RoundedRectangle(cornerRadius: 12))
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
