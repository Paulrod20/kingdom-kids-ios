//
//  RequestFormComponents.swift
//  KingdomKids
//

import SwiftUI

struct RequestTextField<Field: Hashable>: View {
    let title: String
    @Binding var text: String
    let placeholder: String
    let field: Field
    let focusedField: FocusState<Field?>.Binding
    let capitalization: TextInputAutocapitalization
    let keyboardType: UIKeyboardType
    let submitLabel: SubmitLabel
    let onSubmit: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)

            TextField(
                "",
                text: $text,
                prompt: Text(placeholder)
                    .foregroundStyle(Color.kkTextLight.opacity(0.5))
            )
            .textInputAutocapitalization(capitalization)
            .autocorrectionDisabled(keyboardType == .URL)
            .keyboardType(keyboardType)
            .submitLabel(submitLabel)
            .focused(focusedField, equals: field)
            .onSubmit(onSubmit)
            .padding()
            .background(Color.kkPurpleDark.opacity(0.6))
            .foregroundStyle(Color.kkTextLight)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

struct RequestDetailsField<Field: Hashable>: View {
    let title: String
    @Binding var text: String
    let placeholder: String
    let field: Field
    let focusedField: FocusState<Field?>.Binding

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)

            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundStyle(Color.kkTextLight.opacity(0.5))
                        .padding(.horizontal, 13)
                        .padding(.vertical, 16)
                        .allowsHitTesting(false)
                }

                TextEditor(text: $text)
                    .focused(focusedField, equals: field)
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
}

struct RequestAgeRangePicker: View {
    let title: String
    @Binding var selection: String
    let ageRanges: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.kkGold)

            Picker("Age Range", selection: $selection) {
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
}

struct RequestSubmitButton: View {
    let title: String
    let isFormValid: Bool
    let isSubmitting: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Group {
                if isSubmitting {
                    ProgressView()
                        .tint(Color.kkPurpleDark)
                } else {
                    Text(title)
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
    }
}
