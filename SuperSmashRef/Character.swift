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


extension Character {
    static let all: [Character] = [
        mario,
        donkeyKong,
        link,
        samus,
        darkSamus,
        yoshi,
        kirby,
        fox,
        pikachu,
        luigi,
        ness,
        captainFalcon,
        jigglypuff,
        peach,
        daisy,
        bowser,
        iceClimbers,
        sheik,
        zelda,
        drMario,
        pichu,
        falco,
        marth,
        lucina,
        youngLink,
        ganondorf,
        mewtwo,
        roy,
        chrom,
        mrGameAndWatch,
        metaKnight,
        pit,
        darkPit,
        zeroSuitSamus,
        wario,
        snake,
        ike,
        pokemonTrainer,
        diddyKong,
        lucas,
        sonic,
        kingDedede,
        olimar,
        lucario,
        rob,
        toonLink,
        wolf,
        villager,
        megaMan,
        wiiFitTrainer,
        rosalinaAndLuma,
        littleMac,
        greninja,
        miiBrawler,
        miiSwordfighter,
        miiGunner,
        palutena,
        pacMan,
        robin,
        shulk,
        bowserJr,
        duckHunt,
        ryu,
        ken,
        cloud,
        corrin,
        bayonetta,
        inkling,
        ridley,
        simonBelmont,
        richter,
        kingKRool,
        isabelle,
        incineroar,
        piranha,
        joker,
        hero,
        banjoAndKazooie,
        terry,
        byleth,
        minMin,
        steve,
        sephiroth,
        pyraAndMythra,
        kazuya,
        sora
    ]
    
    static let mario = Character(
        id: "mario",
        name: "Mario",
        order: 1,
        world: "Super Mario",
        mainImage: Image(._1MarioMain),
        thumbnailImage: Image(._1MarioThumb),
        levelImage: Image(.levelMario),
        movesImage: Image(._1MarioMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 5, longRange: 3, recovery: 5, hasCounter: true)
    )
    
    static let donkeyKong = Character(
        id: "donkey_kong", 
        name: "Donkey Kong",
        order: 2,
        world: "Donkey Kong",
        mainImage: Image(._2DonkeyKongMain),
        thumbnailImage: Image(._2DonkeyKongThumb),
        levelImage: Image(.levelDonkeyKong),
        movesImage: Image(._2DonkeyKongMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 3, longRange: 2, recovery: 4, hasCounter: false)
    )
    
    static let link = Character(
        id: "link",
        name: "Link",
        order: 3,
        world: "The Legend of Zelda",
        mainImage: Image(._3LinkMain),
        thumbnailImage: Image(._3LinkThumb),
        levelImage: Image(.levelLink),
        movesImage: Image(._3LinkMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 3, longRange: 7, recovery: 3, hasCounter: true)
    )
    
    static let samus = Character(
        id: "samus",
        name: "Samus",
        order: 4,
        world: "Metroid",
        mainImage: Image(._4SamusMain),
        thumbnailImage: Image(._4SamusThumb),
        levelImage: Image(.levelSamus),
        movesImage: Image(._4SamusMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 4, longRange: 7, recovery: 3, hasCounter: true)
    )
    
    static let darkSamus = Character(
        id: "dark_samus",
        name: "Dark Samus",
        order: 4.1,
        world: "Metroid",
        mainImage: Image(._4DarkSamusMain),
        thumbnailImage: Image(._4DarkSamusThumb),
        levelImage: Image(.levelDarkSamus),
        movesImage: Image(._4DarkSamusMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 4, longRange: 7, recovery: 3, hasCounter: true)
    )
    
    static let yoshi = Character(
        id: "yoshi",
        name: "Yoshi",
        order: 5,
        world: "Super Mario",
        mainImage: Image(._5YoshiMain),
        thumbnailImage: Image(._5YoshiThumb),
        levelImage: Image(.levelYoshi),
        movesImage: Image(._5YoshiMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 5, longRange: 3, recovery: 6, hasCounter: true)
    )
    
    static let kirby = Character(
        id: "kirby",
        name: "Kirby",
        order: 6,
        world: "Kirby",
        mainImage: Image(._6KirbyMain),
        thumbnailImage: Image(._6KirbyThumb),
        levelImage: Image(.levelKirby),
        movesImage: Image(._6KirbyMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 4, longRange: 4, recovery: 5, hasCounter: false)
    )
    
    static let fox = Character(
        id: "fox",
        name: "Fox",
        order: 7,
        world: "Star Fox",
        mainImage: Image(._7FoxMain),
        thumbnailImage: Image(._7FoxThumb),
        levelImage: Image(.levelFox),
        movesImage: Image(._7FoxMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 7, longRange: 5, recovery: 3, hasCounter: true)
    )
    
    static let pikachu = Character(
        id: "pikachu",
        name: "Pikachu",
        order: 8,
        world: "Pokemon",
        mainImage: Image(._8PikachuMain),
        thumbnailImage: Image(._8PikachuThumb),
        levelImage: Image(.levelPikachu),
        movesImage: Image(._8PikachuMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 6, longRange: 6, recovery: 6, hasCounter: true)
    )
    
    static let luigi = Character(
        id: "luigi",
        name: "Luigi",
        order: 9,
        world: "Super Mario",
        mainImage: Image(._9LuigiMain),
        thumbnailImage: Image(._9LuigiThumb),
        levelImage: Image(.levelLuigi),
        movesImage: Image(._9LuigiMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 3, recovery: 5, hasCounter: true)
    )
    
    static let ness = Character(
        id: "ness",
        name: "Ness",
        order: 10,
        world: "EarthBound",
        mainImage: Image(._10NessMain),
        thumbnailImage: Image(._10NessThumb),
        levelImage: Image(.levelNess),
        movesImage: Image(._10NessMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 3, longRange: 6, recovery: 6, hasCounter: true)
    )
    
    static let captainFalcon = Character(
        id: "captain_falcon",
        name: "Captain Falcon",
        order: 11,
        world: "F-Zero",
        mainImage: Image(._11CaptainFalconMain),
        thumbnailImage: Image(._11CaptainFalconThumb),
        levelImage: Image(.levelCaptainFalcon),
        movesImage: Image(._11CaptainFalconMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 6, longRange: 2, recovery: 3, hasCounter: true)
    )
    
    static let jigglypuff = Character(
        id: "jigglypuff",
        name: "Jigglypuff",
        order: 12,
        world: "Pokemon",
        mainImage: Image(._12JigglypuffMain),
        thumbnailImage: Image(._12JigglypuffThumb),
        levelImage: Image(.levelJigglypuff),
        movesImage: Image(._12JigglypuffMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 2, speed: 3, longRange: 2, recovery: 7, hasCounter: false)
    )
    
    static let peach = Character(
        id: "peach",
        name: "Peach",
        order: 13,
        world: "Super Mario",
        mainImage: Image(._13PeachMain),
        thumbnailImage: Image(._13PeachThumb),
        levelImage: Image(.levelPeach),
        movesImage: Image(._13PeachMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 4, longRange: 4, recovery: 5, hasCounter: true)
    )
    
    static let daisy = Character(
        id: "daisy",
        name: "Daisy",
        order: 13.1,
        world: "Super Mario",
        mainImage: Image(._13DaisyMain),
        thumbnailImage: Image(._13DaisyThumb),
        levelImage: Image(.levelDaisy),
        movesImage: Image(._13DaisyMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 4, longRange: 4, recovery: 5, hasCounter: true)
    )
    
    static let bowser = Character(
        id: "bowser",
        name: "Bowser",
        order: 14,
        world: "Super Mario",
        mainImage: Image(._14BowserMain),
        thumbnailImage: Image(._14BowserThumb),
        levelImage: Image(.levelBowser),
        movesImage: Image(._14BowserMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 7, speed: 3, longRange: 2, recovery: 3, hasCounter: true)
    )
    
    static let iceClimbers = Character(
        id: "ice_climbers",
        name: "Ice Climbers",
        order: 15,
        world: "Ice Climber",
        mainImage: Image(._15IceClimbersMain),
        thumbnailImage: Image(._15IceClimbersThumb),
        levelImage: Image(.levelIceClimbers),
        movesImage: Image(._15IceClimbersMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 2, longRange: 2, recovery: 2, hasCounter: false)
    )
    
    static let sheik = Character(
        id: "sheik",
        name: "Sheik",
        order: 16,
        world: "The Legend of Zelda",
        mainImage: Image(._16SheikMain),
        thumbnailImage: Image(._16SheikThumb),
        levelImage: Image(.levelSheik),
        movesImage: Image(._16SheikMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 2, speed: 7, longRange: 4, recovery: 5, hasCounter: true)
    )
    
    static let zelda = Character(
        id: "zelda",
        name: "Zelda",
        order: 17,
        world: "The Legend of Zelda",
        mainImage: Image(._17ZeldaMain),
        thumbnailImage: Image(._17ZeldaThumb),
        levelImage: Image(.levelZelda),
        movesImage: Image(._17ZeldaMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 3, longRange: 6, recovery: 4, hasCounter: true)
    )
    
    static let drMario = Character(
        id: "dr_mario",
        name: "Dr. Mario",
        order: 18,
        world: "Super Mario",
        mainImage: Image(._18DrMarioMain),
        thumbnailImage: Image(._18DrMarioThumb),
        levelImage: Image(.levelDrMario),
        movesImage: Image(._18DrMarioMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 3, recovery: 4, hasCounter: true)
    )
    
    static let pichu = Character(
        id: "pichu",
        name: "Pichu",
        order: 19,
        world: "Pokemon",
        mainImage: Image(._19PichuMain),
        thumbnailImage: Image(._19PichuThumb),
        levelImage: Image(.levelPichu),
        movesImage: Image(._19PichuMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 2, speed: 6, longRange: 4, recovery: 5, hasCounter: true)
    )
    
    static let falco = Character(
        id: "falco",
        name: "Falco",
        order: 20,
        world: "Star Fox",
        mainImage: Image(._20FalcoMain),
        thumbnailImage: Image(._20FalcoThumb),
        levelImage: Image(.levelFalco),
        movesImage: Image(._20FalcoMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 6, longRange: 5, recovery: 3, hasCounter: true)
    )
    
    static let marth = Character(
        id: "marth",
        name: "Marth",
        order: 21,
        world: "Fire Emblem",
        mainImage: Image(._21MarthMain),
        thumbnailImage: Image(._21MarthThumb),
        levelImage: Image(.levelMarth),
        movesImage: Image(._21MarthMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 5, longRange: 2, recovery: 4, hasCounter: true)
    )
    
    static let lucina = Character(
        id: "lucina",
        name: "Lucina",
        order: 21.1,
        world: "Fire Emblem",
        mainImage: Image(._21LucinaMain),
        thumbnailImage: Image(._21LucinaThumb),
        levelImage: Image(.levelLucina),
        movesImage: Image(._21LucinaMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 5, longRange: 2, recovery: 4, hasCounter: true)
    )
    
    static let youngLink = Character(
        id: "young_link",
        name: "Young Link",
        order: 22,
        world: "The Legend of Zelda",
        mainImage: Image(._22YoungLinkMain),
        thumbnailImage: Image(._22YoungLinkThumb),
        levelImage: Image(.levelYoungLink),
        movesImage: Image(._22YoungLinkMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 5, longRange: 6, recovery: 4, hasCounter: true)
    )
    
    static let ganondorf = Character(
        id: "ganondorf",
        name: "Ganondorf",
        order: 23,
        world: "The Legend of Zelda",
        mainImage: Image(._23GanondorfMain),
        thumbnailImage: Image(._23GanondorfThumb),
        levelImage: Image(.levelGanondorf),
        movesImage: Image(._23GanondorfMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 7, speed: 3, longRange: 2, recovery: 2, hasCounter: true)
    )
    
    static let mewtwo = Character(
        id: "mewtwo",
        name: "Mewtwo",
        order: 24,
        world: "Pokemon",
        mainImage: Image(._24MewtwoMain),
        thumbnailImage: Image(._24MewtwoThumb),
        levelImage: Image(.levelMewtwo),
        movesImage: Image(._24MewtwoMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 5, longRange: 5, recovery: 5, hasCounter: true)
    )
    
    static let roy = Character(
        id: "roy",
        name: "Roy",
        order: 25,
        world: "Fire Emblem",
        mainImage: Image(._25RoyMain),
        thumbnailImage: Image(._25RoyThumb),
        levelImage: Image(.levelRoy),
        movesImage: Image(._25RoyMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 5, longRange: 2, recovery: 4, hasCounter: true)
    )
    
    static let chrom = Character(
        id: "chrom",
        name: "Chrom",
        order: 25.1,
        world: "Fire Emblem",
        mainImage: Image(._25ChromMain),
        thumbnailImage: Image(._25ChromThumb),
        levelImage: Image(.levelChrom),
        movesImage: Image(._25ChromMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 5, longRange: 2, recovery: 4, hasCounter: true)
    )
    
    static let mrGameAndWatch = Character(
        id: "mr_game_and_watch",
        name: "Mr. Game & Watch",
        order: 26,
        world: "Game & Watch",
        mainImage: Image(._26MrGameAndWatchMain),
        thumbnailImage: Image(._26MrGameAndWatchThumb),
        levelImage: Image(.levelMrGameAndWatch),
        movesImage: Image(._26MrGameAndWatchMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 2, speed: 3, longRange: 2, recovery: 4, hasCounter: false)
    )
    
    static let metaKnight = Character(
        id: "meta_knight",
        name: "Meta Knight",
        order: 27,
        world: "Kirby",
        mainImage: Image(._27MetaKnightMain),
        thumbnailImage: Image(._27MetaKnightThumb),
        levelImage: Image(.levelMetaKnight),
        movesImage: Image(._27MetaKnightMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 6, longRange: 2, recovery: 6, hasCounter: true)
    )
    
    static let pit = Character(
        id: "pit",
        name: "Pit",
        order: 28,
        world: "Kid Icarus",
        mainImage: Image(._28PitMain),
        thumbnailImage: Image(._28PitThumb),
        levelImage: Image(.levelPit),
        movesImage: Image(._28PitMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 4, longRange: 5, recovery: 6, hasCounter: true)
    )
    
    static let darkPit = Character(
        id: "dark_pit",
        name: "Dark Pit",
        order: 28.1,
        world: "Kid Icarus",
        mainImage: Image(._28DarkPitMain),
        thumbnailImage: Image(._28DarkPitThumb),
        levelImage: Image(.levelDarkPit),
        movesImage: Image(._28DarkPitMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 5, recovery: 6, hasCounter: true)
    )
    
    static let zeroSuitSamus = Character(
        id: "zero_suit_samus",
        name: "Zero Suit Samus",
        order: 29,
        world: "Metroid",
        mainImage: Image(._29ZeroSuitSamusMain),
        thumbnailImage: Image(._29ZeroSuitSamusThumb),
        levelImage: Image(.levelZeroSuitSamus),
        movesImage: Image(._29ZeroSuitSamusMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 6, longRange: 2, recovery: 5, hasCounter: true)
    )
    
    static let wario = Character(
        id: "wario",
        name: "Wario",
        order: 30,
        world: "Super Mario",
        mainImage: Image(._30WarioMain),
        thumbnailImage: Image(._30WarioThumb),
        levelImage: Image(.levelWario),
        movesImage: Image(._30WarioMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 4, longRange: 2, recovery: 4, hasCounter: true)
    )
    
    static let snake = Character(
        id: "snake",
        name: "Snake",
        order: 31,
        world: "Metal Gear",
        mainImage: Image(._31SnakeMain),
        thumbnailImage: Image(._31SnakeThumb),
        levelImage: Image(.levelSnake),
        movesImage: Image(._31SnakeMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 3, longRange: 6, recovery: 3, hasCounter: true)
    )
    
    static let ike = Character(
        id: "ike",
        name: "Ike",
        order: 32,
        world: "Fire Emblem",
        mainImage: Image(._32IkeMain),
        thumbnailImage: Image(._32IkeThumb),
        levelImage: Image(.levelIke),
        movesImage: Image(._32IkeMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 3, longRange: 2, recovery: 3, hasCounter: true)
    )
    
    static let pokemonTrainer = Character(
        id: "pokemon_trainer",
        name: "Pokemon Trainer",
        order: 33,
        world: "Pokemon",
        mainImage: Image(._33PokemonTrainerMain),
        thumbnailImage: Image(._33PokemonTrainerThumb),
        levelImage: Image(.levelPokemonTrainer),
        movesImage: Image(._33PokemonTrainerMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 5, recovery: 4, hasCounter: true)
    )
    
    static let diddyKong = Character(
        id: "diddy_kong",
        name: "Diddy Kong",
        order: 34,
        world: "Donkey Kong",
        mainImage: Image(._34DiddyKongMain),
        thumbnailImage: Image(._34DiddyKongThumb),
        levelImage: Image(.levelDiddyKong),
        movesImage: Image(._34DiddyKongMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 6, longRange: 4, recovery: 5, hasCounter: true)
    )
    
    static let lucas = Character(
        id: "lucas",
        name: "Lucas",
        order: 35,
        world: "EarthBound",
        mainImage: Image(._35LucasMain),
        thumbnailImage: Image(._35LucasThumb),
        levelImage: Image(.levelLucas),
        movesImage: Image(._35LucasMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 4, longRange: 6, recovery: 6, hasCounter: true)
    )
    
    static let sonic = Character(
        id: "sonic",
        name: "Sonic",
        order: 36,
        world: "Sonic the Hedgehog",
        mainImage: Image(._36SonicMain),
        thumbnailImage: Image(._36SonicThumb),
        levelImage: Image(.levelSonic),
        movesImage: Image(._36SonicMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 7, longRange: 2, recovery: 5, hasCounter: true)
    )
    
    static let kingDedede = Character(
        id: "king_dedede",
        name: "King Dedede",
        order: 37,
        world: "Kirby",
        mainImage: Image(._37KingDededeMain),
        thumbnailImage: Image(._37KingDededeThumb),
        levelImage: Image(.levelKingDedede),
        movesImage: Image(._37KingDededeMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 7, speed: 2, longRange: 4, recovery: 3, hasCounter: true)
    )
    
    static let olimar = Character(
        id: "olimar",
        name: "Olimar",
        order: 38,
        world: "Pikmin",
        mainImage: Image(._38OlimarMain),
        thumbnailImage: Image(._38OlimarThumb),
        levelImage: Image(.levelOlimar),
        movesImage: Image(._38OlimarMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 3, longRange: 5, recovery: 3, hasCounter: true)
    )
    
    static let lucario = Character(
        id: "lucario",
        name: "Lucario",
        order: 39,
        world: "Pokemon",
        mainImage: Image(._39LucarioMain),
        thumbnailImage: Image(._39LucarioThumb),
        levelImage: Image(.levelLucario),
        movesImage: Image(._39LucarioMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 5, longRange: 4, recovery: 4, hasCounter: true)
    )
    
    static let rob = Character(
        id: "rob",
        name: "R.O.B.",
        order: 40,
        world: "R.O.B.",
        mainImage: Image(._40RobMain),
        thumbnailImage: Image(._40RobThumb),
        levelImage: Image(.levelRob),
        movesImage: Image(._40RobMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 2, speed: 2, longRange: 5, recovery: 3, hasCounter: false)
    )
    
    static let toonLink = Character(
        id: "toon_link",
        name: "Toon Link",
        order: 41,
        world: "The Legend of Zelda",
        mainImage: Image(._41ToonLinkMain),
        thumbnailImage: Image(._41ToonLinkThumb),
        levelImage: Image(.levelToonLink),
        movesImage: Image(._41ToonLinkMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 5, longRange: 6, recovery: 4, hasCounter: true)
    )
    
    static let wolf = Character(
        id: "wolf",
        name: "Wolf",
        order: 42,
        world: "Star Fox",
        mainImage: Image(._42WolfMain),
        thumbnailImage: Image(._42WolfThumb),
        levelImage: Image(.levelWolf),
        movesImage: Image(._42WolfMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 5, longRange: 4, recovery: 4, hasCounter: true)
    )
    
    static let villager = Character(
        id: "villager",
        name: "Villager",
        order: 43,
        world: "Animal Crossing",
        mainImage: Image(._43VillagerMain),
        thumbnailImage: Image(._43VillagerThumb),
        levelImage: Image(.levelVillager),
        movesImage: Image(._43VillagerMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 3, longRange: 5, recovery: 5, hasCounter: true)
    )
    
    static let megaMan = Character(
        id: "mega_man",
        name: "Mega Man",
        order: 44,
        world: "Mega Man",
        mainImage: Image(._44MegaManMain),
        thumbnailImage: Image(._44MegaManThumb),
        levelImage: Image(.levelMegaMan),
        movesImage: Image(._44MegaManMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 7, recovery: 4, hasCounter: true)
    )
    
    static let wiiFitTrainer = Character(
        id: "wii_fit_trainer",
        name: "Wii Fit Trainer",
        order: 45,
        world: "Wii Fit",
        mainImage: Image(._45WiiFitTrainerMain),
        thumbnailImage: Image(._45WiiFitTrainerThumb),
        levelImage: Image(.levelWiiFitTrainer),
        movesImage: Image(._45WiiFitTrainerMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 3, longRange: 3, recovery: 4, hasCounter: false)
    )
    
    static let rosalinaAndLuma = Character(
        id: "rosalina_and_luma",
        name: "Rosalina & Luma",
        order: 46,
        world: "Super Mario",
        mainImage: Image(._46RosalinaAndLumaMain),
        thumbnailImage: Image(._46RosalinaAndLumaThumb),
        levelImage: Image(.levelRosalinaAndLuma),
        movesImage: Image(._46RosalinaAndLumaMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 3, longRange: 6, recovery: 4, hasCounter: true)
    )
    
    static let littleMac = Character(
        id: "little_mac",
        name: "Little Mac",
        order: 47,
        world: "Punch-Out!!",
        mainImage: Image(._47LittleMacMain),
        thumbnailImage: Image(._47LittleMacThumb),
        levelImage: Image(.levelLittleMac),
        movesImage: Image(._47LittleMacMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 6, longRange: 1, recovery: 2, hasCounter: true)
    )
    
    static let greninja = Character(
        id: "greninja",
        name: "Greninja",
        order: 48,
        world: "Pokemon",
        mainImage: Image(._48GreninjaMain),
        thumbnailImage: Image(._48GreninjaThumb),
        levelImage: Image(.levelGreninja),
        movesImage: Image(._48GreninjaMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 6, longRange: 4, recovery: 5, hasCounter: true)
    )
    
    static let miiBrawler = Character(
        id: "mii_brawler",
        name: "Mii Brawler",
        order: 49,
        world: "Mii",
        mainImage: Image(._49MiiBrawlerMain),
        thumbnailImage: Image(._49MiiBrawlerThumb),
        levelImage: Image(.levelMiiBrawler),
        movesImage: Image(._49MiiBrawlerMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 2, recovery: 4, hasCounter: true)
    )
    
    static let miiSwordfighter = Character(
        id: "mii_swordfighter",
        name: "Mii Swordfighter",
        order: 50,
        world: "Mii",
        mainImage: Image(._50MiiSwordfighterMain),
        thumbnailImage: Image(._50MiiSwordfighterThumb),
        levelImage: Image(.levelMiiSwordfighter),
        movesImage: Image(._50MiiSwordfighterMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 3, recovery: 4, hasCounter: true)
    )
    
    static let miiGunner = Character(
        id: "mii_gunner",
        name: "Mii Gunner",
        order: 51,
        world: "Mii",
        mainImage: Image(._51MiiGunnerMain),
        thumbnailImage: Image(._51MiiGunnerThumb),
        levelImage: Image(.levelMiiGunner),
        movesImage: Image(._51MiiGunnerMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 3, longRange: 6, recovery: 4, hasCounter: true)
    )
    
    static let palutena = Character(
        id: "palutena",
        name: "Palutena",
        order: 52,
        world: "Kid Icarus",
        mainImage: Image(._52PalutenaMain),
        thumbnailImage: Image(._52PalutenaThumb),
        levelImage: Image(.levelPalutena),
        movesImage: Image(._52PalutenaMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 3, longRange: 6, recovery: 5, hasCounter: true)
    )
    
    static let pacMan = Character(
        id: "pac_man",
        name: "Pac-Man",
        order: 53,
        world: "Pac-Man",
        mainImage: Image(._53PacManMain),
        thumbnailImage: Image(._53PacManThumb),
        levelImage: Image(.levelPacMan),
        movesImage: Image(._53PacManMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 4, longRange: 5, recovery: 5, hasCounter: true)
    )
    
    static let robin = Character(
        id: "robin",
        name: "Robin",
        order: 54,
        world: "Fire Emblem",
        mainImage: Image(._54RobinMain),
        thumbnailImage: Image(._54RobinThumb),
        levelImage: Image(.levelRobin),
        movesImage: Image(._54RobinMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 3, longRange: 6, recovery: 3, hasCounter: true)
    )
    
    static let shulk = Character(
        id: "shulk",
        name: "Shulk",
        order: 55,
        world: "Xenoblade Chronicles",
        mainImage: Image(._55ShulkMain),
        thumbnailImage: Image(._55ShulkThumb),
        levelImage: Image(.levelShulk),
        movesImage: Image(._55ShulkMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 4, longRange: 3, recovery: 4, hasCounter: true)
    )
    
    static let bowserJr = Character(
        id: "bowser_jr",
        name: "Bowser Jr.",
        order: 56,
        world: "Super Mario",
        mainImage: Image(._56BowserJrMain),
        thumbnailImage: Image(._56BowserJrThumb),
        levelImage: Image(.levelBowserJr),
        movesImage: Image(._56BowserJrMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 5, recovery: 4, hasCounter: true)
    )
    
    static let duckHunt = Character(
        id: "duck_hunt",
        name: "Duck Hunt",
        order: 57,
        world: "Duck Hunt",
        mainImage: Image(._57DuckHuntMain),
        thumbnailImage: Image(._57DuckHuntThumb),
        levelImage: Image(.levelDuckHunt),
        movesImage: Image(._57DuckHuntMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 2, speed: 3, longRange: 5, recovery: 3, hasCounter: false)
    )
    
    static let ryu = Character(
        id: "ryu",
        name: "Ryu",
        order: 58,
        world: "Street Fighter",
        mainImage: Image(._58RyuMain),
        thumbnailImage: Image(._58RyuThumb),
        levelImage: Image(.levelRyu),
        movesImage: Image(._58RyuMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 4, longRange: 4, recovery: 3, hasCounter: true)
    )
    
    static let ken = Character(
        id: "ken",
        name: "Ken",
        order: 58.1,
        world: "Street Fighter", 
        mainImage: Image(._58KenMain),
        thumbnailImage: Image(._58KenThumb),
        levelImage: Image(.levelKen),
        movesImage: Image(._58KenMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 5, longRange: 4, recovery: 3, hasCounter: true)
    )
    
    static let cloud = Character(
        id: "cloud",
        name: "Cloud",
        order: 59,
        world: "Final Fantasy",
        mainImage: Image(._59CloudMain),
        thumbnailImage: Image(._59CloudThumb),
        levelImage: Image(.levelCloud),
        movesImage: Image(._59CloudMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 6, speed: 5, longRange: 3, recovery: 3, hasCounter: true)
    )
    
    static let corrin = Character(
        id: "corrin",
        name: "Corrin",
        order: 60,
        world: "Fire Emblem",
        mainImage: Image(._60CorrinMain),
        thumbnailImage: Image(._60CorrinThumb),
        levelImage: Image(.levelCorrin),
        movesImage: Image(._60CorrinMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 4, speed: 4, longRange: 4, recovery: 4, hasCounter: true)
    )
    
    static let bayonetta = Character(
        id: "bayonetta",
        name: "Bayonetta",
        order: 61,
        world: "Bayonetta",
        mainImage: Image(._61BayonettaMain),
        thumbnailImage: Image(._61BayonettaThumb),
        levelImage: Image(.levelBayonetta),
        movesImage: Image(._61BayonettaMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 5, speed: 5, longRange: 4, recovery: 5, hasCounter: true)
    )
    
    static let inkling = Character(
        id: "inkling",
        name: "Inkling",
        order: 62,
        world: "Splatoon",
        mainImage: Image(._62InklingMain),
        thumbnailImage: Image(._62InklingThumb),
        levelImage: Image(.levelInkling),
        movesImage: Image(._62InklingMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 5, longRange: 5, recovery: 5, hasCounter: true)
    )
    
    static let ridley = Character(
        id: "ridley",
        name: "Ridley",
        order: 63,
        world: "Metroid",
        mainImage: Image(._63RidleyMain),
        thumbnailImage: Image(._63RidleyThumb),
        levelImage: Image(.levelRidley),
        movesImage: Image(._63RidleyMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 4, longRange: 3, recovery: 4, hasCounter: true)
    )
    
    static let simonBelmont = Character(
        id: "simon_belmont",
        name: "Simon Belmont",
        order: 64,
        world: "Castlevania",
        mainImage: Image(._64SimonBelmontMain),
        thumbnailImage: Image(._64SimonBelmontThumb),
        levelImage: Image(.levelSimonBelmont),
        movesImage: Image(._64SimonBelmontMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 3, longRange: 7, recovery: 2, hasCounter: true)
    )
    
    static let richter = Character(
        id: "richter",
        name: "Richter",
        order: 64.1,
        world: "Castlevania",
        mainImage: Image(._64RichterMain),
        thumbnailImage: Image(._64RichterThumb),
        levelImage: Image(.levelRichter),
        movesImage: Image(._64RichterMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 3, longRange: 7, recovery: 2, hasCounter: true)
    )
    
    static let kingKRool = Character(
        id: "king_k_rool",
        name: "King K. Rool",
        order: 65,
        world: "Donkey Kong",
        mainImage: Image(._65KingKRoolMain),
        thumbnailImage: Image(._65KingKRoolThumb),
        levelImage: Image(.levelKingKRool),
        movesImage: Image(._65KingKRoolMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 3, longRange: 4, recovery: 3, hasCounter: true)
    )
    
    static let isabelle = Character(
        id: "isabelle",
        name: "Isabelle",
        order: 66,
        world: "Animal Crossing",
        mainImage: Image(._66IsabelleMain),
        thumbnailImage: Image(._66IsabelleThumb),
        levelImage: Image(.levelIsabelle),
        movesImage: Image(._66IsabelleMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 2, speed: 4, longRange: 4, recovery: 5, hasCounter: true)
    )
    
    static let incineroar = Character(
        id: "incineroar",
        name: "Incineroar",
        order: 67,
        world: "Pokemon",
        mainImage: Image(._67IncineroarMain),
        thumbnailImage: Image(._67IncineroarThumb),
        levelImage: Image(.levelIncineroar),
        movesImage: Image(._67IncineroarMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 3, longRange: 2, recovery: 3, hasCounter: true)
    )
    
    static let piranha = Character(
        id: "piranha",
        name: "Piranha Plant",
        order: 68,
        world: "Super Mario",
        mainImage: Image(._68PiranhaMain),
        thumbnailImage: Image(._68PiranhaThumb),
        levelImage: Image(.levelPiranha),
        movesImage: Image(._68PiranhaMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 499,
        stats: Stats(power: 4, speed: 2, longRange: 5, recovery: 3, hasCounter: true)
    )
    
    static let joker = Character(
        id: "joker",
        name: "Joker",
        order: 69,
        world: "Persona",
        mainImage: Image(._69JokerMain),
        thumbnailImage: Image(._69JokerThumb),
        levelImage: Image(.levelJoker),
        movesImage: Image(._69JokerMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 4, speed: 5, longRange: 3, recovery: 5, hasCounter: true)
    )
    
    static let hero = Character(
        id: "hero",
        name: "Hero",
        order: 70,
        world: "Dragon Quest",
        mainImage: Image(._70HeroMain),
        thumbnailImage: Image(._70HeroThumb),
        levelImage: Image(.levelHero),
        movesImage: Image(._70HeroMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 6, speed: 4, longRange: 5, recovery: 3, hasCounter: true)
    )
    
    static let banjoAndKazooie = Character(
        id: "banjo_and_kazooie",
        name: "Banjo & Kazooie",
        order: 71,
        world: "Banjo-Kazooie",
        mainImage: Image(._71BanjoAndKazooieMain),
        thumbnailImage: Image(._71BanjoAndKazooieThumb),
        levelImage: Image(.levelBanjoAndKazooie),
        movesImage: Image(._71BanjoAndKazooieMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 4, speed: 4, longRange: 4, recovery: 4, hasCounter: true)
    )
    
    static let terry = Character(
        id: "terry",
        name: "Terry",
        order: 72,
        world: "Fatal Fury",
        mainImage: Image(._72TerryMain),
        thumbnailImage: Image(._72TerryThumb),
        levelImage: Image(.levelTerry),
        movesImage: Image(._72TerryMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 5, speed: 5, longRange: 3, recovery: 4, hasCounter: true)
    )
    
    static let byleth = Character(
        id: "byleth",
        name: "Byleth",
        order: 73,
        world: "Fire Emblem",
        mainImage: Image(._73BylethMain),
        thumbnailImage: Image(._73BylethThumb),
        levelImage: Image(.levelByleth),
        movesImage: Image(._73BylethMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 5, speed: 3, longRange: 4, recovery: 3, hasCounter: true)
    )
    
    static let minMin = Character(
        id: "min_min",
        name: "Min Min",
        order: 74,
        world: "ARMS",
        mainImage: Image(._74MinMinMain),
        thumbnailImage: Image(._74MinMinThumb),
        levelImage: Image(.levelMinMin),
        movesImage: Image(._74MinMinMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 4, speed: 4, longRange: 7, recovery: 3, hasCounter: true)
    )
    
    static let steve = Character(
        id: "steve",
        name: "Steve",
        order: 75,
        world: "Minecraft",
        mainImage: Image(._75SteveMain),
        thumbnailImage: Image(._75SteveThumb),
        levelImage: Image(.levelSteve),
        movesImage: Image(._75SteveMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 4, speed: 3, longRange: 4, recovery: 4, hasCounter: true)
    )
    
    static let sephiroth = Character(
        id: "sephiroth",
        name: "Sephiroth",
        order: 76,
        world: "Final Fantasy",
        mainImage: Image(._76SephirothMain),
        thumbnailImage: Image(._76SephirothThumb),
        levelImage: Image(.levelSephiroth),
        movesImage: Image(._76SephirothMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 7, speed: 5, longRange: 5, recovery: 3, hasCounter: true)
    )
    
    static let pyraAndMythra = Character(
        id: "pyra_and_mythra",
        name: "Pyra/Mythra",
        order: 77,
        world: "Xenoblade Chronicles",
        mainImage: Image(._77PyraAndMythraMain),
        thumbnailImage: Image(._77PyraAndMythraThumb),
        levelImage: Image(.levelPyraAndMythra),
        movesImage: Image(._77PyraAndMythraMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 5, speed: 6, longRange: 3, recovery: 4, hasCounter: true)
    )
    
    static let kazuya = Character(
        id: "kazuya",
        name: "Kazuya",
        order: 78,
        world: "Tekken",
        mainImage: Image(._78KazuyaMain),
        thumbnailImage: Image(._78KazuyaThumb),
        levelImage: Image(.levelKazuya),
        movesImage: Image(._78KazuyaMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 7, speed: 4, longRange: 2, recovery: 3, hasCounter: true)
    )
    
    static let sora = Character(
        id: "sora",
        name: "Sora",
        order: 79,
        world: "Kingdom Hearts",
        mainImage: Image(._79SoraMain),
        thumbnailImage: Image(._79SoraThumb),
        levelImage: Image(.levelSora),
        movesImage: Image(._79SoraMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 4, speed: 5, longRange: 4, recovery: 5, hasCounter: true)
    )
}

extension Character {
    static let preUnlocked: [Character] = [
        mario,
        donkeyKong,
        link,
        samus,
        darkSamus,
        yoshi,
        kirby,
        fox
    ]
    
    static let unlockable: [Character] = [
        pikachu,
        luigi,
        ness,
        captainFalcon,
        jigglypuff,
        peach,
        daisy,
        bowser,
        iceClimbers,
        sheik,
        zelda,
        drMario,
        pichu,
        falco,
        marth,
        lucina,
        youngLink,
        ganondorf,
        mewtwo,
        roy,
        chrom,
        mrGameAndWatch,
        metaKnight,
        pit,
        darkPit,
        zeroSuitSamus,
        wario,
        snake,
        ike,
        pokemonTrainer,
        diddyKong,
        lucas,
        sonic,
        kingDedede,
        olimar,
        lucario,
        rob,
        toonLink,
        wolf,
        villager,
        megaMan,
        wiiFitTrainer,
        rosalinaAndLuma,
        littleMac,
        greninja,
        miiBrawler,
        miiSwordfighter,
        miiGunner,
        palutena,
        pacMan,
        robin,
        shulk,
        bowserJr,
        duckHunt,
        ryu,
        ken,
        inkling,
        ridley,
        simonBelmont,
        richter,
        kingKRool,
        isabelle,
        incineroar
    ]
    
    static let dlc: [Character] = [
        cloud,
        corrin,
        bayonetta,
        piranha,
        joker,
        hero,
        banjoAndKazooie,
        terry,
        byleth,
        minMin,
        steve,
        sephiroth,
        pyraAndMythra,
        kazuya,
        sora
    ]
}

