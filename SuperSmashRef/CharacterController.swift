//
//  CharacterController.swift
//  SuperSmashRef
//
//  Created by Parker Rushton on 2/27/25.
//

import Foundation

@Observable
class CharacterController {
    static let shared = CharacterController()

    var characters: [Character]

    init() {
        characters = Character.base
    }

}
