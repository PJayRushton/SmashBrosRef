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
        HStack {
            character.thumbnailImage
                .resizable()
                .scaledToFit()
                .frame(height: 50)
                .cornerRadius(8)

            Text(character.name.uppercased())
                .appFont(style: .body, weight: .medium)

            Spacer()
        }
        .padding(.vertical, 8)
    }

}

#Preview {
    CharacterRowView(character: Character.mario)
}
