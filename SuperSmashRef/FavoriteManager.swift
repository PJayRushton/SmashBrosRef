import Foundation
import SwiftUI

class FavoriteManager: ObservableObject {
    @Published var favoriteCharacters: [Character] = []

    private let favoritesKey = "favoriteCharacters"

    init() {
        loadFavorites()
    }

    private func loadFavorites() {
        // Get the array of favorite IDs from UserDefaults
        guard let favorites = UserDefaults.standard.stringArray(forKey: favoritesKey) else { return }
        // Convert the IDs to Characters in the same order
        favoriteCharacters = favorites.compactMap { favoriteId in
            Character.all.first { $0.id == favoriteId }
        }
    }

    func toggleFavorite(_ character: Character) {
        var favorites = favoriteCharacters

        if let index = favorites.firstIndex(where: { $0.id == character.id }) {
            favorites.remove(at: index)
        } else {
            favorites.append(character)
        }

        favoriteCharacters = favorites
        saveFavorites()
    }

    func move(fromOffsets source: IndexSet, toOffset destination: Int) {
        favoriteCharacters.move(fromOffsets: source, toOffset: destination)
        saveFavorites()
    }

    private func saveFavorites() {
        // Save just the IDs in order
        let favoriteIds = favoriteCharacters.map { $0.id }
        UserDefaults.standard.set(favoriteIds, forKey: favoritesKey)
    }
}
