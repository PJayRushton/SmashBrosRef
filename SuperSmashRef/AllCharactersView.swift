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
    private var isiPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    private var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]

    var body: some View {
        if isiPad {
            NavigationSplitView {
                characterList
            } detail: {
                CharacterDetailView(character: selectedCharacter)
            }
        } else {
            NavigationStack {
                characterList
            }
            .tint(Color(.label))
        }
    }

    private var characterList: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                if searchText.isEmpty {
                    baseCharactersSection

                    unlockableSection

                    dlcSection
                } else {
                    searchSection()
                }
            }
        }
        .navigationTitle("Characters")
        .searchable(text: $searchText)
    }

    private var baseCharactersSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Base Characters")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.horizontal)
                .padding(.top, 8)

            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(Character.base) { character in
                    if isiPad {
                        CharacterRowView(character: character)
                            .background(Color.red.opacity(0.3))
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedCharacter = character
                            }
                    } else {
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            CharacterRowView(character: character)
                                .background(Color.red.opacity(0.3))
                        }
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
                .padding()

            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(filteredResults) { character in
                    if isiPad {
                        CharacterRowView(character: character)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedCharacter = character
                            }
                    } else {
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            CharacterRowView(character: character)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }

    private var unlockableSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Unlockable Characters")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.horizontal)
                .padding(.top)

            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(Character.unlockable) { character in
                    if isiPad {
                        CharacterRowView(character: character)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedCharacter = character
                            }
                    } else {
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            CharacterRowView(character: character)
                        }
                    }
                }
            }
        }
    }

    private var dlcSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("DLC Characters")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding()

            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(Character.dlc) { character in
                    if isiPad {
                        CharacterRowView(character: character)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedCharacter = character
                            }
                    } else {
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            CharacterRowView(character: character)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AllCharactersView()
}
