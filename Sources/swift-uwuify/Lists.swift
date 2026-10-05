//
//  Lists.swift
//  swift-uwuify
//
//  Created by Flaky le Flaker (Mineturtlee) on 4/10/26.
//

struct WordLists {
    static let patterns: [[(String, String)]] = [
            [
                ("[rl]", "w"),
                ("[RL]", "W")
            ],
            [
                ("([nj])([aeiou])", "\\g<1>y\\g<2>"),
                ("([NJ])([aeiou])", "\\g<1>y\\g<2>"),
                ("([NJ])([AEIOU])", "\\g<1>Y\\g<2>")
            ],
            [
                ("ove", "uv"),
                ("v([aeiouAEIUO])", "w\\g<1>")
            ],
            [
                ("ose", "owse"),
                ("([Oo])h", "\\g<1>wh"),
                ("([Oo])n", "\\g<1>wn"),
                ("([Aa])n", "\\g<1>wn")
            ]
        ]

    static let actions: [String] = [
            "***blushes***",
            "***whispers to self***",
            "***cries***",
            "***screams***",
            "***sweats***",
            "***runs away***",
            "***screeches***",
            "***walks away***",
            "***looks at you***",
            "***huggles tightly***",
            "***boops your nose***",
            "***wags my tail***",
            "***pounces on you***",
            "***nuzzles your necky wecky***",
            "***licks lips***",
            "***glomps and huggles***",
            "***glomps***",
            "***looks around suspiciously***",
            "***smirks smugly***",
        ]

    // what the fuck
    // aRE THESE HOLY SHIT BRO NO WA-
    static let nsfwActions: [String] = [
            "***twerks***",
            "***sees bulge***",
            "***notices buldge***",
            "***starts twerking***",
            "***unzips your pants***",
            "***pounces on your buldge***",
        ]

    static let exclamations: [String: [String]] = [
            "!": [
                "!",
                "!!",
                "!!!",
                "!!11",
                "!!1!",
            ],
            "?": [
                "?",
                "??",
                "???",
                "!?",
                "?!!",
                "?!?1",
                "?!?!",
            ]
        ]

    static let faces: [String] = [
        "(・\\`ω\\´・)",
        ";;w;;",
        "OwO",
        "owo",
        "UwU",
        "\\>w\\<",
        "^w^",
        "ÚwÚ",
        "^-^",
        ":3",
        "x3",
        "Uwu",
        "uwU",
        "(uwu)",
        "(ᵘʷᵘ)",
        "(ᵘﻌᵘ)",
        "(◡ ω ◡)",
        "(◡ ꒳ ◡)",
        "(◡ w ◡)",
        "(◡ ሠ ◡)",
        "(˘ω˘)",
        "(⑅˘꒳˘)",
        "(˘ᵕ˘)",
        "(˘ሠ˘)",
        "(˘³˘)",
        "(˘ε˘)",
        "(˘˘˘)",
        "( ᴜ ω ᴜ )",
        "(„ᵕᴗᵕ„)",
        "(ㅅꈍ ˘ ꈍ)",
        "(⑅˘꒳˘)",
        "( ｡ᵘ ᵕ ᵘ ｡)",
        "( ᵘ ꒳ ᵘ ✼)",
        "( ˘ᴗ˘ )",
        "(ᵕᴗ ᵕ⁎)",
        "*:･ﾟ✧(ꈍᴗꈍ)✧･ﾟ:*",
        "*˚*(ꈍ ω ꈍ).₊̣̇.",
        "(。U ω U。)",
        "(U ᵕ U❁)",
        "(U ﹏ U)",
        "(◦ᵕ ˘ ᵕ◦)",
        "ღ(U꒳Uღ)",
        "♥(。U ω U。)",
        "– ̗̀ (ᵕ꒳ᵕ) ̖́-",
        "( ͡U ω ͡U )",
        "( ͡o ᵕ ͡o )",
        "( ͡o ꒳ ͡o )",
        "( ˊ.ᴗˋ )",
        "(ᴜ‿ᴜ✿)",
        "~(˘▾˘~)",
        "(｡ᴜ‿‿ᴜ｡)",
        ">/////<",

        // im gonna add my own thingies here
        ">>///<<",
        ">///<",
        "@///@",
        "^///^",
        "O///O",
        "((OwO))", // shaking
        "((>///<))",
        "OwO||",
        "OwO\\",
        ">~<",
        ">~<||",
        ">~<\\",
        ">~O",
        ">~O||",
        ">~O\\",
        ">>~<<\\",
        ">>~<<||",
        ">>~<<"
    ]
}
