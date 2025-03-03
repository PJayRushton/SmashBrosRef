//
//  Item.swift
//  SuperSmashRef
//
//  Created by Parker Rushton on 2/26/25.
//

import Foundation
import SwiftUI

struct Stats {
    let power: Int // 1-7
    let speed: Int // 1-7
    let longRange: Int // 1-7
    let recovery: Int // 1-7
    let hasCounter: Bool
}

struct Character: Identifiable, Equatable {
    let id: String
    let name: String
    let order: Double
    let world: String
    
    let mainImage: Image
    let thumbnailImage: Image
    let levelImage: Image
    let movesImage: Image
    let skinImages: [Image]
    
    let isDLC: Bool
    let priceCents: Int?
    let stats: Stats
    
    init(id: String, name: String, order: Double, world: String, mainImage: Image, thumbnailImage: Image, levelImage: Image, movesImage: Image, skinImages: [Image], stats: Stats, isDLC: Bool = false, priceCents: Int? = nil) {
        self.id = id
        self.name = name
        self.order = order
        self.world = world
        self.mainImage = mainImage
        self.thumbnailImage = thumbnailImage
        self.levelImage = levelImage
        self.movesImage = movesImage
        self.skinImages = skinImages
        self.stats = stats
        self.isDLC = isDLC
        self.priceCents = priceCents
    }
}