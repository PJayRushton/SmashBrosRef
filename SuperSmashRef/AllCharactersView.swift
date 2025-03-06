//
//  ContentView.swift
//  SuperSmashRef
//
//  Created by Parker Rushton on 2/26/25.
//

import SwiftUI
import SwiftData

struct AllCharactersView: View {

    @State private var selectedCharacter = Character.mario
    @State private var searchText = ""

    private var filteredResults: [Character] {
        if searchText.isEmpty {
            return []
        }
        return Character.all.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    private var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]

    var body: some View {
        NavigationSplitView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    if searchText.isEmpty {
                        baseCharactersSection()
                    } else {
                        searchSection()
                    }
                }
                //                .padding(.vertical, 8)
            }
            .navigationTitle("Characters")
            .searchable(text: $searchText)
        } detail: {
            CharacterDetailView(character: selectedCharacter)
        }
    }

    private func baseCharactersSection() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Base Characters")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.horizontal)

            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(Character.base) { character in
                    CharacterRowView(character: character)
                        .background(Color.red.opacity(0.3))
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedCharacter = character
                        }
                }
            }
        }
    }

    private func searchSection() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Search Results")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.horizontal)

            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(filteredResults) { character in
                    CharacterRowView(character: character)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedCharacter = character
                        }
                }
            }
            .padding(.horizontal)
        }
    }

    /*
     private var unlockableSection: some View {
     Section(header: Text("Unlockable Characters")
     .font(.headline)
     .foregroundColor(.secondary)
     ) {
     ForEach(Character.unlockable) { character in
     CharacterRowView(character: character)
     .contentShape(Rectangle())
     .onTapGesture {
     selectedCharacter = character
     }
     }
     }
     }

     private var dlcSection: some View {
     Section(header: Text("DLC Characters")
     .font(.headline)
     .foregroundColor(.secondary)
     ) {
     ForEach(Character.dlc) { character in
     CharacterRowView(character: character)
     .contentShape(Rectangle())
     .onTapGesture {
     selectedCharacter = character
     }
     }
     }
     }
     */
}
#Preview {
    AllCharactersView()
}
