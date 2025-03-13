//
//  SuperSmashRefApp.swift
//  SuperSmashRef
//
//  Created by Parker Rushton on 2/26/25.
//

import SwiftUI

@main
struct SuperSmashRefApp: App {
    // Add state object for FavoriteManager
    @StateObject private var favoriteManager = FavoriteManager()

    var body: some Scene {
        WindowGroup {
            TabView {
                AllCharactersView()
                    .tabItem {
                        Label("Characters", systemImage: "list.bullet")
                    }

                FavoriteCharactersView()
                    .tabItem {
                        Label("Favorites", systemImage: "heart.fill")
                    }
            }
            .environmentObject(favoriteManager)
        }
    }
}
