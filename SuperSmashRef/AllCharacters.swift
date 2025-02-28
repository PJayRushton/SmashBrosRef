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
        mainImage: Image(._1MarioMain),
        thumbnailImage: Image(._1MarioThumb),
        world: "Super Mario World",
        levelImage: Image(.levelMarioRainbowCruise)
    )
    static let dk = Character(
        id: "2",
        name: "Donkey Kong",
        order: 2,
        mainImage: Image(._2DkMain),
        thumbnailImage: Image(._2DkThumb),
        world: "Donkey Kong",
        levelImage: Image(.levelDkKongojungle)
    )
}
