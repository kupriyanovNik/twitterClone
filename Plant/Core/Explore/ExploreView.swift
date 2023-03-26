//
//  ExploreView.swift
//  Plant
//
//  Created by Никита Куприянов on 13.03.2023.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        
        VStack {
            SearchBar(text: $viewModel.searchText)
                .padding()
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchableUsers) { user in
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
