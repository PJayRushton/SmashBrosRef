//
//  AllCharacters.swift
//  SuperSmashRef
//
//  Created by Parker Rushton on 2/27/25.
//

import UIKit
import SwiftUI

extension Character {
    static let all = [mario, dk]
    
    static let mario = Character(
        id: "1",
        name: "Mario",
        order: 1,
        world: "Super Mario World",
        mainImage: Image(._1MarioMain),
        thumbnailImage: Image(._1MarioThumb),
        levelImage: Image(.levelMarioRainbowCruise),
        skinImages: [],
        movesImage: Image(._1MarioMoves),
        isDLC: false,
        priceCents: nil
    )
    
    static let dk = Character(
        id: "2",
        name: "Donkey Kong",
        order: 2,
        world: "Donkey Kong",
        mainImage: Image(._2DkMain),
        thumbnailImage: Image(._2DkThumb),
        levelImage: Image(.levelDkKongojungle),
        skinImages: [],
        movesImage: Image(._2DkMoves), 
        isDLC: false,
        priceCents: nil
    )
}
