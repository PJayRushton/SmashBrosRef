//
//  CharacterDetailView.swift
//  SuperSmashRef
//
//  Created by Parker Rushton on 2/27/25.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    @State private var isShowingLevelImage = false
    @State private var isShowingMovesImage = false
    @State private var isShowingSkinGallery = false

    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height

            if isLandscape {
                HStack(alignment: .top, spacing: 0) {
                    imageAndNameView()
                        .frame(width: geometry.size.width * 0.5)

                    ScrollView {
                        mainRows()
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.leading)
            } else {
                ScrollView {
                    VStack(spacing: 24) {
                        imageAndNameView()
                            .frame(maxWidth: .infinity)

                        mainRows()
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isShowingMovesImage) {
            FullScreenImageView(image: character.movesImage)
        }
        .sheet(isPresented: $isShowingSkinGallery) {
            SkinGalleryView(images: character.skinImages)
        }
    }

    func mainRows() -> some View {
        VStack {
            summaryView()

            CharacterStatsView(character: character)

            worldView()

            orderView()

            if let echoId = character.echoCharacterId, let echo = Character.all.first(
                where: { $0.id == echoId }) {
                echoView(echo: echo)
            }

            if character.skinImages.count > 0 {
                skinsView()
            }

            movesView()

            if let priceCents = character.priceCents {
                dlcView(price: priceCents)
            }

            Spacer()
        }
        .padding(.horizontal)
    }

    func imageAndNameView() -> some View {
        ZStack(alignment: .bottom) {
            character.mainImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .background(Color(.systemBackground))
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .clear, .black.opacity(0.5)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .cornerRadius(16)

            Text(character.name)
                .font(.custom("Avenir-Black", fixedSize: 60))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
        .frame(maxWidth: .infinity)
    }

    func summaryView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Summary")
                .appFont(style: .title2, weight: .bold)

            Text(character.summary)
                .appFont(style: .caption)
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    func worldView() -> some View {
        HStack {
            Text("World")
                .appFont(style: .title2, weight: .bold)

            Spacer()

            Text(character.world.name)
                .appFont(style: .title3)
                .foregroundStyle(.secondary)
        }
        .padding(24)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    func orderView() -> some View {
        HStack {
            Text("Number")
                .appFont(style: .title2, weight: .bold)

            Spacer()

            Text(character.orderString)
                .appFont(style: .title3)
                .foregroundStyle(.secondary)
        }
        .padding(24)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    func echoView(echo: Character) -> some View {
        HStack {
            Text("Echo of:")
                .appFont(style: .title2, weight: .bold)

            Spacer()

            Text(echo.name)
                .appFont(style: .title3)
                .foregroundStyle(.secondary)
        }
        .padding(24)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))

    }


    func movesView() -> some View {
        HStack {
            Text("Moves")
                .appFont(style: .title2, weight: .bold)

            Spacer()

            character.movesImage
                .resizable()
                .aspectRatio(1.7, contentMode: .fit)
                .frame(height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding(24)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .onTapGesture {
            isShowingMovesImage = true
        }
    }

    func dlcView(price: Int) -> some View {
        HStack {
            Text("DLC Price")
                .appFont(style: .title2, weight: .bold)

            Text("$\(Double(price) / 100.0, specifier: "%.2f")")
                .appFont(style: .title3)
                .foregroundStyle(.secondary)
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    func skinsView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Skins")
                .appFont(style: .title2, weight: .bold)

            HStack(spacing: 8) {
                ForEach(character.skinImages.indices, id: \.self) { index in
                    character.skinImages[index]
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .onTapGesture {
                            isShowingSkinGallery = true
                        }
                }
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

}

#Preview {
    NavigationStack {
        CharacterDetailView(character: .steve)
    }
}
