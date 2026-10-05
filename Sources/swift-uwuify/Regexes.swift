//
//  Regexes.swift
//  swift-uwuify
//
//  Created by Flaky le Flaker (Mineturtlee) on 4/10/26.
//

struct Regexes {
    static let url = "(?:[a-zA-Z]+:)+/*(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()@:%_\\+.~#?&//=]*)"
    
    private static let specialList: [String] = [
        "(@everyone|@here)|",
        "(<a?:[a-zA-Z0-9_]+:\\d+>)|",
        "(:[a-zA-Z0-9_]+:)|",
        "(<[@#!][^>]+>)|",
        Regexes.url
    ]
    static var specialTokens: String {
        var literal: String = ""
        
        for regex in specialList {
            literal.append(contentsOf: regex)
        }
        
        return literal
    }
    
    static let spaceTokenizer = "(\\s+)"
}
