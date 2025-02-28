//
//  CharacterDetailView.swift
//  SuperSmashRef
//
//  Created by Parker Rushton on 2/27/25.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    @State private var isShowingFullScreenLevel: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                imageAndNameView()
                    .frame(maxWidth: .infinity)

                worldView()
                    .padding()

                levelView()
                    .padding()

                if let priceCents = character.priceCents {
                    dlcView(price: priceCents)
                        .padding()
                }

                if character.skinImages.count > 0 {
                    skinsView()
                        .padding()
                }

                Spacer()
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
    }

    func imageAndNameView() -> some View {
        ZStack(alignment: .bottom) {
            character.mainImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .clear, .black.opacity(0.5)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

            Text(character.name)
                .appFont(style: .largeTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
    }

    func worldView() -> some View {
        HStack {
            Text("World")
                .appFont(style: .title2, weight: .bold)

            Spacer()

            Text(character.world)
                .appFont(style: .title3)
                .foregroundStyle(.secondary)
        }
        .padding(24)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    func levelView() -> some View {
        HStack {
            Text("Level")
                .appFont(style: .title2, weight: .bold)

            Spacer()

            character.levelImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .onTapGesture {
                    isShowingFullScreenLevel = true
                }
        }
        .padding(24)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .sheet(isPresented: $isShowingFullScreenLevel) {
            FullScreenImageView(image: character.levelImage)
        }
    }


    func dlcView(price: Int) -> some View {
        VStack(alignment: .leading, spacing: 12) {
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
            Text("Alternative Skins")
                .appFont(style: .title2, weight: .bold)

            LazyVGrid(columns: [.init(.adaptive(minimum: 150, maximum: 200))], spacing: 20) {
                ForEach(character.skinImages.indices, id: \.self) { index in
                    character.skinImages[index]
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 5)
                }
            }
        }
    }

}

#Preview {
    NavigationStack {
        CharacterDetailView(character: .mario)
    }
}
