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

struct Character: Identifiable, Equatable {
    let id: String
    let name: String
    let order: Double
    let world: World
    let summary: String

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

    init(id: String, name: String, order: Double, world: World, mainImage: Image, thumbnailImage: Image, movesImage: Image, skinImages: [Image], isDLC: Bool = false, priceCents: Int? = nil, stats: Stats, summary: String) {
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
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(order)
        hasher.combine(world)
        hasher.combine(isDLC)
        hasher.combine(priceCents)
        hasher.combine(stats)
    }

    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.order == rhs.order &&
        lhs.world == rhs.world &&
        lhs.isDLC == rhs.isDLC &&
        lhs.priceCents == rhs.priceCents &&
        lhs.stats == rhs.stats
    }
}

extension Character {

    static var all: [Character] {
        base + unlockable + dlc
    }
    
    // Base characters (the 8 starting characters in Super Smash Bros. Ultimate)
    static let base: [Character] = [
        mario,          // 01
        donkeyKong,     // 02
        link,           // 03
        samus,          // 04
        yoshi,          // 05
        kirby,          // 06
        fox,            // 07
        pikachu         // 08
    ]

    // Unlocked characters (non-DLC characters that can be unlocked for free)
    static let unlockable: [Character] = [
        darkSamus,      // 04ᵋ
        luigi,          // 09
        ness,           // 10
        captainFalcon,  // 11
        jigglypuff,     // 12
        peach,          // 13
        daisy,          // 13ᵋ
        bowser,         // 14
        iceClimbers,    // 15
        sheik,          // 16
        zelda,          // 17
        drMario,        // 18
        pichu,          // 19
        falco,          // 20
        marth,          // 21
        lucina,         // 21ᵋ
        youngLink,      // 22
        ganondorf,      // 23
        mewtwo,         // 24
        roy,            // 25
        chrom,          // 25ᵋ
        mrGameAndWatch, // 26
        metaKnight,     // 27
        pit,            // 28
        darkPit,        // 28ᵋ
        zeroSuitSamus,  // 29
        wario,          // 30
        snake,          // 31
        ike,            // 32
        squirtle,       // 33
        ivysaur,        // 34
        charizard,      // 35
        diddyKong,      // 36
        lucas,          // 37
        sonic,          // 38
        kingDedede,     // 39
        olimar,         // 40
        lucario,        // 41
        rob,            // 42
        toonLink,       // 43
        wolf,           // 44
        villager,       // 45
        megaman,        // 46
        wiiFitTrainer,  // 47
        rosalina,       // 48
        littleMac,      // 49
        greninja,       // 50
        miiBrawler,     // 51
        miiSwordfighter,// 52
        miiGunner,      // 53
        palutena,       // 54
        pacman,         // 55
        robin,          // 56
        shulk,          // 57
        bowserJr,       // 58
        duckHunt,       // 59
        ryu,            // 60
        ken,            // 60ᵋ
        cloud,          // 61
        corrin,         // 62
        bayonetta,      // 63
        inkling,        // 64
        ridley,         // 65
        simon,          // 66
        richter,        // 66ᵋ
        kingKRool,      // 67
        isabelle,       // 68
        incineroar      // 69
    ]

    // DLC characters (require purchase)
    static let dlc: [Character] = [
        piranha,        // 70
        joker,          // 71
//        hero,           // 72
//        banjoKazooie,   // 73
//        terry,          // 74
//        byleth,         // 75
//        minMin,         // 76
        steve,          // 77
        sephiroth,      // 78
//        pyra,           // 79
//        mythra,         // 80
//        kazuya,         // 81
//        sora            // 82
    ]

    // Characters in order from 1 to 82
    static let mario = Character(
        id: "mario",
        name: "Mario",
        order: 1,
        world: .superMario,
        mainImage: Image(.marioMain),
        thumbnailImage: Image(.marioThumb),
        movesImage: Image(.marioMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 5, longRange: 3, recovery: 5, hasCounter: true),
        summary: "Mario is the iconic hero and mascot of the Nintendo universe, renowned for his adventures in the Mushroom Kingdom. As a brave and versatile plumber from Brooklyn, he has dedicated his life to protecting Princess Peach and thwarting Bowser's countless schemes. His balanced fighting style combines acrobatic jumps, fireballs, and his signature cape, making him an excellent all-around fighter. Throughout his many adventures, Mario has saved not only the Mushroom Kingdom but numerous other worlds, showcasing his unwavering courage and determination. His cheerful personality and distinctive red cap and overalls have made him one of the most recognizable video game characters of all time."
    )

    static let donkeyKong = Character(
        id: "donkeyKong",
        name: "Donkey Kong",
        order: 2,
        world: .donkeyKong,
        mainImage: Image(.dkMain),
        thumbnailImage: Image(.donkeyKongThumb),
        movesImage: Image(.donkeyKongMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 3, longRange: 2, recovery: 4, hasCounter: false),
        summary: "Donkey Kong is the powerful ruler of DK Island and leader of the Kong family, known for his incredible strength and love for bananas. Originally appearing as Mario's adversary, he has evolved into a heroic figure who protects his island home from various threats, particularly the Kremling army led by King K. Rool. Despite his intimidating size and strength, DK is known for his laid-back personality and playing the bongos in his spare time. His fighting style emphasizes raw power and ground-shaking attacks, making him a force to be reckoned with in close combat. While not the most agile fighter, his combination of power moves and surprising aerial mobility makes him a unique challenger."
    )

    static let link = Character(
        id: "link",
        name: "Link",
        order: 3,
        world: .zelda,
        mainImage: Image(.linkMain),
        thumbnailImage: Image(.linkThumb),
        movesImage: Image(.linkMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 3, longRange: 7, recovery: 3, hasCounter: true),
        summary: "Link is the legendary hero of Hyrule, chosen by the Goddess to wield the Master Sword and defend the realm from darkness. Throughout multiple incarnations across different timelines, he has consistently shown unwavering courage in the face of evil, particularly against Ganon's various forms. His arsenal includes not only his iconic Master Sword and Hylian Shield, but also an array of items like bombs, boomerang, and bow and arrows, making him a versatile fighter at any range. As the bearer of the Triforce of Courage, Link rarely speaks but lets his heroic actions and unwavering determination speak for themselves. His latest incarnation from Breath of the Wild brings new abilities like Remote Bombs and the Ancient Bow to his classic skillset."
    )

    static let samus = Character(
        id: "samus",
        name: "Samus",
        order: 4,
        world: .metroid,
        mainImage: Image(.samusMain),
        thumbnailImage: Image(.samusThumb),
        movesImage: Image(.samusMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 4, longRange: 7, recovery: 3, hasCounter: true),
        summary: "Samus Aran is the galaxy's most feared bounty hunter, equipped with the legendary Chozo Power Suit that grants her incredible combat capabilities. Orphaned at a young age and raised by the Chozo race, she has become a master of advanced technology and combat techniques. Her mission to protect the galaxy has led her to face countless threats, particularly the Space Pirates and their experiments with Metroids. Her arsenal includes an arm cannon capable of various beam weapons, missiles, and the iconic Morph Ball transformation. Despite her stoic exterior, Samus carries deep emotional scars from her past, driving her relentless pursuit of justice across the cosmos."
    )

    static let darkSamus = Character(
        id: "darkSamus",
        name: "Dark Samus",
        order: 4.1,
        world: .metroid,
        mainImage: Image(.darkSamusMain),
        thumbnailImage: Image(.darkSamusThumb),
        movesImage: Image(.darkSamusMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 4, longRange: 7, recovery: 3, hasCounter: true),
        summary: "Dark Samus is a corrupted doppelganger of Samus Aran, born from the fusion of Metroid Prime and Phazon energy. This menacing entity combines Samus's combat prowess with the destructive power of Phazon, creating a formidable opponent that threatens the entire galaxy. Unlike the original Samus, Dark Samus shows no restraint or moral compass, acting purely on instinct and the drive to spread Phazon corruption. Her abilities mirror Samus's arsenal but with a dark, corrupted twist that makes them even more deadly. As a being of pure Phazon, she possesses extraordinary regenerative abilities and can survive in the harshest environments."
    )

    static let yoshi = Character(
        id: "yoshi",
        name: "Yoshi",
        order: 5,
        world: .yoshi,
        mainImage: Image(.yoshiMain),
        thumbnailImage: Image(.yoshiThumb),
        movesImage: Image(.yoshiMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 5, longRange: 3, recovery: 6, hasCounter: true),
        summary: "Yoshi is a cheerful dinosaur from Yoshi's Island who has been Mario's faithful companion since infancy. Known for his incredibly long tongue and ability to turn enemies into eggs, Yoshi represents a unique blend of cuteness and combat effectiveness. His digestive system is remarkably versatile, allowing him to consume almost any enemy and convert them into projectile eggs or gain their abilities. As a member of the Yoshi species, he excels at aerial mobility thanks to his Flutter Jump technique, which has saved Mario countless times. Despite his gentle nature, Yoshi is a determined fighter who will do anything to protect his friends and his island home."
    )

    static let kirby = Character(
        id: "kirby",
        name: "Kirby",
        order: 6,
        world: .kirby,
        mainImage: Image(.kirbyMain),
        thumbnailImage: Image(.kirbyThumb),
        movesImage: Image(.kirbyMoves),
        skinImages: [
            Image(.kirbyMain1),
            Image(.kirbyMain2),
            Image(.kirbyMain3),
            Image(.kirbyMain4),
            Image(.kirbyMain5),
            Image(.kirbyMain6),
            Image(.kirbyMain7)
        ],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 4, longRange: 4, recovery: 5, hasCounter: false),
        summary: "Kirby is the legendary Star Warrior of Dream Land, whose innocent appearance belies his incredible power to copy abilities from his opponents. Despite being only eight inches tall, this pink powerhouse has saved Pop Star and the universe multiple times from threats like Nightmare and Dark Matter. His signature Copy Ability allows him to inhale enemies and steal their powers, making him one of the most adaptable fighters in existence. Beyond his combat abilities, Kirby is known for his bottomless appetite, pure heart, and unwavering bravery in the face of cosmic threats. His simple joy in helping others and protecting Dream Land has earned him many loyal friends throughout his adventures."
    )

    static let fox = Character(
        id: "fox",
        name: "Fox",
        order: 7,
        world: .starFox,
        mainImage: Image(.foxMain),
        thumbnailImage: Image(.foxThumb),
        movesImage: Image(.foxMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 7, longRange: 5, recovery: 3, hasCounter: true),
        summary: "Fox McCloud is the legendary leader of the Star Fox mercenary team and the most skilled pilot in the Lylat System. Following in his father James McCloud's footsteps, he commands the Great Fox and leads his team in high-stakes missions across the galaxy. His signature Arwing piloting skills translate into agile ground combat, utilizing his advanced technology like the reflector shield and blaster. Despite the loss of his father to betrayal, Fox maintains a strong moral compass and leads with unwavering determination. His close friendship with his team members, especially Falco Lombardi, has helped him overcome numerous challenges and defeat threats like Andross."
    )

    static let pikachu = Character(
        id: "pikachu",
        name: "Pikachu",
        order: 8,
        world: .pokemon,
        mainImage: Image(.pikachuMain),
        thumbnailImage: Image(.pikachuThumb),
        movesImage: Image(.pikachuMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 7, longRange: 4, recovery: 5, hasCounter: false),
        summary: "Pikachu is the beloved Electric-type Pokémon that has become the face of the entire Pokémon franchise. This energetic Mouse Pokémon is known for storing electricity in its cheek pouches and releasing powerful Thunder Shocks when excited or threatened. Despite its small size, Pikachu possesses incredible agility and electrical abilities that make it a formidable opponent in battle. Its loyalty to its trainers and friendly nature have made it one of the most popular Pokémon among trainers worldwide. While capable of evolving into Raichu with a Thunder Stone, many Pikachu, including the most famous one partnered with Ash Ketchum, choose to remain in their current form to prove their strength without evolution."
    )

    static let luigi = Character(
        id: "luigi",
        name: "Luigi",
        order: 9,
        world: .superMario,
        mainImage: Image(.luigiMain),
        thumbnailImage: Image(.luigiThumb),
        movesImage: Image(.luigiMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 3, recovery: 4, hasCounter: true),
        summary: "Luigi is Mario's younger twin brother, whose perpetual status as a sidekick belies his own heroic achievements and unique abilities. Despite his nervous disposition and fear of ghosts, Luigi has proven himself countless times as a capable hero, particularly in his ghost-hunting adventures in Luigi's Mansion. His distinctive high jumps and floaty movement style set him apart from his brother, while his Green Missile and Luigi Cyclone attacks make him unpredictable in combat. Though often living in Mario's shadow, Luigi's endearing personality, comic relief moments, and occasional bursts of unexpected bravery have earned him a devoted following among fans. His experience dealing with supernatural threats has given him a special expertise in handling paranormal enemies."
    )

    static let ness = Character(
        id: "ness",
        name: "Ness",
        order: 10,
        world: .earthBound,
        mainImage: Image(.nessMain),
        thumbnailImage: Image(.nessThumb),
        movesImage: Image(.nessMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 5, recovery: 3, hasCounter: false),
        summary: "Ness is a young psychic prodigy from Onett who became an unlikely hero in the quirky and profound EarthBound series. Armed with his trusty baseball bat and backpack, this ordinary boy possesses extraordinary PSI powers that he uses to protect Earth from cosmic threats. His journey from simple beginnings to saving the world showcases themes of friendship, courage, and the power of positive thinking. In battle, Ness utilizes a unique combination of PSI abilities like PK Fire and PK Thunder, along with his signature PSI Magnet that can absorb energy projectiles. His greatest power comes from his deep connections to his friends and family, which manifest in his devastating PK Starstorm ultimate attack."
    )

    static let captainFalcon = Character(
        id: "captainFalcon",
        name: "Captain Falcon",
        order: 11,
        world: .fZero,
        mainImage: Image(.capFalconMain),
        thumbnailImage: Image(.capFalconThumb),
        movesImage: Image(.captainFalconMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 7, longRange: 2, recovery: 4, hasCounter: true),
        summary: "Captain Falcon is the mysterious F-Zero champion racer and bounty hunter whose true identity remains a closely guarded secret. Pilot of the legendary Blue Falcon racing machine, he dominates the high-speed F-Zero Grand Prix circuit while maintaining his work as a law enforcer. His signature move, the Falcon Punch, has become legendary for its raw power and theatrical delivery. Despite his intimidating presence, he follows a strict code of honor and justice, often putting himself at risk to protect others. In combat, his incredible speed and powerful strikes make him a rush-down fighter who can quickly overwhelm opponents with his explosive fighting style."
    )

    static let jigglypuff = Character(
        id: "jigglypuff",
        name: "Jigglypuff",
        order: 12,
        world: .pokemon,
        mainImage: Image(.jigglypuffMain),
        thumbnailImage: Image(.jigglypuffThumb),
        movesImage: Image(.jigglypuffMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 4, longRange: 2, recovery: 5, hasCounter: false),
        summary: "Jigglypuff is a deceptively powerful Pokémon whose cute appearance masks its formidable fighting capabilities. Known as the Balloon Pokémon, it can inflate itself to float through the air and sing melodies that can instantly put opponents to sleep. While its lullaby is its most famous technique, experienced trainers fear its devastating Rest attack, which can turn a moment of apparent vulnerability into a powerful knockout blow. In the competitive battling scene, Jigglypuff has proven itself as an aerial combat specialist with exceptional control over the air space. Despite being one of the lightest fighters, its multiple jumps and ability to weave through the air make it a surprisingly resilient competitor."
    )

    static let peach = Character(
        id: "peach",
        name: "Princess Peach",
        order: 13,
        world: .superMario,
        mainImage: Image(.peachMain),
        thumbnailImage: Image(.peachThumb),
        movesImage: Image(.peachMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 4, longRange: 3, recovery: 6, hasCounter: true),
        summary: "Princess Peach is the beloved ruler of the Mushroom Kingdom, whose graceful exterior conceals surprising combat prowess and magical abilities. While often portrayed as a damsel in distress, Peach is a capable leader who has proven herself as both a skilled diplomat and fighter when needed. Her unique ability to float through the air gives her unprecedented control over battlefield positioning, while her arsenal includes magical attacks, her loyal Toad guards, and her signature frying pan. Beyond her fighting abilities, Peach's leadership has transformed the Mushroom Kingdom into a peaceful realm, though it remains a frequent target of Bowser's schemes. Her relationship with Mario has become legendary, though she's perfectly capable of handling adventures on her own."
    )

    static let daisy = Character(
        id: "daisy",
        name: "Princess Daisy",
        order: 13.1,
        world: .superMario,
        mainImage: Image(.daisyMain),
        thumbnailImage: Image(.daisyThumb),
        movesImage: Image(.daisyMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 4, longRange: 3, recovery: 6, hasCounter: true),
        summary: "Princess Daisy is the energetic and athletic ruler of Sarasaland, bringing a tomboyish charm to the royal lineage. Unlike her close friend Peach, Daisy is known for her more direct and sporty approach to both leadership and combat. First appearing as the damsel in distress in Super Mario Land, she has since established herself as a fierce competitor in various Mario sports titles and racing events. Her fighting style mirrors some of Peach's techniques but with her own unique flair, emphasizing powerful strikes and athletic prowess. While she may not command the same magical abilities as Peach, Daisy compensates with sheer determination and physical capability, making her a formidable opponent in her own right."
    )

    static let bowser = Character(
        id: "bowser",
        name: "Bowser",
        order: 14,
        world: .superMario,
        mainImage: Image(.bowserMain),
        thumbnailImage: Image(.bowserThumb),
        movesImage: Image(.bowserMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 7, speed: 2, longRange: 4, recovery: 4, hasCounter: false),
        summary: "Bowser, the King of the Koopas, is a towering force of nature whose immense strength and determination have made him Mario's most persistent adversary. Despite his fearsome appearance and frequent villainous schemes, Bowser has shown moments of complexity, particularly in his role as a caring father to Bowser Jr. and his occasional alliances with Mario against greater threats. His massive frame houses incredible strength and surprising agility, while his fire-breathing abilities and tough shell make him a defensive powerhouse. In battle, Bowser excels at close-range combat with powerful attacks that can shrug off smaller hits, though his large size makes him vulnerable to combos. His Flying Slam and Bowser Bomb moves are particularly feared for their devastating impact."
    )

    static let iceClimbers = Character(
        id: "iceClimbers",
        name: "Ice Climbers",
        order: 15,
        world: .retro,
        mainImage: Image(.iceClimbersMain),
        thumbnailImage: Image(.iceClimbersThumb),
        movesImage: Image(.iceClimbersMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 3, longRange: 3, recovery: 4, hasCounter: false),
        summary: "Popo and Nana, collectively known as the Ice Climbers, are a unique duo of mountaineering adventurers who work in perfect synchronization. Hailing from a remote village, these intrepid climbers brave treacherous peaks and harsh conditions in their quest to protect their homeland's vegetables from condor thieves. Their fighting style revolves around their perfect coordination, with both climbers attacking in tandem to create devastating combo opportunities. Armed with their trusty wooden mallets and ice-based abilities, they can create frozen platforms, launch ice blocks, and perform devastating synchronized attacks. While separated they become more vulnerable, their ability to protect and support each other makes them a formidable team that exemplifies the power of cooperation."
    )

    static let sheik = Character(
        id: "sheik",
        name: "Sheik",
        order: 16,
        world: .zelda,
        mainImage: Image(.sheikMain),
        thumbnailImage: Image(.sheikThumb),
        movesImage: Image(.sheikMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 7, longRange: 4, recovery: 4, hasCounter: true),
        summary: "Sheik is the mysterious alter ego of Princess Zelda, a master of the ancient Sheikah arts of stealth and combat. Created to hide from Ganondorf's forces during his seven-year reign in Ocarina of Time, Sheik combines ninja-like agility with powerful magic and combat techniques. Their arsenal includes needle projectiles, smoke bombs, and the ability to vanish instantly, making them a nightmare for opponents to pin down. In battle, Sheik excels at swift, precise strikes and rapid combos that can quickly overwhelm unprepared opponents. While physically less powerful than many fighters, their mastery of Sheikah techniques and incredible speed make them one of the most technically sophisticated combatants in the roster."
    )

    static let zelda = Character(
        id: "zelda",
        name: "Zelda",
        order: 17,
        world: .zelda,
        mainImage: Image(.zeldaMain),
        thumbnailImage: Image(.zeldaThumb),
        movesImage: Image(.zeldaMoves),
        skinImages: [
            Image(.zeldaMain1),
            Image(.zeldaMain2),
            Image(.zeldaMain3),
            Image(.zeldaMain4),
            Image(.zeldaMain5),
            Image(.zeldaMain6),
            Image(.zeldaMain7)
        ],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 5, recovery: 4, hasCounter: true),
        summary: "Princess Zelda is the wise and powerful ruler of Hyrule, bearing the Triforce of Wisdom and serving as the mortal incarnation of the Goddess Hylia. Throughout countless generations, she has guided Hyrule through periods of peace and turmoil, often working alongside Link to protect her kingdom from Ganon's evil influence. Her mastery of ancient magic manifests in powerful spells like Din's Fire, Farore's Wind, and Nayru's Love, named after the three Golden Goddesses. In battle, Zelda combines elegant magical attacks with devastating finishing moves like her Lightning Kicks and Phantom Slash. While she possesses great magical power, her true strength lies in her wisdom and courage to sacrifice everything to protect her people."
    )

    static let drMario = Character(
        id: "drMario",
        name: "Dr. Mario",
        order: 18,
        world: .superMario,
        mainImage: Image(.drmarioMain),
        thumbnailImage: Image(.drMarioThumb),
        movesImage: Image(.drMarioMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 4, longRange: 3, recovery: 4, hasCounter: true),
        summary: "Dr. Mario represents Mario's medical alter ego, trading his plumbing tools for a physician's coat and virus-busting capsules. After discovering a dangerous virus outbreak in the Mushroom Kingdom, he developed his signature Megavitamins to combat the spreading infection. His fighting style is similar to Mario's but with more powerful attacks at the cost of mobility, reflecting his more methodical, scientific approach. The Megavitamins he throws have unique properties that can disorient opponents, while his Dr. Tornado and Super Sheet attacks show his adaptation of medical knowledge to combat. Despite his serious profession, Dr. Mario maintains the same determined and cheerful personality that makes him a beloved figure in both medical and fighting circles."
    )

    static let pichu = Character(
        id: "pichu",
        name: "Pichu",
        order: 19,
        world: .pokemon,
        mainImage: Image(.pichuMain),
        thumbnailImage: Image(.pichuThumb),
        movesImage: Image(.pichuMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 7, longRange: 3, recovery: 4, hasCounter: false),
        summary: "Pichu is the baby pre-evolved form of Pikachu, whose incredible electrical power comes at a cost to itself. As a young and not fully developed Pokémon, Pichu hasn't yet learned to control its electrical discharges, causing it to hurt itself when using electric attacks. Despite this drawback, its tiny size and incredible speed make it an unpredictable opponent. Pichu's determination to prove itself worthy despite its youth is reflected in its reckless but powerful fighting style. While its electrical attacks may be unstable, they're actually more powerful than Pikachu's, though the self-damage makes them risky to use. Its playful nature and cute appearance belie its potential as a high-risk, high-reward fighter."
    )

    static let falco = Character(
        id: "falco",
        name: "Falco",
        order: 20,
        world: .starFox,
        mainImage: Image(.falcoMain),
        thumbnailImage: Image(.falcoThumb),
        movesImage: Image(.falcoMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 6, longRange: 5, recovery: 4, hasCounter: true),
        summary: "Falco Lombardi is Star Fox team's ace pilot, known for his cocky attitude and unmatched aerial prowess. A former gang member turned elite pilot, Falco's complicated friendship with Fox McCloud is marked by rivalry and deep mutual respect. His fighting style emphasizes aerial combat and quick strikes, with his enhanced jumping ability and unique Falco Phantasm making him especially dangerous in the air. While sharing some moves with Fox, Falco's versions are typically more powerful but slower, reflecting his more aggressive personality. Despite his sometimes aloof demeanor, Falco's loyalty to the Star Fox team is unwavering, though he occasionally strikes out on his own to pursue solo missions."
    )

    static let marth = Character(
        id: "marth",
        name: "Marth",
        order: 21,
        world: .fireEmblem,
        mainImage: Image(.marthMain),
        thumbnailImage: Image(.marthThumb),
        movesImage: Image(.marthMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 6, longRange: 4, recovery: 4, hasCounter: true),
        summary: "Marth is the legendary Hero-King of Altea and the original Lord of the Fire Emblem series. As the first prince to wield the divine blade Falchion, he led his people from exile to reclaim his kingdom and unite the continent of Archanea. His fighting style emphasizes precise swordplay, with his blade being most powerful at its tip - a technique that has influenced swordsmen for generations. Despite facing betrayal and loss, Marth's unwavering compassion and leadership abilities have made him a symbol of hope and justice. His legacy as a warrior-king who prioritized diplomacy and peace has influenced countless heroes in the Fire Emblem universe."
    )

    static let lucina = Character(
        id: "lucina",
        name: "Lucina",
        order: 21.1,
        world: .fireEmblem,
        mainImage: Image(.lucinaMain),
        thumbnailImage: Image(.lucinaThumb),
        movesImage: Image(.lucinaMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 6, longRange: 4, recovery: 4, hasCounter: true),
        summary: "Lucina is a determined warrior princess from a doomed future timeline, who traveled to the past to prevent catastrophe. As the daughter of Chrom and descendant of Marth, she initially disguised herself as the Hero-King to inspire hope in a world ravaged by the fell dragon Grima. Her fighting style mirrors Marth's techniques, but with more consistent power along her blade's length, making her more accessible but equally deadly. Despite carrying the burden of her apocalyptic future, Lucina maintains an unwavering determination to protect those she loves. Her strong sense of justice and dedication to changing fate have earned her a place among the most respected warriors in the Fire Emblem series."
    )

    static let youngLink = Character(
        id: "youngLink",
        name: "Young Link",
        order: 22,
        world: .zelda,
        mainImage: Image(.youngLinkMain),
        thumbnailImage: Image(.youngLinkThumb),
        movesImage: Image(.youngLinkMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 5, longRange: 6, recovery: 3, hasCounter: true),
        summary: "Young Link represents the Hero of Time during his adventures in Ocarina of Time and Majora's Mask, capturing the essence of a courageous child thrust into epic quests. Despite his age, he possesses incredible skill with the Kokiri Sword and various magical items from his journeys. His experiences traveling between timelines and facing the darkness in Termina have given him wisdom beyond his years. In battle, Young Link combines quick sword strikes with a versatile arsenal of weapons, including his Hookshot, Bombs, and Fire Arrows. His smaller size makes him more agile than his adult counterpart, though his attacks are naturally less powerful. The weight of saving multiple worlds at such a young age has shaped him into a unique hero."
    )

    static let ganondorf = Character(
        id: "ganondorf",
        name: "Ganondorf",
        order: 23,
        world: .zelda,
        mainImage: Image(.ganondorfMain),
        thumbnailImage: Image(.ganondorfThumb),
        movesImage: Image(.ganondorfMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 7, speed: 2, longRange: 3, recovery: 3, hasCounter: true),
        summary: "Ganondorf, the King of Evil and wielder of the Triforce of Power, is the immortal arch-nemesis of Link and Zelda across countless generations. Originally the king of the Gerudo tribe, his insatiable lust for power led him to become one of the most fearsome villains in history. His fighting style emphasizes raw power and dark magic, with each attack carrying devastating force but requiring precise timing to land. Despite his brutish appearance, Ganondorf is a brilliant tactician and powerful sorcerer who has repeatedly come close to conquering Hyrule. His ability to transform into the monstrous Ganon and survive across ages makes him an eternal threat to peace in the kingdom."
    )

    static let mewtwo = Character(
        id: "mewtwo",
        name: "Mewtwo",
        order: 24,
        world: .pokemon,
        mainImage: Image(.mewtwoMain),
        thumbnailImage: Image(.mewtwoThumb),
        movesImage: Image(.mewtwoMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 6, longRange: 5, recovery: 5, hasCounter: false),
        summary: "Mewtwo is a genetically engineered Pokémon created from Mew's DNA, whose immense psychic powers are matched only by its complex existential struggles. Born in a laboratory and initially filled with anger at its creation, Mewtwo has evolved from a vengeful being to one seeking to understand its place in the world. Its combat style relies heavily on powerful psychic abilities, using telekinesis to control both itself and its opponents. While physically frail, Mewtwo's mental powers allow it to fight effectively at any range, with its Shadow Ball and Confusion attacks being particularly feared. Despite its artificial origins, Mewtwo has developed a deep philosophical understanding of life and purpose, making it one of the most intellectually sophisticated fighters in the roster."
    )

    static let roy = Character(
        id: "roy",
        name: "Roy",
        order: 25,
        world: .fireEmblem,
        mainImage: Image(.royMain),
        thumbnailImage: Image(.royThumb),
        movesImage: Image(.royMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 6, longRange: 4, recovery: 3, hasCounter: true),
        summary: "Roy is the young lord of Pherae who was thrust into leadership during a time of continental warfare in Fire Emblem: The Binding Blade. Despite his inexperience, he possesses a natural talent for leadership and wields the legendary Binding Blade, a sword that burns with powerful flames. His fighting style emphasizes aggressive swordplay, with his attacks being most powerful at the base of his blade where the flames are most intense. Though sometimes doubting his abilities, Roy's determination to protect his homeland and allies drives him to overcome any challenge. His tactical mind and fiery fighting style have earned him the respect of both allies and enemies."
    )

    static let chrom = Character(
        id: "chrom",
        name: "Chrom",
        order: 25.1,
        world: .fireEmblem,
        mainImage: Image(.chromMain),
        thumbnailImage: Image(.chromThumb),
        movesImage: Image(.chromMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 6, longRange: 4, recovery: 3, hasCounter: true),
        summary: "Chrom is the noble prince of Ylisse and leader of the Shepherds, a militia dedicated to protecting the peace. As a descendant of the Hero-King Marth, he wields the legendary sword Falchion with his own unique style. Unlike his ancestors, Chrom's technique focuses on raw power and decisive strikes, reflecting his straightforward and honest personality. His leadership style emphasizes the bonds between companions, believing that true strength comes from unity. Despite facing personal losses and betrayals, Chrom's unwavering faith in his allies and his determination to create a peaceful future have made him a legendary figure in his own right."
    )

    static let mrGameAndWatch = Character(
        id: "mrGameAndWatch",
        name: "Mr. Game & Watch",
        order: 26,
        world: .gameAndWatch,
        mainImage: Image(.mrGameAndWatchMain),
        thumbnailImage: Image(.mrGameAndWatchThumb),
        movesImage: Image(.mrGameWatchMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 5, longRange: 4, recovery: 4, hasCounter: false),
        summary: "Mr. Game & Watch is a mysterious entity representing Nintendo's earliest handheld gaming era, existing as a two-dimensional being in a three-dimensional world. This unique character draws his moves from various LCD games of the 1980s, making him one of the most unconventional fighters in the roster. His flat nature allows him to perform bizarre movements and attacks that defy normal physics, while his Judge hammer and bucket moves can lead to unexpected reversals. Despite his simple appearance, Mr. Game & Watch's unpredictable nature and ability to generate random powerful effects make him a wild card in any match. His existence serves as a living tribute to Nintendo's pioneering days in electronic gaming."
    )

    static let metaKnight = Character(
        id: "metaKnight",
        name: "Meta Knight",
        order: 27,
        world: .kirby,
        mainImage: Image(.metaKnightMain),
        thumbnailImage: Image(.metaKnightThumb),
        movesImage: Image(.metaKnightMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 6, longRange: 3, recovery: 5, hasCounter: false),
        summary: "Meta Knight is the enigmatic warrior from Dream Land whose strict code of honor and masterful swordsmanship have earned him respect throughout the galaxy. Though sometimes appearing as Kirby's rival or antagonist, he operates on a complex moral code that often leads him to help heroes when truly needed. His combat style emphasizes lightning-fast sword techniques and aerial mastery, using his cape to teleport and his wings to recover from any situation. Beneath his mask lies a face similar to Kirby's, though he rarely reveals it, preferring to maintain his mysterious persona. His leadership of the Meta-Knights and possession of the legendary ship Halberd make him a powerful figure in Dream Land's politics and conflicts."
    )

    static let pit = Character(
        id: "pit",
        name: "Pit",
        order: 28,
        world: .kidIcarus,
        mainImage: Image(.pitMain),
        thumbnailImage: Image(.pitThumb),
        movesImage: Image(.pitMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 5, longRange: 5, recovery: 5, hasCounter: true),
        summary: "Pit is the optimistic captain of Palutena's guard and an angel warrior who serves as Skyworld's primary defender. Despite being unable to fly on his own for extended periods, his sacred bow, granted by Palutena, splits into dual blades for both ranged and close combat. His unwavering loyalty and cheerful personality mask a fierce determination to protect both the heavens and the human world below. In battle, Pit combines aerial mobility with versatile weapon techniques, using his Guardian Orbitars for defense and his Upperdash Arm for powerful strikes. Though sometimes naive, his pure heart and dedication to justice have helped him overcome gods and demons alike."
    )

    static let darkPit = Character(
        id: "darkPit",
        name: "Dark Pit",
        order: 28.1,
        world: .kidIcarus,
        mainImage: Image(.darkPitMain),
        thumbnailImage: Image(.darkPitThumb),
        movesImage: Image(.darkPitMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 5, longRange: 5, recovery: 5, hasCounter: true),
        summary: "Dark Pit, also known as Pittoo, emerged as a flawed clone of Pit from the Mirror of Truth, but quickly developed his own distinct identity. Unlike his counterpart's unwavering loyalty to Palutena, Dark Pit fiercely values his independence and follows his own moral compass. His fighting style mirrors Pit's techniques but with darker energy and slightly different properties, reflecting his more aggressive and direct personality. While initially antagonistic, he has grown to reluctantly cooperate with Pit when greater threats emerge. His Silver Bow possesses different properties from Pit's, and his autonomous nature means he fights for his own reasons rather than at the behest of the gods."
    )

    static let zeroSuitSamus = Character(
        id: "zeroSuitSamus",
        name: "Zero Suit Samus",
        order: 29,
        world: .metroid,
        mainImage: Image(.zeroSuitSamusMain),
        thumbnailImage: Image(.zeroSuitSamusThumb),
        movesImage: Image(.zeroSuitSamusMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 6, longRange: 3, recovery: 5, hasCounter: false),
        summary: "Zero Suit Samus represents the legendary bounty hunter without her iconic Power Suit, showcasing her incredible athletic abilities and combat training. Raised by the Chozo and hardened by countless battles, she is just as deadly without her armor as she is within it. Her Paralyzer pistol and Jet Boots provide unique combat options, while her acrobatic skills and plasma whip make her a nightmare to pin down. Though more vulnerable without her Power Suit, her speed and agility increase dramatically, allowing her to execute lightning-fast combinations and precise strikes. Her years of combat experience and Chozo training are evident in every movement, making her one of the most technically skilled fighters in the roster."
    )

    static let wario = Character(
        id: "wario",
        name: "Wario",
        order: 30,
        world: .wario,
        mainImage: Image(.warioMain),
        thumbnailImage: Image(.warioThumb),
        movesImage: Image(.warioMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 4, longRange: 2, recovery: 4, hasCounter: false),
        summary: "Wario is the greedy, garlic-loving anti-hero whose pursuit of wealth is matched only by his bizarre fighting style and surprising strength. As both Mario's rival and a successful entrepreneur through WarioWare Inc., he has built his own identity beyond being merely an antagonist. His unorthodox combat approach includes using his massive jaw and belly as weapons, along with his signature Wario Waft technique that turns his gluttony into explosive power. Despite his crude manners and selfish motivations, Wario's determination and bizarrely effective fighting style have earned him a dedicated following. His motorcycle-riding skills and ability to use his own body in outlandish ways make him an unpredictable opponent."
    )

    static let snake = Character(
        id: "snake",
        name: "Snake",
        order: 31,
        world: .metalGear,
        mainImage: Image(.snakeMain),
        thumbnailImage: Image(.snakeThumb),
        movesImage: Image(.snakeMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 3, longRange: 7, recovery: 3, hasCounter: false),
        summary: "Solid Snake is the legendary special operations soldier from the Metal Gear series, bringing tactical espionage action to the battlefield. Trained in CQC (Close Quarters Combat) by Big Boss himself, Snake combines military expertise with an extensive arsenal of explosives and gadgets. His fighting style emphasizes strategic weapon placement and careful spacing, using grenades, missiles, and his signature cardboard box for both combat and deception. Despite his gruff exterior, Snake possesses a strong moral code and deep philosophical understanding of warfare. His tactical genius allows him to turn any battlefield position to his advantage, making him a fearsome opponent who excels at controlling space and punishing approaches."
    )

    static let ike = Character(
        id: "ike",
        name: "Ike",
        order: 32,
        world: .fireEmblem,
        mainImage: Image(.ikeMain),
        thumbnailImage: Image(.ikeThumb),
        movesImage: Image(.ikeMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 3, longRange: 4, recovery: 3, hasCounter: true),
        summary: "Ike is the legendary Radiant Hero who rose from leadership of a small mercenary band to become the savior of two continents. Unlike most Fire Emblem lords, Ike comes from common origins and earned his reputation through pure skill and determination rather than birthright. His fighting style emphasizes raw power over finesse, wielding the blessed sword Ragnell with devastating two-handed strikes. His signature Aether technique combines both offense and recovery, showcasing the skills that made him one of the most renowned swordsmen in Fire Emblem history. Despite his incredible strength and fame, Ike maintains his straightforward, honest nature and fights for his ideals of equality rather than glory."
    )

    static let squirtle = Character(
        id: "squirtle",
        name: "Squirtle",
        order: 33,
        world: .pokemon,
        mainImage: Image(.pokemonTrainerMain),
        thumbnailImage: Image(.pokemonTrainerThumb),
        movesImage: Image(.ptSquirtleMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 6, longRange: 3, recovery: 4, hasCounter: false),
        summary: "Squirtle is the playful Water-type starter Pokémon whose small size belies its impressive combat capabilities. As part of the Pokémon Trainer's team, this tiny turtle combines agile movements with powerful water attacks. Its shell provides both defensive options and offensive possibilities, allowing it to withdraw for protection or spin rapidly for attacking. In battle, Squirtle excels at quick combos and edge-guarding with its Water Gun, while its shell spin attacks can catch opponents off guard. Though the smallest member of the Trainer's team, its versatility and maneuverability make it crucial for handling fast-paced matchups."
    )

    static let ivysaur = Character(
        id: "ivysaur",
        name: "Ivysaur",
        order: 34,
        world: .pokemon,
        mainImage: Image(.pokemonTrainerMain),
        thumbnailImage: Image(.pokemonTrainerThumb),
        movesImage: Image(.ptIvysaur),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 6, recovery: 3, hasCounter: false),
        summary: "Ivysaur represents the perfect balance of power and technique as the evolution of Bulbasaur and part of the Pokémon Trainer's team. This Grass/Poison-type Pokémon uses its versatile vine whips and razor-sharp leaves to control space and set up powerful combinations. Its large bulb stores solar energy that can be released in devastating Solar Beam attacks, while its Vine Whip provides both offensive pressure and recovery options. As the middle evolution, Ivysaur combines the agility of its pre-evolved form with the power of its final form, making it an excellent all-rounder. Its ability to control space with various projectiles and mid-range attacks makes it particularly effective at maintaining advantageous positions."
    )

    static let charizard = Character(
        id: "charizard",
        name: "Charizard",
        order: 35,
        world: .pokemon,
        mainImage: Image(.pokemonTrainerMain),
        thumbnailImage: Image(.pokemonTrainerThumb),
        movesImage: Image(.ptCharizard),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 4, longRange: 4, recovery: 5, hasCounter: false),
        summary: "Charizard is the powerful Fire/Flying-type final evolution that serves as the Pokémon Trainer's heavy hitter. This proud dragon-like Pokémon combines raw power with surprising aerial mobility, using its wings to maneuver and its fierce flames to overwhelm opponents. Its Fire Breath can create walls of flame for zone control, while its Flare Blitz represents a high-risk, high-reward offensive option. As the most physically imposing member of the Trainer's team, Charizard excels at securing knockouts with its powerful aerial attacks and flame-enhanced strikes. Despite its intimidating appearance, it maintains a strong bond with its Trainer, showcasing the deep connection between Pokémon and human."
    )
/*
    static let pokemonTrainer = Character(
        id: "pokemonTrainer",
        name: "The Pokémon Trainer",
        order: 33,
        world: .pokemon,
        mainImage: Image(.pokemonTrainerMain),
        thumbnailImage: Image(.pokemonTrainerThumb),
        movesImage: Image(.pokemonTrainerMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 4, longRange: 5, recovery: 4, hasCounter: false),
        summary: "The Pokémon Trainer represents the heart of the Pokémon series, showcasing the bond between trainer and Pokémon through strategic team management. Commanding Squirtle, Ivysaur, and Charizard, the Trainer must master the art of switching between Pokémon to adapt to any situation. Each Pokémon offers unique strengths: Squirtle's agility, Ivysaur's spacing control, and Charizard's raw power. The Trainer's true skill lies in knowing when to deploy each Pokémon, making them one of the most technically demanding but rewarding characters to master. This fighting style perfectly embodies the strategic depth of Pokémon battles, where adaptation and timing are just as important as raw power."
    )
*/
    static let diddyKong = Character(
        id: "diddyKong",
        name: "Diddy Kong",
        order: 36,
        world: .donkeyKong,
        mainImage: Image(.diddyKongMain),
        thumbnailImage: Image(.diddyKongThumb),
        movesImage: Image(.diddyKongMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 6, longRange: 5, recovery: 5, hasCounter: false),
        summary: "Diddy Kong is Donkey Kong's energetic nephew and faithful sidekick, known for his acrobatic prowess and technological ingenuity. Armed with his signature peanut popgun and jetpack barrel, he combines agile movements with tricky projectile play. Despite his small size, Diddy has proven himself a hero in his own right, having saved DK Island multiple times from King K. Rool's schemes. His fighting style emphasizes quick attacks and aerial mobility, using his monkey flips and banana peels to create advantageous situations. While not as physically powerful as his uncle, Diddy's speed and versatility make him a formidable opponent who can quickly overwhelm unprepared fighters."
    )

    static let lucas = Character(
        id: "lucas",
        name: "Lucas",
        order: 37,
        world: .earthBound,
        mainImage: Image(.lucasMain),
        thumbnailImage: Image(.lucasThumb),
        movesImage: Image(.lucasMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 5, recovery: 4, hasCounter: false),
        summary: "Lucas is a young psychic from Tazmily Village whose tragic past has forged him into a reluctant hero. After losing his mother and experiencing his brother's disappearance, he developed powerful PSI abilities through emotional trauma and personal growth. His fighting style features unique PSI attacks that differ from Ness's, including the freezing PK Freeze and the powerful PK Love. Despite his initially timid nature, Lucas's journey has made him incredibly resilient, reflected in his strong defensive options and powerful smash attacks. His rope snake provides unique grab opportunities, while his PSI magnet can absorb and heal from energy-based attacks."
    )

    static let sonic = Character(
        id: "sonic",
        name: "Sonic",
        order: 38,
        world: .sonic,
        mainImage: Image(.sonicMain),
        thumbnailImage: Image(.sonicThumb),
        movesImage: Image(.sonicMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 7, longRange: 2, recovery: 4, hasCounter: false),
        summary: "Sonic the Hedgehog is the fastest thing alive, a free-spirited hero whose cocky attitude is matched only by his incredible speed and determination to thwart Dr. Robotnik's schemes. His signature Spin Dash and Homing Attack make him a blur of motion on the battlefield, capable of striking from unexpected angles with lightning-fast combos. As SEGA's mascot, Sonic has saved his world countless times from mechanization and chaos, always maintaining his love for adventure and freedom. His fighting style emphasizes constant motion and hit-and-run tactics, though his speed can be both a blessing and a curse when precision is required."
    )

    static let kingDedede = Character(
        id: "kingDedede",
        name: "King Dedede",
        order: 39,
        world: .kirby,
        mainImage: Image(.kingDededeMain),
        thumbnailImage: Image(.kingDededeThumb),
        movesImage: Image(.kingDededeMoves),
        skinImages: [
            Image(.kingDededeMain1),
            Image(.kingDededeMain2),
            Image(.kingDededeMain3),
            Image(.kingDededeMain4),
            Image(.kingDededeMain5),
            Image(.kingDededeMain6),
            Image(.kingDededeMain7)
        ],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 2, longRange: 5, recovery: 5, hasCounter: false),
        summary: "King Dedede is the self-proclaimed ruler of Dream Land whose rivalry with Kirby often masks a deeper sense of responsibility for his kingdom. Though initially portrayed as an antagonist, he has frequently allied with Kirby to face greater threats to Pop Star. His massive hammer and ability to inhale enemies mirror Kirby's powers, while his Super Dedede Jump can create devastating shockwaves. Despite his rotund appearance, Dedede is surprisingly agile in the air thanks to his ability to puff up and float. His fighting style combines powerful hammer strikes with projectile pressure through his Waddle Dees, making him a formidable heavyweight fighter."
    )

    static let olimar = Character(
        id: "olimar",
        name: "Olimar",
        order: 40,
        world: .pikmin,
        mainImage: Image(.olimarMain),
        thumbnailImage: Image(.olimarThumb),
        movesImage: Image(.olimarMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 4, longRange: 6, recovery: 3, hasCounter: false),
        summary: "Captain Olimar is a tiny but resourceful space explorer from Hocotate Freight who discovered the mysterious Pikmin species during an emergency landing. His unique fighting style revolves around commanding different types of Pikmin, each with their own special properties: Red for power, Blue for throws, Yellow for electricity, White for speed, and Purple for weight. Despite being only a few centimeters tall, Olimar's strategic mind and bond with the Pikmin allow him to overcome much larger opponents. His success in battle depends entirely on careful Pikmin management and understanding how to utilize each type's strengths."
    )

    static let lucario = Character(
        id: "lucario",
        name: "Lucario",
        order: 41,
        world: .pokemon,
        mainImage: Image(.lucarioMain),
        thumbnailImage: Image(.lucarioThumb),
        movesImage: Image(.lucarioMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 5, longRange: 4, recovery: 4, hasCounter: true),
        summary: "Lucario is the Aura Pokémon whose mastery of aura energy allows it to sense thoughts and emotions while powering its fighting abilities. Its unique mechanic of becoming stronger at higher damage percentages makes it increasingly dangerous as battles progress. Combining Fighting and Steel-type attributes, Lucario's martial arts prowess is enhanced by its ability to manipulate aura into powerful spheres and focused attacks. Its ability to read opponents' auras gives it an almost precognitive combat sense, while its Extreme Speed move provides both recovery and approach options. The more damage Lucario takes, the more its aura-based attacks grow in both size and power."
    )

    static let rob = Character(
        id: "rob",
        name: "R.O.B.",
        order: 42,
        world: .retro,
        mainImage: Image(.robMain),
        thumbnailImage: Image(.robThumb),
        movesImage: Image(.robMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 3, longRange: 6, recovery: 5, hasCounter: false),
        summary: "R.O.B. (Robotic Operating Buddy) is a unique fighter who originated as a real-world Nintendo Entertainment System accessory before becoming a digital warrior. This sophisticated robot combines powerful projectiles from its Robo Beam with devastating spin attacks using its gyroscopic base. Despite its mechanical nature, R.O.B. shows surprising personality through its movements and victory celebrations. Its fighting style emphasizes careful resource management of both its beam charge and gyro spin, while its rocket boosters provide excellent recovery options. As the last of its kind, R.O.B. fights to prove the worth of its obsolete but determined series."
    )

    static let toonLink = Character(
        id: "toonLink",
        name: "Toon Link",
        order: 43,
        world: .zelda,
        mainImage: Image(.toonLinkMain),
        thumbnailImage: Image(.toonLinkThumb),
        movesImage: Image(.toonLinkMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 5, longRange: 6, recovery: 4, hasCounter: true),
        summary: "Toon Link represents the Hero of Winds, a young incarnation of Link who sailed the Great Sea to save his sister and defeat Ganondorf. His cel-shaded appearance reflects the more whimsical nature of his adventures, though his courage and determination remain unchanged. His fighting style emphasizes quick sword strikes and masterful use of tools like the Hero's Bow, Bombs, and Boomerang. While smaller and physically weaker than his other incarnations, Toon Link's agility and expressive animations make him uniquely suited for combining projectile pressure with swift close-range combat. His cartoon styling allows for more exaggerated movements that can catch opponents off guard."
    )

    static let wolf = Character(
        id: "wolf",
        name: "Wolf",
        order: 44,
        world: .starFox,
        mainImage: Image(.wolfMain),
        thumbnailImage: Image(.wolfThumb),
        movesImage: Image(.wolfMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 5, longRange: 4, recovery: 3, hasCounter: true),
        summary: "Wolf O'Donnell is the cunning leader of Star Wolf and Fox McCloud's longtime rival, whose brutal efficiency in combat matches his mercenary lifestyle. Unlike Fox's more honorable approach, Wolf embraces a ruthless fighting style that emphasizes powerful claw strikes and aggressive pressure. His modified Blaster fires slower but more powerful shots, while his Wolf Flash provides both offensive mix-ups and recovery options. Despite his antagonistic relationship with Star Fox, Wolf operates by a strict code of honor and occasionally allies with his rivals when greater threats emerge. His fighting style rewards aggressive play and reading opponents' defensive habits."
    )

    static let villager = Character(
        id: "villager",
        name: "Villager",
        order: 45,
        world: .animalCrossing,
        mainImage: Image(.villagerMain),
        thumbnailImage: Image(.villagerThumb),
        movesImage: Image(.villagerMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 5, recovery: 6, hasCounter: false),
        summary: "The Villager brings the peaceful life of Animal Crossing into battle with a unique arsenal of everyday tools turned weapons. As the mayor of their town, they utilize everything from gardening equipment to home renovation tools in surprisingly effective ways. Their ability to pocket and return projectiles adds an unexpected layer of complexity to their seemingly innocent appearance. The Villager's fighting style includes planting and growing trees for strategic advantage, using balloons for recovery, and launching rockets from their slingshot. Despite their peaceful origins, the Villager's creative use of mundane items makes them an unpredictable and versatile fighter."
    )

    static let megaman = Character(
        id: "megaman",
        name: "Mega Man",
        order: 46,
        world: .megaMan,
        mainImage: Image(.megaManMain),
        thumbnailImage: Image(.megaManThumb),
        movesImage: Image(.megaManMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 7, recovery: 4, hasCounter: false),
        summary: "Mega Man, the Blue Bomber, is Dr. Light's creation who fights for everlasting peace against Dr. Wily's robot army. His unique fighting style incorporates weapons and abilities copied from defeated Robot Masters throughout his many adventures. His Mega Buster arm cannon provides consistent ranged pressure, while his Variable Weapon System allows him to deploy a variety of special weapons like Metal Blade and Leaf Shield. Despite being a robot, Mega Man's strong sense of justice and determination to protect humanity have made him a legendary hero. His fighting style emphasizes projectile control and adaptation, true to his ability to learn from defeated opponents."
    )

    static let wiiFitTrainer = Character(
        id: "wiiFitTrainer",
        name: "Wii Fit Trainer",
        order: 47,
        world: .mii,
        mainImage: Image(.wiiFitTrainerMain),
        thumbnailImage: Image(.wiiFitTrainerThumb),
        movesImage: Image(.wiiFitTrainerMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 5, longRange: 4, recovery: 4, hasCounter: false),
        summary: "The Wii Fit Trainer brings health and wellness to the battlefield, transforming yoga poses and exercise routines into surprisingly effective combat moves. Their unique fighting style emphasizes proper posture and breathing techniques, channeling the power of fitness into powerful strikes and projectiles. The Sun Salutation charge move represents their ability to focus energy, while their Header can reflect projectiles. Despite their unorthodox origin, the Trainer's dedication to physical fitness translates into a precise and technical fighting style that rewards proper spacing and timing. Their Deep Breathing technique can temporarily boost their power and speed, encouraging strategic buff management."
    )

    static let rosalina = Character(
        id: "rosalina",
        name: "Rosalina & Luma",
        order: 48,
        world: .superMario,
        mainImage: Image(.rosalinaMain),
        thumbnailImage: Image(.rosalinaThumb),
        movesImage: Image(.rosalinaMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 3, longRange: 6, recovery: 5, hasCounter: false),
        summary: "Rosalina is the mysterious guardian of the Cosmos who travels the universe with her Luma companions, watching over the galaxies. Her unique tag-team fighting style with Luma allows for complex setups and devastating combinations that can control large portions of the stage. As the adopted mother of the Lumas, her moves reflect both her cosmic powers and her protective nature. Her ability to fight independently while commanding Luma creates unique offensive and defensive opportunities, though losing Luma temporarily weakens her options. Despite her serene demeanor, Rosalina's mastery over gravitational forces and her synchronized attacks with Luma make her one of the most technically sophisticated fighters."
    )

    static let littleMac = Character(
        id: "littleMac",
        name: "Little Mac",
        order: 49,
        world: .punchOut,
        mainImage: Image(.littleMacMain),
        thumbnailImage: Image(.littleMacThumb),
        movesImage: Image(.littleMacMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 6, longRange: 1, recovery: 1, hasCounter: true),
        summary: "Little Mac is the determined underdog boxer from the Bronx whose incredible ground game and lightning-fast punches make him a terror on the canvas. Trained by Doc Louis and hardened by countless battles against larger opponents, Mac's fighting style emphasizes footwork, counter-punching, and devastating knockout blows. His Power Meter mechanic builds up to unleash the devastating KO Punch, capable of ending stocks early. While nearly unstoppable on the ground with the fastest attacks in the game, his poor air game and recovery make him a true glass cannon. Mac's story of rising from amateur to champion resonates in his high-risk, high-reward playstyle."
    )

    static let greninja = Character(
        id: "greninja",
        name: "Greninja",
        order: 50,
        world: .pokemon,
        mainImage: Image(.greninjaMain),
        thumbnailImage: Image(.greninjaThumb),
        movesImage: Image(.greninjaMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 7, longRange: 4, recovery: 4, hasCounter: true),
        summary: "Greninja is the fully evolved form of Froakie, a ninja-like Water/Dark-type Pokémon whose mastery of water manipulation and stealth techniques makes it a deadly combatant. Its ability to create water weapons like shurikens and katanas combines with incredible speed and agility to create a true ninja experience. The Substitute technique allows for clever defensive options, while its Water Shuriken can be charged for varying degrees of power. Despite being a water type, Greninja's fighting style emphasizes close-range combat and swift punishes, using its projectiles primarily to create openings. Its Battle Bond ability is represented by its powerful aerial combos and mix-up potential."
    )

    static let miiSwordfighter = Character(
        id: "miiSwordfighter",
        name: "Mii Swordfighter",
        order: 51,
        world: .mii,
        mainImage: Image(.miiSwordfighterMain),
        thumbnailImage: Image(.miiSwordfighterThumb),
        movesImage: Image(.miiSwordMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 5, longRange: 4, recovery: 4, hasCounter: true),
        summary: "Mii Swordfighter is a character from the Mii series. He is known for his swordsmanship."
    )

    static let miiBrawler = Character(
        id: "miiBrawler",
        name: "Mii Brawler",
        order: 52,
        world: .mii,
        mainImage: Image(.miiBrawlerMain),
        thumbnailImage: Image(.miiBrawlerThumb),
        movesImage: Image(.miiBrawlerMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 6, longRange: 2, recovery: 4, hasCounter: true),
        summary: "Mii Brawler is a character from the Mii series. He is known for his fighting skills."
    )

    static let miiGunner = Character(
        id: "miiGunner",
        name: "Mii Gunner",
        order: 53,
        world: .mii,
        mainImage: Image(.miiGunnerMain),
        thumbnailImage: Image(.miiGunnerThumb),
        movesImage: Image(.miiGunnerMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 4, longRange: 7, recovery: 4, hasCounter: false),
        summary: "Mii Gunner is a character from the Mii series. He is known for his shooting skills."
    )

    static let palutena = Character(
        id: "palutena",
        name: "Palutena",
        order: 54,
        world: .kidIcarus,
        mainImage: Image(.palutenaMain),
        thumbnailImage: Image(.palutenaThumb),
        movesImage: Image(.palutenaMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 5, longRange: 6, recovery: 5, hasCounter: true),
        summary: "Palutena is the benevolent Goddess of Light who guides and protects the angels of Skyworld, particularly her captain Pit. Her divine powers manifest in a diverse moveset that includes her Autoreticle for precise targeting, Explosive Flame for zone control, and Warp for unprecedented mobility. As an immortal goddess, her fighting style reflects both her grace and her tremendous power, using her staff and shield to channel celestial energy. Despite her divine status, Palutena often shows a playful side, though her combat capabilities demonstrate why she's revered as one of the most powerful gods in her pantheon. Her ability to control space with divine powers while maintaining strong close-combat options makes her a versatile and formidable opponent."
    )

    static let pacman = Character(
        id: "pacman",
        name: "PAC-MAN",
        order: 55,
        world: .pacMan,
        mainImage: Image(.pacManMain),
        thumbnailImage: Image(.pacManThumb),
        movesImage: Image(.pacManMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 5, longRange: 6, recovery: 5, hasCounter: false),
        summary: "PAC-MAN, the iconic yellow circle who defined a gaming generation, brings his maze-running heritage into the fighting arena with creative flair. His unique fighting style incorporates elements from classic Namco games, using his Bonus Fruit ability to cycle through various projectiles with different properties. His Power Pellet-inspired moves and ability to lay down hydrants for stage control pay homage to his arcade origins. While maintaining his classic 'wakka wakka' charm, PAC-MAN's modern interpretation includes trampoline launches and fire hydrant mechanics that create unique setups and combo opportunities. His mix of nostalgic references and innovative fighting mechanics makes him one of the most creative and unpredictable fighters in the roster."
    )

    static let robin = Character(
        id: "robin",
        name: "Robin",
        order: 56,
        world: .fireEmblem,
        mainImage: Image(.robinMain),
        thumbnailImage: Image(.robinThumb),
        movesImage: Image(.robinMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 3, longRange: 6, recovery: 3, hasCounter: true),
        summary: "Robin, the tactician protagonist of Fire Emblem Awakening, brings strategic resource management to combat through their unique tome and sword durability system. As a master of both magic and swordplay, they must carefully manage their limited-use weapons, with each tome and the Levin Sword having a finite number of uses before breaking. Their arsenal includes powerful spells like Thunder, Arcfire, and Nosferatu, while the Bronze Sword provides reliable damage when magical options are depleted. This durability system forces strategic decisions about when to use their most powerful attacks, truly reflecting their role as a tactical genius. Despite their slower movement, Robin's mix of powerful magic and tactical gameplay makes them a unique addition to the Fire Emblem representatives."
    )

    static let shulk = Character(
        id: "shulk",
        name: "Shulk",
        order: 57,
        world: .xenoblade,
        mainImage: Image(.shulkMain),
        thumbnailImage: Image(.shulkThumb),
        movesImage: Image(.shulkMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 4, longRange: 6, recovery: 4, hasCounter: true),
        summary: "Shulk, the wielder of the legendary Monado sword, brings the unique Vision system from Xenoblade Chronicles into battle. His defining Monado Arts allow him to temporarily modify his attributes, switching between Speed, Shield, Buster, Jump, and Smash modes to adapt to any situation. Each mode significantly alters his capabilities while imposing certain drawbacks, requiring careful timing and strategic awareness. His Vision counter ability can predict and avoid powerful attacks, reflecting his ability to see the future in his home game. Despite the complexity of managing his Monado Arts, Shulk's exceptional range with the Monado and ability to adapt to any situation make him one of the most versatile fighters when mastered."
    )

    static let bowserJr = Character(
        id: "bowserJr",
        name: "Bowser Jr.",
        order: 58,
        world: .superMario,
        mainImage: Image(.bowserJrMain),
        thumbnailImage: Image(.bowserJrThumb),
        movesImage: Image(.bowserJrMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 4, longRange: 5, recovery: 5, hasCounter: false),
        summary: "Bowser Jr., the mischievous heir to the Koopa throne, fights from within his signature Junior Clown Car, transforming a playful vehicle into a versatile weapon platform. His mechanized approach to combat includes deploying Mechakoopas, firing cannonballs, and using various gadgets built into his vehicle. The Clown Car provides both offensive options with its drill and wrecking ball transformations and defensive capabilities with its wheels and propeller. As the youngest of the Koopa family, Bowser Jr.'s determination to prove himself worthy of his father's legacy is reflected in his resourceful and tricky fighting style. His alternate costumes feature the Koopalings, each bringing their own personality while maintaining the same moveset."
    )

    static let duckHunt = Character(
        id: "duckHunt",
        name: "Duck Hunt",
        order: 59,
        world: .retro,
        mainImage: Image(.duckHuntMain),
        thumbnailImage: Image(.duckHuntThumb),
        movesImage: Image(.duckHuntMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 4, longRange: 7, recovery: 4, hasCounter: false),
        summary: "Duck Hunt brings the classic light gun game duo to life as a unique tag-team fighter, combining the hunting dog's playful nature with the duck's aerial mobility. Their zoning-heavy gameplay revolves around the invisible gunman who assists them, creating setups with clay pigeons, explosive cans, and trick shots that can be triggered for complex projectile patterns. The dog's mocking laugh from the original game is incorporated into their taunts, maintaining their playful personality while adding modern combat capabilities. Despite appearing simple, their ability to control space with multiple projectiles and create elaborate setups makes them one of the most technically interesting zoning characters in the game."
    )

    static let ryu = Character(
        id: "ryu",
        name: "Ryu",
        order: 60,
        world: .streetFighter,
        mainImage: Image(.ryuMain),
        thumbnailImage: Image(.ryuThumb),
        movesImage: Image(.ryuMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 4, longRange: 3, recovery: 3, hasCounter: true),
        summary: "Ryu, the eternal wandering warrior, brings Street Fighter's precise input mechanics to Smash with his unique two-button combat system. His special moves can be performed with either simple inputs or traditional fighting game motions, with the latter dealing more damage and having different properties. His Fighting Game Mode allows him to always face his opponent, while his Focus Attack provides unique defensive options. As a true martial artist seeking perfection, Ryu's playstyle emphasizes fundamentals and rewards technical execution with more powerful versions of his iconic moves like Hadoken and Shoryuken. His presence represents the bridge between traditional fighting games and Smash's unique platform fighter mechanics."
    )

    static let ken = Character(
        id: "ken",
        name: "Ken",
        order: 60.1,
        world: .streetFighter,
        mainImage: Image(.kenMain),
        thumbnailImage: Image(.kenThumb),
        movesImage: Image(.kenMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 4, longRange: 3, recovery: 3, hasCounter: true),
        summary: "Ken Masters, Ryu's friendly rival and America's greatest fighter, brings a more aggressive interpretation of the Ansatsuken fighting style to the battlefield. While sharing many moves with Ryu, Ken's versions emphasize speed and flashy combinations over pure power. His Shoryuken is particularly deadly, featuring multiple hits and greater kill potential, while his unique step kicks add mobility options. Ken's fighting style reflects his outgoing personality and competitive spirit, focusing on rushing down opponents with quick attacks and devastating combos. Despite their similar origins, Ken's more explosive playstyle clearly distinguishes him from Ryu's measured approach."
    )

    static let cloud = Character(
        id: "cloud",
        name: "Cloud",
        order: 61,
        world: .finalFantasy,
        mainImage: Image(.cloudMain),
        thumbnailImage: Image(.cloudThumb),
        movesImage: Image(.cloudMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 5, longRange: 5, recovery: 3, hasCounter: false),
        summary: "Cloud Strife, the iconic protagonist of Final Fantasy VII, brings his massive Buster Sword and unique Limit Break mechanic to the battlefield. His fighting style emphasizes powerful sword swings with exceptional range, while his Limit Gauge fills as he takes or deals damage. Once filled, his special moves transform into dramatically more powerful versions, culminating in his legendary Omnislash. Despite his size, Cloud maintains surprising mobility, though his recovery can be predictable without Limit Breaks available. His presence represents the strong connection between Square Enix and Nintendo, while his dramatic animations and powerful moves capture the essence of Final Fantasy's cinematic combat."
    )

    static let corrin = Character(
        id: "corrin",
        name: "Corrin",
        order: 62,
        world: .fireEmblem,
        mainImage: Image(.corrinMain),
        thumbnailImage: Image(.corrinThumb),
        movesImage: Image(.corrinMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 5, longRange: 5, recovery: 4, hasCounter: true),
        summary: "Corrin, the half-dragon protagonist of Fire Emblem Fates, brings unique shapeshifting abilities to combat through their Dragon Fang transformation. Their attacks incorporate partial dragon transformations, using their water-based powers and lance-like appendages to create unique spacing tools. The Dragon Lunge pin mechanic offers both offensive pressure and recovery options, while their counter attack can launch opponents in multiple directions. Despite controversy over their inclusion, Corrin's distinctive fighting style and fluid animations set them apart from other Fire Emblem representatives, truly embodying their dragon heritage in every aspect of their moveset."
    )

    static let bayonetta = Character(
        id: "bayonetta",
        name: "Bayonetta",
        order: 63,
        world: .bayonetta,
        mainImage: Image(.bayonettaMain),
        thumbnailImage: Image(.bayonettaThumb),
        movesImage: Image(.bayonettaMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 5, longRange: 4, recovery: 6, hasCounter: false),
        summary: "Bayonetta, the last survivor of the Umbra Witches, brings her signature Bullet Arts and Witch Time mechanics to create a unique combo-focused fighter. Her ability to chain together aerial combos while firing her gun-heels maintains the stylish action of her home series. Witch Time, activated by perfectly dodging attacks, creates opportunities for devastating punishes, while her Bat Within provides additional defensive options. Her complex movement options and combo potential are balanced by relatively weak individual hits, requiring mastery of her mechanics to maximize damage output. As a character who transcends the boundaries between angels and demons, her provocative personality and fluid combat style make her one of the most distinctive fighters in the roster."
    )

    static let inkling = Character(
        id: "inkling",
        name: "Inkling",
        order: 64,
        world: .splatoon,
        mainImage: Image(.inklingMain),
        thumbnailImage: Image(.inklingThumb),
        movesImage: Image(.inklingMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 4, speed: 6, longRange: 5, recovery: 4, hasCounter: false),
        summary: "Inkling brings Splatoon's unique ink mechanics to Smash, requiring careful management of their ink supply while covering opponents and the stage with colorful splashes. Their attacks become more powerful against inked opponents, while their squid form provides both mobility and ink refill options. The Splattershot, Roller, and Splat Bomb provide various ways to apply ink, creating unique stage control opportunities. Their recovery options include the Super Jump and Splat Roller, though they become more limited without ink. As representatives of Nintendo's newest major franchise, Inklings combine creative weapon designs with strategic resource management to create a truly unique fighting style."
    )

    static let ridley = Character(
        id: "ridley",
        name: "Ridley",
        order: 65,
        world: .metroid,
        mainImage: Image(.ridleyMain),
        thumbnailImage: Image(.ridleyThumb),
        movesImage: Image(.ridleyMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 6, speed: 5, longRange: 4, recovery: 4, hasCounter: false),
        summary: "Ridley, the cunning leader of the Space Pirates and Samus's arch-nemesis, finally joins the roster after years of fan requests. His savage fighting style emphasizes his bestial nature, using his tail, claws, and wings to devastating effect. Despite his large size, Ridley maintains surprising mobility both on the ground and in the air, while his Space Pirate Rush and Skewer attacks can lead to brutal damage output. His plasma breath and fireballs provide ranged options, though his large frame makes him vulnerable to combos. As one of gaming's most iconic villains, Ridley's inclusion represents the fulfillment of long-standing fan wishes while staying true to his ruthless character."
    )

    static let simon = Character(
        id: "simon",
        name: "Simon",
        order: 66,
        world: .castlevania,
        mainImage: Image(.simonMain),
        thumbnailImage: Image(.simonThumb),
        movesImage: Image(.simonMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 3, longRange: 7, recovery: 3, hasCounter: false),
        summary: "Simon Belmont, the legendary vampire hunter, brings Castlevania's classic weapon arsenal to create a unique zoning-focused fighter. His iconic Vampire Killer whip gives him the longest standard reach in the game, while his array of sub-weapons like the Cross, Axe, and Holy Water create powerful space control options. Despite his slower movement, Simon's ability to control space with his whip and projectiles makes him a formidable opponent at any range. His recovery options include the Uppercut and Diagonal Cross throw, though they can be predictable. As the original Belmont, Simon's inclusion celebrates Castlevania's rich history while providing a unique playstyle focused on positioning and resource management."
    )

    static let richter = Character(
        id: "richter",
        name: "Richter",
        order: 66.1,
        world: .castlevania,
        mainImage: Image(.richterMain),
        thumbnailImage: Image(.richterThumb),
        movesImage: Image(.richterMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 5, speed: 3, longRange: 7, recovery: 3, hasCounter: false),
        summary: "Richter Belmont, descendant of Simon and protagonist of Rondo of Blood, brings a more refined and agile interpretation of the Belmont fighting style. While sharing Simon's basic moveset, Richter's animations and effects emphasize his more athletic and dramatic nature. His version of the Vampire Killer whip features unique visual effects, while his Holy Water creates blue flames instead of regular fire. Despite being an echo fighter, Richter's personality and style make him feel distinct, representing a more modern era of Castlevania while maintaining the series' core focus on skilled weapon use and positioning. His presence alongside Simon celebrates different eras of Castlevania's evolution."
    )

    static let kingKRool = Character(
        id: "kingKRool",
        name: "King K. Rool",
        order: 67,
        world: .donkeyKong,
        mainImage: Image(.kingKRoolMain),
        thumbnailImage: Image(.kingKRoolThumb),
        movesImage: Image(.kingkroolMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 7, speed: 2, longRange: 6, recovery: 4, hasCounter: true),
        summary: "King K. Rool is the megalomaniacal ruler of the Kremling Krew and arch-nemesis of the Kong family. This brutish but cunning crocodile king combines his massive strength with surprisingly advanced technology in his endless quest to steal the Kongs' banana hoard. His fighting style emphasizes his tremendous weight and power, using his golden belly armor to counter attacks while deploying his crown as a projectile and his blunderbuss for both offensive and recovery options. Despite his comical appearance and occasional buffoonery, K. Rool is a dangerous opponent whose scientific knowledge and physical might have repeatedly threatened DK Island. His endurance and versatility make him a formidable heavyweight fighter who can control space with projectiles while threatening devastating close-range attacks."
    )

    static let isabelle = Character(
        id: "isabelle",
        name: "Isabelle",
        order: 68,
        world: .animalCrossing,
        mainImage: Image(.isabelleMain),
        thumbnailImage: Image(.isabelleThumb),
        movesImage: Image(.isabelleMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 3, speed: 5, longRange: 5, recovery: 5, hasCounter: false),
        summary: "Isabelle is the ever-cheerful and diligent secretary who helps manage the player's town in Animal Crossing. Her transition from administrative assistant to fighter hasn't diminished her helpful nature, as she adapts her office supplies and civic tools into surprisingly effective weapons. Her fishing rod can be used as both a long-range grab and recovery tool, while her party poppers and Lloid trap create unique zoning opportunities. Despite her small size and gentle demeanor, Isabelle's resourcefulness and determination make her a tricky opponent who can control space and set up clever traps. Her ultimate smash attack even calls upon her beloved town hall to demonstrate her dedication to public service."
    )

    static let incineroar = Character(
        id: "incineroar",
        name: "Incineroar",
        order: 69,
        world: .pokemon,
        mainImage: Image(.incineroarMain),
        thumbnailImage: Image(.incineroarThumb),
        movesImage: Image(.incineroarMoves),
        skinImages: [],
        isDLC: false,
        priceCents: nil,
        stats: Stats(power: 7, speed: 2, longRange: 2, recovery: 3, hasCounter: true),
        summary: "Incineroar is the heel wrestler-inspired final evolution of Litten, combining Fire and Dark-type attributes with professional wrestling flair. Known as the Heel Pokémon, it revels in the crowd's reaction whether positive or negative, gaining power from its showboating taunts. Its fighting style is built around powerful wrestling moves like its signature Darkest Lariat and Cross Chop, while its Revenge mechanic rewards taking hits before delivering devastating counters. Despite its poor mobility, Incineroar's combination of raw power and theatrical combat makes it a crowd-pleasing powerhouse. Its ability to turn enemy projectiles into power-boosting taunts reflects its heel wrestler personality, thriving on both cheers and jeers."
    )

    static let piranha = Character(
        id: "piranha",
        name: "Piranha Plant",
        order: 70,
        world: .superMario,
        mainImage: Image(.piranhaPlantMain),
        thumbnailImage: Image(.piranhaPlantThumb),
        movesImage: Image(.piranhaMoves),
        skinImages: [
            Image(.piranhaPlantMain1),
            Image(.piranhaPlantMain2),
            Image(.piranhaPlantMain3),
            Image(.piranhaPlantMain4),
            Image(.piranhaPlantMain5),
            Image(.piranhaPlantMain6),
            Image(.piranhaPlantMain7)
        ],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 5, speed: 3, longRange: 6, recovery: 4, hasCounter: false),
        summary: "Piranha Plant represents one of the most iconic enemies from the Mario series, transformed from simple obstacle to formidable fighter. This carnivorous plant demonstrates surprising mobility and range, using its flexible stem to stretch and strike from unexpected angles. Its moveset creatively adapts its natural abilities, from its potent bite attacks to spitting poisonous clouds and shooting spiky balls. The Long-Stem Strike allows it to patrol multiple elevations, while Ptooie creates unique aerial pressure opportunities. Despite being rooted in a pot, Piranha Plant's excellent recovery and mix of close and long-range options make it an unorthodox but effective fighter that proves even common enemies can become stars."
    )

    static let joker = Character(
        id: "joker",
        name: "Joker",
        order: 71,
        world: .persona,
        mainImage: Image(.jokerMain),
        thumbnailImage: Image(.jokerThumb),
        movesImage: Image(.jokerMoves),
        skinImages: [
            Image(.jokerMain1),
            Image(.jokerMain2),
            Image(.jokerMain3),
            Image(.jokerMain4),
            Image(.jokerMain5),
            Image(.jokerMain6),
            Image(.jokerMain7)
        ],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 4, speed: 6, longRange: 4, recovery: 5, hasCounter: true),
        summary: "Joker, the code name of Ren Amamiya, is the charismatic leader of the Phantom Thieves who fights for justice in both the real world and the cognitive realm of the Metaverse. His unique mechanic revolves around his Persona, Arsene, which can be summoned through his Rebellion Gauge to dramatically enhance his abilities. Without Arsene, Joker relies on agile movements, his grappling hook, and his dagger for quick strikes. When Arsene manifests, his moves gain tremendous power and range, reflecting the unleashed potential of his rebellious spirit. His All-Out Attack serves as a devastating finale, capturing the stylish presentation and tactical depth of Persona 5's combat system."
    )
/*
    static let hero = Character(
        id: "hero",
        name: "Hero",
        order: 72,
        world: .dragonQuest,
        mainImage: Image(.heroMain),
        thumbnailImage: Image(.heroThumb),
        movesImage: Image(.heroMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 5, speed: 4, longRange: 5, recovery: 4, hasCounter: false),
        summary: "Hero embodies the legendary protagonists from the Dragon Quest series, bringing the classic JRPG's turn-based combat system into real-time battles. His unique Command Selection menu allows access to a variety of MP-consuming spells and abilities, from healing Heal to the devastating Kamikazee. This randomized selection system creates strategic decisions about resource management and risk-reward scenarios. His sword-based normal attacks provide reliable damage, while critical hits can turn the tide of battle. Despite the inherent randomness in his special moves, Hero's combination of solid swordplay and powerful magic makes him a versatile fighter who can adapt to any situation, true to his RPG origins."
    )

    static let banjoKazooie = Character(
        id: "banjoKazooie",
        name: "Banjo & Kazooie",
        order: 73,
        world: .banjoKazooie,
        mainImage: Image(.banjoMain),
        thumbnailImage: Image(.banjoThumb),
        movesImage: Image(.banjoMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 5, speed: 4, longRange: 5, recovery: 4, hasCounter: false),
        summary: "Banjo & Kazooie are the beloved duo from Rare's classic platforming series, combining Banjo's strength with Kazooie's aerial mobility and projectile attacks. Their movesets faithfully recreate their various abilities from their adventures, including Egg Firing, Wonderwing invincibility, and the Shock Spring Jump. Kazooie can pop out of Banjo's backpack for various attacks, while their Forward Smash references their iconic pack whack. Their recovery options are particularly versatile, using moves like the Breegull Blaster and Wonderwing to approach from multiple angles. Despite being separated from Nintendo for years, their return maintains the charm and humor that made their original games classics."
    )

    static let terry = Character(
        id: "terry",
        name: "Terry",
        order: 74,
        world: .fatalFury,
        mainImage: Image(.terryMain),
        thumbnailImage: Image(.terryThumb),
        movesImage: Image(.terryMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 6, speed: 5, longRange: 3, recovery: 3, hasCounter: false),
        summary: "Terry Bogard, the Legendary Wolf from Fatal Fury, brings SNK's fighting game mechanics to Smash with his unique command input system. His signature moves like Burning Knuckle and Crack Shoot can be performed with either simple or traditional fighting game inputs, rewarding technical skill with increased power. At high damage percentages, he gains access to his devastating Super Special Moves: Power Geyser and Buster Wolf. His fighting style emphasizes ground control and powerful punishes, with his GO meter mechanic adding strategic depth. Terry's combination of accessibility and technical depth, along with his charismatic personality, makes him a fitting representative of SNK's fighting game legacy."
    )

    static let byleth = Character(
        id: "byleth",
        name: "Byleth",
        order: 75,
        world: .fireEmblem,
        mainImage: Image(.bylethMain),
        thumbnailImage: Image(.bylethThumb),
        movesImage: Image(.bylethMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 6, speed: 3, longRange: 6, recovery: 4, hasCounter: true),
        summary: "Byleth, the mysterious professor of the Officers Academy, brings unprecedented weapon variety to their combat style. As the wielder of the Heroes' Relics, they can access the Sword of the Creator, Areadbhar spear, Aymr axe, and Failnaught bow. Each weapon is assigned to different attack directions, creating a unique spacing-based fighting style that rewards positioning and knowledge of each weapon's strengths. Their slower movement is offset by exceptional range and power, while their ability to switch weapons mid-combo creates unique mix-up opportunities. Despite controversy over another Fire Emblem representative, Byleth's unique mechanics set them apart from their sword-wielding predecessors."
    )

    static let minMin = Character(
        id: "minMin",
        name: "Min Min",
        order: 76,
        world: .arms,
        mainImage: Image(.minMinMain),
        thumbnailImage: Image(.minMinThumb),
        movesImage: Image(.minMinMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 4, speed: 4, longRange: 7, recovery: 4, hasCounter: false),
        summary: "Min Min, the ramen-loving fighter from ARMS, revolutionizes Smash's combat with her unique ability to control both arms independently using the A and B buttons. Her extendable ARMS allow for unprecedented range control, while different arm attachments like the Dragon ARM and Megawatt provide strategic options. Her ground-based fighting style emphasizes spacing and reads, as her arms can be curved to catch opponents' movements. While vulnerable to close-range pressure, Min Min's exceptional range and ability to control neutral from a distance make her a unique zoner who truly brings the ARMS fighting style to life."
    )
*/

    static let steve = Character(
        id: "steve",
        name: "Steve",
        order: 77,
        world: .minecraft,
        mainImage: Image(.steveMain),
        thumbnailImage: Image(.steveThumb),
        movesImage: Image(.steveMoves),
        skinImages: [
            Image(.steveMain2),
            Image(.steveMain3),
            Image(.steveMain4),
            Image(.steveMain5),
            Image(.steveMain6),
            Image(.steveMain7)
        ],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 5, speed: 4, longRange: 6, recovery: 5, hasCounter: false),
        summary: "Steve (and his alternate form Alex) brings Minecraft's core mechanics into Smash, creating a uniquely resource-management-based fighter. Their ability to mine materials and craft better tools mid-battle creates a dynamic progression system within each match. Building blocks can create platforms and walls for stage control, while different materials affect tool durability and power. Their unusual movement and attack animations faithfully recreate Minecraft's distinctive style, while their minecart and elytra provide unique mobility options. Despite their seemingly simple appearance, Steve/Alex's complex resource management and stage control abilities make them one of the most technically demanding fighters."
    )

    static let sephiroth = Character(
        id: "sephiroth",
        name: "Sephiroth",
        order: 78,
        world: .finalFantasy,
        mainImage: Image(.sephirothMain),
        thumbnailImage: Image(.sephirothThumb),
        movesImage: Image(.sephirothMoves),
        skinImages: [
            Image(.sephirothMain1),
            Image(.sephirothMain2),
            Image(.sephirothMain3),
            Image(.sephirothMain4),
            Image(.sephirothMain5),
            Image(.sephirothMain6),
            Image(.sephirothMain7),
        ],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 6, speed: 5, longRange: 7, recovery: 4, hasCounter: false),
        summary: "Sephiroth, the legendary One-Winged Angel, brings his imposing presence and devastating sword techniques to the battlefield. His massive Masamune blade gives him unprecedented reach, while his Winged Form activates at high damage percentages, granting additional mobility and power. His moveset incorporates iconic abilities from Final Fantasy VII, including Shadow Flare, Gigaflare, and his signature One-Winged Angel form. Despite being relatively light, his exceptional range and power make him a fearsome opponent who can control space and end stocks early. His dramatic entrance and villainous charisma make him one of the most impactful DLC additions to the roster."
    )
/*
    static let pyra = Character(
        id: "pyra",
        name: "Pyra",
        order: 79,
        world: .xenoblade,
        mainImage: Image(.pyraMain),
        thumbnailImage: Image(.pyraThumb),
        movesImage: Image(.pyraMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 6, speed: 4, longRange: 4, recovery: 3, hasCounter: false),
        summary: "Pyra is one half of the Aegis duo, representing the power aspect of their shared being. As the Aegis of power, her attacks emphasize raw damage and knockback, with her flame-based abilities creating powerful finishing opportunities. Her slower movement speed is offset by the ability to switch to Mythra for mobility, creating a dynamic tag-team system. Pyra's Prominence Revolt and Flame Nova provide strong vertical kill options, while her Blazing End creates unique edge-guarding opportunities. Her relationship with Rex and her role in Xenoblade Chronicles 2's story is reflected in her powerful but straightforward fighting style."
    )

    static let mythra = Character(
        id: "mythra",
        name: "Mythra",
        order: 80,
        world: .xenoblade,
        mainImage: Image(.mythraMain),
        thumbnailImage: Image(.mythraThumb),
        movesImage: Image(.mythraMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 4, speed: 7, longRange: 4, recovery: 3, hasCounter: false),
        summary: "Mythra represents the light aspect of the Aegis, contrasting with Pyra's power through superior speed and combo potential. Her Foresight ability activates when dodging attacks perfectly, creating a slight slowdown effect that rewards precise defensive play. Lightning Buster and Photon Edge allow for rapid multi-hit attacks, while her Chroma Dust creates unique zoning opportunities. The ability to switch between Mythra's speed and Pyra's power creates one of the most versatile characters in the game. Her complex relationship with Pyra and their shared past adds depth to their unique tag-team mechanics."
    )

    static let kazuya = Character(
        id: "kazuya",
        name: "Kazuya",
        order: 81,
        world: .tekken,
        mainImage: Image(.kazuyaMain),
        thumbnailImage: Image(.kazuyaThumb),
        movesImage: Image(.kazuyaMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 7, speed: 3, longRange: 2, recovery: 4, hasCounter: true),
        summary: "Kazuya Mishima brings Tekken's complex fighting game mechanics to Smash, featuring over 40 unique attacks based on traditional command inputs. His Fighting Game Mode allows for auto-turn around when using command inputs, staying true to Tekken's gameplay style. His Devil Form transformation enhances his already powerful moves while granting flight ability. Kazuya's combo-heavy gameplay emphasizes the Electric Wind God Fist and other signature Mishima-style moves, rewarding technical execution with devastating damage. Despite his limited range, his raw power and complex moveset make him one of the most technically rewarding characters to master."
    )

    static let sora = Character(
        id: "sora",
        name: "Sora",
        order: 82,
        world: .kingdomHearts,
        mainImage: Image(.soraMain),
        thumbnailImage: Image(.soraThumb),
        movesImage: Image(.soraMoves),
        skinImages: [],
        isDLC: true,
        priceCents: 599,
        stats: Stats(power: 4, speed: 5, longRange: 4, recovery: 6, hasCounter: false),
        summary: "Sora, the Keyblade wielder from Kingdom Hearts, represents the culmination of the unlikely collaboration between Disney and Square Enix. His fighting style emphasizes aerial combat and magic, with his signature Keyblade providing both melee and magical options. His three-hit combo system recreates Kingdom Hearts' combat, while his magic spells (Fire, Thunder, and Blizzard) can be used in various combinations. Sora's exceptional air mobility and recovery options reflect his experience traversing different worlds, while his counter and aerial combos capture the acrobatic nature of Kingdom Hearts combat. As the final DLC character, his addition represents a fitting conclusion to Smash Ultimate's roster."
    )
 */
}
