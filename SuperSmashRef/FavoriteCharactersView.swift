import SwiftUI

struct FavoriteCharactersView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager

    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(favoriteManager.favoriteCharacters.enumerated()), id: \.element.id) { index, character in
                    NavigationLink(destination: CharacterDetailView(character: character)) {
                        FavoriteCharacterCell(character: character, order: index + 1)
                    }
                }
                .onMove(perform: favoriteManager.move)
            }
            .navigationTitle("Favorites")
            .overlay(
                Group {
                    if favoriteManager.favoriteCharacters.isEmpty {
                        Text("No favorites yet")
                            .foregroundColor(.secondary)
                    }
                }
            )
        }
    }

}

#Preview {
    FavoriteCharactersView()
        .environmentObject(FavoriteManager())
}
