import SwiftUI

struct FavoriteCharacterCell: View {
    let character: Character
    let order: Int

    var body: some View {
        HStack(spacing: 12) {
            Text("\(order)")
                .appFont(style: .title1, weight: .bold)
                .foregroundColor(.secondary)

            character.mainImage
                .resizable()
                .scaledToFit()
                .frame(height: 60)
                .cornerRadius(12)

            Text(character.name)
                .appFont(style: .title1, weight: .bold)

            Spacer()

            Image(systemName: "line.3.horizontal")
        }
    }
}

#Preview {
    FavoriteCharacterCell(character: Character.mario, order: 1)
}

