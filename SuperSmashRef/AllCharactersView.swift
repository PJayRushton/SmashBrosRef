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
    @State private var selectedCharacterForNavigation: Character?
    
    private var filteredResults: [Character] {
        if searchText.isEmpty {
            return []
        }
        return Character.all.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        NavigationSplitView {
            List {
                if searchText.isEmpty {
                    baseSection
                    unlockableSection
                    dlcSection
                } else {
                    searchResultsSection
                }
            }
            .navigationTitle("Characters")
            .searchable(text: $searchText)
            .navigationDestination(for: Character.self) { character in
                CharacterDetailView(character: character)
            }
        } detail: {
            CharacterDetailView(character: selectedCharacter)
        }
    }
    
    private var baseSection: some View {
        Section {
            Text("Base Characters")
                .font(.headline)
                .foregroundColor(.secondary)
            
            ForEach(Character.preUnlocked) { character in
                CharacterRowView(character: character)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedCharacterForNavigation = character
                    }
            }
        }
    }
    
    private var unlockableSection: some View {
        Section {
            Text("Unlockable Characters")
                .font(.headline)
                .foregroundColor(.secondary)
            
            ForEach(Character.unlockable) { character in
                CharacterRowView(character: character)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedCharacterForNavigation = character
                    }
            }
        }
    }
    
    private var dlcSection: some View {
        Section {
            Text("DLC Characters")
                .font(.headline)
                .foregroundColor(.secondary)
            
            ForEach(Character.dlc) { character in
                CharacterRowView(character: character)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedCharacterForNavigation = character
                    }
            }
        }
    }
    
    private var searchResultsSection: some View {
        Section {
            Text("Search Results")
                .font(.headline)
                .foregroundColor(.secondary)
            
            ForEach(filteredResults) { character in
                CharacterRowView(character: character)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedCharacterForNavigation = character
                    }
            }
        }
    }
}

#Preview {
    AllCharactersView()
}
