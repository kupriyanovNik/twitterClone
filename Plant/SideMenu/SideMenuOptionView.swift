//
//  SideMenuOptionView.swift
//  Plant
//
//  Created by Никита Куприянов on 13.03.2023.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let viewModel: SideMenuViewModel
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(Color.gray)
            Text(viewModel.title)
                .foregroundColor(Color.black)
                .font(.subheadline)
            Spacer()
            
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModel: .profile)
    }
}
