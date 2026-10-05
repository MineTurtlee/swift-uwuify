//
//  Excepshwn.swift
//  swift-uwuify
//
//  Created by Flaky le Flaker (Mineturtlee) on 4/10/26.
//
import Foundation

struct Excepshwn: Error, LocalizedError, CustomStringConvertible {
    var isFatal: Bool = false
    public var description: String
    public var errorDescription: String?
    
    init(comment: String, desc: String, fatal: Bool = false) {
        self.isFatal = fatal
        self.description = desc
        self.errorDescription = NSLocalizedString(
            desc,
            comment: comment
        )
    }
}

enum ExcepshwnComment: String {
    case conflictingValues = "Conflicting Arguments"
}
