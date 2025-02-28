//
//  ContentView.swift
//  SuperSmashRef
//
//  Created by Parker Rushton on 2/26/25.
//

import SwiftUI
import SwiftData

struct AllCharactersView: View {

    let characterController = CharacterController.shared
    @State private var selectedCharacter = Character.mario
    @State private var searchText = ""

    private var imageSpacing: CGFloat {
        return 2
    }
    private var filteredCharacters: [Character] {
        if searchText.isEmpty {
            return characterController.characters
        }
        return characterController.characters.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    let columns = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]

    var body: some View {
        NavigationSplitView {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: imageSpacing) {
                    ForEach(filteredCharacters) { character in
                        NavigationLink {
                            CharacterDetailView(character: character)
                        } label: {
                            character.thumbnailImage
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding(imageSpacing)
            }
            .background(Color(.systemBackground))
            .navigationTitle("Characters")
            .searchable(text: $searchText)
        } detail: {
            CharacterDetailView(character: selectedCharacter)
        }
    }

}

#Preview {
    AllCharactersView()
}
