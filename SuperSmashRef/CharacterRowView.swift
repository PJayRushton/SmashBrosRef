//
//  CharacterRowView.swift
//  SuperSmashRef
//
//  Created by Parker Rushton on 2/27/25.
//

import SwiftUI

struct CharacterRowView: View {

    let character: Character

    var body: some View {
        character.thumbnailImage
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

}

#Preview {
    CharacterRowView(character: Character.mario)
}
