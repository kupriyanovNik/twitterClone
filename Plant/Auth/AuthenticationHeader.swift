//
//  AuthenticationHeader.swift
//  Plant
//
//  Created by Никита Куприянов on 18.03.2023.
//

import SwiftUI

struct AuthHeaderView: View {
    let title1: String
    let title2: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Spacer() }
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(Color.white)
        .clipShape(RoundedShape(corners: .bottomRight))
    }
}

