//
//  TextArea.swift
//  Plant
//
//  Created by Никита Куприянов on 18.03.2023.
//

import SwiftUI
import UIKit

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
//        UITextView().layer.borderColor = UIColor.placeholderText.cgColor
//        UITextView().layer.borderWidth = 0.5
//        UITextView().layer.cornerRadius = 5.0
    }
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            TextEditor(text: $text)
                .padding(4)
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
            
            
        }
        .font(.body)
    }
}

