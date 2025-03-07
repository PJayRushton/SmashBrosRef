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
        ZStack(alignment: .top) {
            character.thumbnailImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            if character.isDLC {
                HStack {
                    Spacer()

                    Image(systemName: "dollarsign")
                        .foregroundStyle(Color.green)
                        .bold()
                }
                .padding(2)
            }
        }
    }

}

#Preview {
    CharacterRowView(character: Character.mario)
}
