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
        ZStack {
            character.mainImage
                .resizable()
                .scaledToFill()
                .clipped()

            LinearGradient(
                colors: [.clear, .clear, .black.opacity(0.5)],
                startPoint: .top,
                endPoint: .bottom
            )
            VStack {
                if character.isDLC {
                    HStack {
                        Spacer()

                        Image(systemName: "dollarsign")
                            .foregroundStyle(Color.green)
                            .bold()
                    }
                    .padding(8)
                }

                Spacer()

                Text(character.name.uppercased())
                    .foregroundStyle(Color.white)
                    .appFont(style: .title2, weight: .bold)
            }
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

}

#Preview {
    CharacterRowView(character: Character.mario)
}
