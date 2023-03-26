//
//  UserStatsView.swift
//  Plant
//
//  Created by Никита Куприянов on 13.03.2023.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24) {
            HStack(spacing: 4) {
                Text("807").font(.subheadline).bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
            HStack(spacing: 4) {
                Text("6.9M").font(.subheadline).bold()
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
