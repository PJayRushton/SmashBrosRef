//
//  Item.swift
//  SuperSmashRef
//
//  Created by Parker Rushton on 2/26/25.
//

import Foundation
import SwiftUI

struct Character: Identifiable, Equatable {
    let id: String
    let name: String
    let order: Double
    let mainImage: Image
    let thumbnailImage: Image
    let world: String
    let levelImage: Image
    let isDLC: Bool
    let priceCents: Int?
    let skinImages: [Image]

    init(
        id: String,
        name: String,
        order: Double,
        mainImage: Image,
        thumbnailImage: Image,
        world: String,
        levelImage: Image,
        isDLC: Bool = false,
        priceCents: Int? = nil,
        skinImages: [Image] = []
    ) {
        self.id = id
        self.name = name
        self.order = order
        self.mainImage = mainImage
        self.thumbnailImage = thumbnailImage
        self.world = world
        self.levelImage = levelImage
        self.isDLC = isDLC
        self.priceCents = priceCents
        self.skinImages = skinImages
    }
}
