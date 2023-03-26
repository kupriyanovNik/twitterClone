//
//  TweetRowView.swift
//  Plant
//
//  Created by Никита Куприянов on 12.03.2023.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {

    @ObservedObject var viewModel: TweetRowViewModel
  
    init(tweet: Tweet) {
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                if let user = viewModel.tweet.user {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            Text("@\(user.username)")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                            Text("any time")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                        }
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    viewModel.tweet.didLike ?? false ? viewModel.unlikeTweet() : viewModel.likeTweet()
                } label: {
                    Image(systemName: (viewModel.tweet.didLike ?? false) ? "heart.fill" :  "heart")
                        .font(.subheadline)
                        .foregroundColor( (viewModel.tweet.didLike ?? false) ? .red : .gray)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
                
            }
            .padding()
            .foregroundColor(Color.gray)
            Divider()
        }
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView(tweet: Tweet(caption: "fg", timestamp: .init(date: Date()), uid: "dsfsgfgdfgd"))
    }
}

