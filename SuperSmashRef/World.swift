import Foundation
import SwiftUI

struct Stage: Hashable {
    let id: String
    let name: String

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

struct World: Identifiable, Equatable, Hashable {
    let id: String
    let name: String
    let characterIds: [String]
    let stages: [Stage]

    init(id: String, name: String, characterIds: [String], stages: [Stage]) {
        self.id = id
        self.name = name
        self.characterIds = characterIds
        self.stages = stages
    }
}

extension World {
    static let superMario = World(
        id: "mario",
        name: "Super Mario World",
        characterIds: ["mario", "luigi", "peach", "daisy", "bowser", "drMario", "rosalina", "bowserJr"],
        stages: [
            Stage(id: "peachCastle", name: "Princess Peach's Castle"),
            Stage(id: "mushroomKingdom", name: "Mushroom Kingdom"),
            Stage(id: "mushroomKingdom2", name: "Mushroom Kingdom II"),
            Stage(id: "mushroomyKingdom", name: "Mushroomy Kingdom"),
            Stage(id: "delfinoPlaza", name: "Delfino Plaza"),
            Stage(id: "luigisMansion", name: "Luigi's Mansion"),
            Stage(id: "figure8Circuit", name: "Figure-8 Circuit"),
            Stage(id: "marioBros", name: "Mario Bros."),
            Stage(id: "3dLand", name: "3D Land"),
            Stage(id: "goldenPlains", name: "Golden Plains"),
            Stage(id: "paperMario", name: "Paper Mario"),
            Stage(id: "marioGalaxy", name: "Mario Galaxy"),
            Stage(id: "rainbowCruise", name: "Rainbow Cruise"),
            Stage(id: "mushroomKingdomU", name: "Mushroom Kingdom U"),
            Stage(id: "marioCircuit", name: "Mario Circuit"),
            Stage(id: "superMarioMaker", name: "Super Mario Maker")
        ]
    )

    static let donkeyKong = World(
        id: "donkeyKong",
        name: "Donkey Kong",
        characterIds: ["donkeyKong", "diddyKong", "kingKRool"],
        stages: [
            Stage(id: "kongoJungle", name: "Kongo Jungle"),
            Stage(id: "kongoFalls", name: "Kongo Falls"),
            Stage(id: "jungleJapes", name: "Jungle Japes"),
            Stage(id: "75m", name: "75m"),
            Stage(id: "rumbleFalls", name: "Rumble Falls")
        ]
    )

    static let zelda = World(
        id: "zelda",
        name: "The Legend of Zelda",
        characterIds: ["link", "youngLink", "toonLink", "zelda", "sheik", "ganondorf"],
        stages: [
            Stage(id: "hyruleCastle", name: "Hyrule Castle"),
            Stage(id: "greatBay", name: "Great Bay"),
            Stage(id: "temple", name: "Temple"),
            Stage(id: "bridgeOfEldin", name: "Bridge of Eldin"),
            Stage(id: "pirateShip", name: "Pirate Ship"),
            Stage(id: "gerudoValley", name: "Gerudo Valley"),
            Stage(id: "spiritTrain", name: "Spirit Train"),
            Stage(id: "skyloft", name: "Skyloft")
        ]
    )

    static let metroid = World(
        id: "metroid",
        name: "Metroid",
        characterIds: ["samus", "darkSamus", "zeroSuitSamus", "ridley"],
        stages: [
            Stage(id: "brinstar", name: "Brinstar"),
            Stage(id: "brinstarDepths", name: "Brinstar Depths"),
            Stage(id: "norfair", name: "Norfair"),
            Stage(id: "frigateOrpheon", name: "Frigate Orpheon")
        ]
    )

    static let yoshi = World(
        id: "yoshi",
        name: "Yoshi's Island",
        characterIds: ["yoshi"],
        stages: [
            Stage(id: "yoshisIsland", name: "Yoshi's Island"),
            Stage(id: "yoshisStory", name: "Yoshi's Story"),
            Stage(id: "yoshisIslandBrawl", name: "Yoshi's Island (Brawl)"),
            Stage(id: "superHappyTree", name: "Super Happy Tree")
        ]
    )

    static let kirby = World(
        id: "kirby",
        name: "Dream Land",
        characterIds: ["kirby", "kingDedede", "metaKnight"],
        stages: [
            Stage(id: "dreamLand", name: "Dream Land"),
            Stage(id: "dreamLandGB", name: "Dream Land GB"),
            Stage(id: "greenGreens", name: "Green Greens"),
            Stage(id: "halberb", name: "Halberd"),
            Stage(id: "theFountainOfDreams", name: "The Fountain of Dreams")
        ]
    )

    static let starFox = World(
        id: "starFox",
        name: "Star Fox",
        characterIds: ["fox", "falco", "wolf"],
        stages: [
            Stage(id: "corneria", name: "Corneria"),
            Stage(id: "venom", name: "Venom"),
            Stage(id: "lylatCruise", name: "Lylat Cruise")
        ]
    )

    static let pokemon = World(
        id: "pokemon",
        name: "Pokémon",
        characterIds: ["pikachu", "jigglypuff", "mewtwo", "pichu", "lucario", "pokemon_trainer", "greninja", "incineroar"],
        stages: [
            Stage(id: "saffronCity", name: "Saffron City"),
            Stage(id: "pokemonStadium", name: "Pokémon Stadium"),
            Stage(id: "pokemonStadium2", name: "Pokémon Stadium 2"),
            Stage(id: "spearPillar", name: "Spear Pillar"),
            Stage(id: "unova", name: "Unova Pokémon League"),
            Stage(id: "prismTower", name: "Prism Tower"),
            Stage(id: "kalos", name: "Kalos Pokémon League"),
            Stage(id: "pokeFloats", name: "Poké Floats")
        ]
    )

    static let fireEmblem = World(
        id: "fireEmblem",
        name: "Fire Emblem",
        characterIds: ["marth", "roy", "ike", "lucina", "robin", "corrin", "chrom", "byleth"],
        stages: [
            Stage(id: "castleSiege", name: "Castle Siege"),
            Stage(id: "arena", name: "Arena Ferox"),
            Stage(id: "coliseum", name: "Coliseum"),
            Stage(id: "garregMach", name: "Garreg Mach Monastery")
        ]
    )

    // Add the missing worlds
    static let fZero = World(
        id: "fZero",
        name: "F-Zero",
        characterIds: ["captainFalcon"],
        stages: [
            Stage(id: "muteCitySNES", name: "Mute City SNES"),
            Stage(id: "bigBlue", name: "Big Blue"),
            Stage(id: "portTownAeroDive", name: "Port Town Aero Dive")
        ]
    )

    static let earthBound = World(
        id: "earthBound",
        name: "EarthBound",
        characterIds: ["ness", "lucas"],
        stages: [
            Stage(id: "onett", name: "Onett"),
            Stage(id: "fourside", name: "Fourside"),
            Stage(id: "newPorkCity", name: "New Pork City"),
            Stage(id: "magicant", name: "Magicant")
        ]
    )

    static let gameAndWatch = World(
        id: "gameAndWatch",
        name: "Game & Watch",
        characterIds: ["mrGameAndWatch"],
        stages: [
            Stage(id: "flatZoneX", name: "Flat Zone X")
        ]
    )

    static let kidIcarus = World(
        id: "kidIcarus",
        name: "Kid Icarus",
        characterIds: ["pit", "darkPit", "palutena"],
        stages: [
            Stage(id: "skyworld", name: "Skyworld"),
            Stage(id: "resetBombForest", name: "Reset Bomb Forest"),
            Stage(id: "palutenasTemple", name: "Palutena's Temple")
        ]
    )

    static let wario = World(
        id: "wario",
        name: "Wario World",
        characterIds: ["wario"],
        stages: [
            Stage(id: "warioWare", name: "WarioWare, Inc."),
            Stage(id: "gamer", name: "Gamer")
        ]
    )

    static let pikmin = World(
        id: "pikmin",
        name: "Pikmin",
        characterIds: ["olimar"],
        stages: [
            Stage(id: "distantPlanet", name: "Distant Planet"),
            Stage(id: "gardenOfMorning", name: "Garden of Morning")
        ]
    )

    static let animalCrossing = World(
        id: "animalCrossing",
        name: "Animal Crossing",
        characterIds: ["villager", "isabelle"],
        stages: [
            Stage(id: "smashville", name: "Smashville"),
            Stage(id: "townAndCity", name: "Town and City"),
            Stage(id: "tortimerIsland", name: "Tortimer Island")
        ]
    )

    static let punchOut = World(
        id: "punchOut",
        name: "Punch-Out!!",
        characterIds: ["littleMac"],
        stages: [
            Stage(id: "boxingRing", name: "Boxing Ring")
        ]
    )

    static let xenoblade = World(
        id: "xenoblade",
        name: "Xenoblade Chronicles",
        characterIds: ["shulk", "pyraMythra"],
        stages: [
            Stage(id: "gaurPlain", name: "Gaur Plain"),
            Stage(id: "cloudSeaOfAlrest", name: "Cloud Sea of Alrest")
        ]
    )

    static let splatoon = World(
        id: "splatoon",
        name: "Splatoon",
        characterIds: ["inkling"],
        stages: [
            Stage(id: "morayTowers", name: "Moray Towers")
        ]
    )

    static let castlevania = World(
        id: "castlevania",
        name: "Castlevania",
        characterIds: ["simon", "richter"],
        stages: [
            Stage(id: "draculasCastle", name: "Dracula's Castle")
        ]
    )

    static let persona = World(
        id: "persona",
        name: "Persona",
        characterIds: ["joker"],
        stages: [
            Stage(id: "mementos", name: "Mementos")
        ]
    )

    static let dragonQuest = World(
        id: "dragonQuest",
        name: "Dragon Quest",
        characterIds: ["hero"],
        stages: [
            Stage(id: "yggdrasilsAltar", name: "Yggdrasil's Altar")
        ]
    )

    static let banjoKazooie = World(
        id: "banjoKazooie",
        name: "Banjo-Kazooie",
        characterIds: ["banjoKazooie"],
        stages: [
            Stage(id: "spiralMountain", name: "Spiral Mountain")
        ]
    )

    static let fatalFury = World(
        id: "fatalFury",
        name: "Fatal Fury/King of Fighters",
        characterIds: ["terry"],
        stages: [
            Stage(id: "kingOfFightersStadium", name: "King of Fighters Stadium")
        ]
    )

    static let arms = World(
        id: "arms",
        name: "ARMS",
        characterIds: ["minMin"],
        stages: [
            Stage(id: "springStadium", name: "Spring Stadium")
        ]
    )

    static let minecraft = World(
        id: "minecraft",
        name: "Minecraft",
        characterIds: ["steve"],
        stages: [
            Stage(id: "minecraftWorld", name: "Minecraft World")
        ]
    )

    static let finalFantasy = World(
        id: "finalFantasy",
        name: "Final Fantasy",
        characterIds: ["cloud", "sephiroth"],
        stages: [
            Stage(id: "midgar", name: "Midgar"),
            Stage(id: "northernCave", name: "Northern Cave")
        ]
    )

    static let bayonetta = World(
        id: "bayonetta",
        name: "Bayonetta",
        characterIds: ["bayonetta"],
        stages: [
            Stage(id: "umbraClockTower", name: "Umbra Clock Tower")
        ]
    )

    static let metalGear = World(
        id: "metalGear",
        name: "Metal Gear Solid",
        characterIds: ["snake"],
        stages: [
            Stage(id: "shadowMosesIsland", name: "Shadow Moses Island")
        ]
    )

    static let sonic = World(
        id: "sonic",
        name: "Sonic the Hedgehog",
        characterIds: ["sonic"],
        stages: [
            Stage(id: "greenHillZone", name: "Green Hill Zone"),
            Stage(id: "windyHillZone", name: "Windy Hill Zone")
        ]
    )

    static let megaMan = World(
        id: "megaMan",
        name: "Mega Man",
        characterIds: ["megaMan"],
        stages: [
            Stage(id: "wilyCastle", name: "Wily Castle")
        ]
    )

    static let pacMan = World(
        id: "pacMan",
        name: "Pac-Man",
        characterIds: ["pacMan"],
        stages: [
            Stage(id: "pacLand", name: "Pac-Land")
        ]
    )

    static let streetFighter = World(
        id: "streetFighter",
        name: "Street Fighter",
        characterIds: ["ryu", "ken"],
        stages: [
            Stage(id: "suzakuCastle", name: "Suzaku Castle")
        ]
    )

    static let tekken = World(
        id: "tekken",
        name: "Tekken",
        characterIds: ["kazuya"],
        stages: [
            Stage(id: "mishimaDojo", name: "Mishima Dojo")
        ]
    )

    static let kingdomHearts = World(
        id: "kingdomHearts",
        name: "Kingdom Hearts",
        characterIds: ["sora"],
        stages: [
            Stage(id: "hollowBastion", name: "Hollow Bastion")
        ]
    )

    static let iceClimber = World(
        id: "iceClimber",
        name: "Ice Climber",
        characterIds: ["iceClimbers"],
        stages: [
            Stage(id: "summit", name: "Summit"),
            Stage(id: "icicleMountain", name: "Icicle Mountain")
        ]
    )

    static let retro = World(
        id: "retro",
        name: "Retro Nintendo World",
        characterIds: ["mrGameAndWatch", "duckHunt"],
        stages: [
            Stage(id: "flatZoneX", name: "Flat Zone X"),
            Stage(id: "duckHuntStage", name: "Duck Hunt")
        ]
    )

    static let mii = World(
        id: "miiWorld",
        name: "Wii",
        characterIds: ["miiBrawler", "miiSwordfighter", "miiGunner", "wiiFitTrainer"],
        stages: [
            Stage(id: "wiiFitStudio", name: "Wii Fit Studio")
        ]
    )

    // Add a static property to get all worlds
    static let all: [World] = [
        superMario, donkeyKong, zelda, metroid, yoshi, kirby, starFox, pokemon, fireEmblem,
        fZero, earthBound, retro, kidIcarus, wario, pikmin, animalCrossing, mii,
        punchOut, xenoblade, splatoon, castlevania, persona, dragonQuest, banjoKazooie,
        fatalFury, arms, minecraft, finalFantasy, bayonetta, metalGear, sonic, megaMan,
        pacMan, streetFighter, tekken, kingdomHearts, iceClimber, mii
    ]
}
