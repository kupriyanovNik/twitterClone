//
//  UserRowView.swift
//  Plant
//
//  Created by Никита Куприянов on 13.03.2023.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 56, height: 56)
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.subheadline).bold()
                    .foregroundColor(Color.black)
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: .init(username: "fvdb", fullname: "fdgfd", profileImageUrl: "fdg", email: "dfgdfg"))
    }
}
