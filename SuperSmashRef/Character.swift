// Item.swift
// SuperSmashRef
// Created by Parker Rushton on 2/26/25.

import Foundation
import SwiftUI

// Stats and Character structs remain unchanged
struct Stats: Equatable, Hashable {
    let power: Int // 1-7
    let speed: Int // 1-7
    let longRange: Int // 1-7
    let recovery: Int // 1-7
    let hasCounter: Bool
}

struct Character: Identifiable, Equatable, Hashable {
    let id: String
    let name: String
    let order: Double
    let world: World
    let summary: String
    let echoCharacterId: String?

    let mainImage: Image
    let thumbnailImage: Image
    let movesImage: Image
    let skinImages: [Image]

    let isDLC: Bool
    let priceCents: Int?
    let stats: Stats

    var orderString: String {
        // Check if the number has a decimal part
        if order.truncatingRemainder(dividingBy: 1) == 0 {
            // It's a whole number, return as integer string
            return String(Int(order))
        } else {
            // It has a decimal, return the integer part followed by epsilon
            return String(Int(order)) + "ᵋ"
        }
    }

    var isFavorite: Bool {
        guard let favorites = UserDefaults.standard.stringArray(forKey: "favoriteCharacters") else { return false }
        return favorites.contains(id)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    init(id: String, name: String, order: Double, world: World, mainImage: Image, thumbnailImage: Image, movesImage: Image, skinImages: [Image], isDLC: Bool = false, priceCents: Int? = nil, stats: Stats, summary: String, echoCharacterId: String? = nil) {
        self.id = id
        self.name = name
        self.order = order
        self.world = world
        self.mainImage = mainImage
        self.thumbnailImage = thumbnailImage
        self.movesImage = movesImage
        self.skinImages = skinImages
        self.stats = stats
        self.isDLC = isDLC
        self.priceCents = priceCents
        self.summary = summary
        self.echoCharacterId = echoCharacterId
    }
}
