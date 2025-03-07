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
                .ignoresSafeArea(edges: .top)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
//        .sheet(isPresented: $isShowingLevelImage) {
//            FullScreenImageView(image: character.levelImage)
//        }
        .sheet(isPresented: $isShowingMovesImage) {
            FullScreenImageView(image: character.movesImage)
        }
    }

    func mainRows() -> some View {
        VStack {
            summaryView()

            worldView()

//            levelView()

            movesView()

            if let priceCents = character.priceCents {
                dlcView(price: priceCents)
            }

            if character.skinImages.count > 0 {
                skinsView()
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

            Text("\(character.name) - \(Int(character.order))")
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

//    func levelView() -> some View {
//        HStack {
//            Text("Level")
//                .appFont(style: .title2, weight: .bold)
//
//            Spacer()
//
//            character.levelImage
//                .resizable()
//                .aspectRatio(1.7, contentMode: .fit)
//                .frame(height: 80)
//                .clipShape(RoundedRectangle(cornerRadius: 12))
//                .onTapGesture {
//                    isShowingLevelImage = true
//                }
//        }
//        .padding(24)
//        .background(Color(.systemGray6))
//        .clipShape(RoundedRectangle(cornerRadius: 16))
//    }

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
                .onTapGesture {
                    isShowingMovesImage = true
                }
        }
        .padding(24)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
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
