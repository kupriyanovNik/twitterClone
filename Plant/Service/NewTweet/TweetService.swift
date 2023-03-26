//
//  TweetService.swift
//  Plant
//
//  Created by Никита Куприянов on 25.03.2023.
//

import Firebase

class TweetService {
    func uploadTweet(caption: String, completion: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("tweets")
            .document().setData(data) { error in
                if let error {
                    print("uploading failed with error \(error.localizedDescription)")
                    completion(false)
                    return
                } else {
                    print("DEBUG: successful upload tweet")
                    completion(true)
                    return
                }
            }
    }
    func fetchTweets(completion: @escaping ([Tweet]) -> Void ) {
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
                guard let documents = snapshot?.documents else { return }
                let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
                completion(tweets)
            }
    }
    func fetchTweets(for uid: String, completion: @escaping ([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
        //.order(by: "timestamp", descending: true) // able to be deleted
            .getDocuments { snapshot, error in
                guard let documents = snapshot?.documents else { return }
                let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
                completion(tweets.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() }))
            }
    }
    func likeTweet(_ tweet: Tweet, completion: @escaping () -> Void) {
        guard let uid = Auth.auth().currentUser?.uid, let tweetId = tweet.id else { return }
        let userLikesRef = Firestore
            .firestore()
            .collection("users")
            .document(uid)
            .collection("user-likes")
        Firestore
            .firestore()
            .collection("tweets")
            .document(tweetId)
            .updateData(["likes" : tweet.likes + 1]) { error in
                userLikesRef
                    .document(tweetId)
                    .setData([:]) { error in
                        if let error {
                            print(error.localizedDescription)
                        }
                        completion()
                    }
            }
    }
    func checkIfUserLikedTweet(_ tweet: Tweet, completion: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid, let tweetId = tweet.id else { return }
        Firestore
            .firestore()
            .collection("users")
            .document(uid)
            .collection("user-likes")
            .document(tweetId)
            .getDocument { snapshot, error in
                guard let snapshot = snapshot else { return }
                completion(snapshot.exists)
            }
    }
    func unlikeTweet(_ tweet: Tweet, completion: @escaping () -> Void) {
        guard let uid = Auth.auth().currentUser?.uid, let tweetId = tweet.id, tweet.likes > 0 else { return }
        
        let userLikesRef = Firestore
            .firestore()
            .collection("users")
            .document(uid)
            .collection("user-likes")
        
        Firestore
            .firestore()
            .collection("tweets")
            .document(tweetId)
            .updateData(["likes" : tweet.likes - 1]) { error in
                if let error {
                    print(error.localizedDescription)
                }
                userLikesRef.document(tweetId).delete { error in
                    if let error {
                        print(error.localizedDescription)
                    }
                    completion()
                }
            }
    }
    func fetchLikedTweets(forUid uid: String, completion: @escaping ([Tweet]) -> Void) {
        var tweets: [Tweet] = []
        Firestore
            .firestore()
            .collection("users")
            .document(uid)
            .collection("user-likes")
            .getDocuments { snapshot, error in
                guard let documents = snapshot?.documents else { return }
                
                documents.forEach { doc in
                    let tweetId = doc.documentID
                    Firestore.firestore()
                        .collection("tweets")
                        .document(tweetId)
                        .getDocument { snapshot, error in
                            
                            guard let tweet = try? snapshot?.data(as: Tweet.self) else { return }
                            tweets.append(tweet)
                            completion(tweets)
                        }
                }
            }
    }
}


