//
//  FeedView.swift
//  Plant
//
//  Created by Никита Куприянов on 12.03.2023.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView: Bool = false
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State var viewTweets: [Tweet] = []
    @ObservedObject var viewModel = FeedViewModel()
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.tweets) { tweet in //viewTweets
                        TweetRowView(tweet: tweet)
                            .padding()
                    }
                }
            }
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(Color.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }
        }
        .onReceive(timer) { new in
//            viewModel.fetchTweets()
            if viewModel.tweets.count != viewTweets.count {
                self.viewTweets = viewModel.tweets
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}


