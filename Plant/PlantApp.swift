//
//  PlantApp.swift
//  Plant
//
//  Created by Никита Куприянов on 12.03.2023.
//

import SwiftUI
import Firebase

@main
struct PlantApp: App {
    @StateObject var model = AuthViewModel()
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(model)
            }
        }
    }
}

struct mainPreview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
