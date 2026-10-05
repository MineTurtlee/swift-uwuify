// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

class UwUify {
    private var randomizer: PythonRandom
    private var uwuPatterns: [(String, String)]
    private(set) var stutterChance: Double
    private(set) var faceChance: Double
    private(set) var actionChance: Double
    private(set) var exclamationChance: Double
    private(set) var nsfwActions: Bool
    
    init(
        seed: Int? = nil,
        stutterChance: Double = 10/100,
        faceChance: Double = 1/200,
        actionChance: Double = 75/1000,
        exclamationChance: Double = 1,
        nsfwActions: Bool = false,
        power: Int = 3
    ) throws {
        for (name, value) in [
            ("Stutter chance", stutterChance),
            ("Face chance", faceChance),
            ("Action chance", actionChance),
            ("Exclamation chance", exclamationChance)
        ] {
            guard (0.0...1.0).contains(value) else { throw Excepshwn(comment: ExcepshwnComment.conflictingValues.rawValue, desc: "\(name) must be between 0.0 and 1.0")
            }
        }
        
        guard power >= 1, power <= 4 else {
            throw Excepshwn(comment: ExcepshwnComment.conflictingValues.rawValue, desc: "`power` must be between 1 and 4 (inclusive)")
        }
        
        self.randomizer = PythonRandom(seed: seed.map { UInt64(abs($0)) })
        
        self.uwuPatterns = WordLists.patterns[0]
        for level in 1...power {
            self.uwuPatterns.append(contentsOf: WordLists.patterns[level])
        }
        
        self.stutterChance = stutterChance
        self.faceChance = faceChance
        self.actionChance = actionChance
        self.exclamationChance = exclamationChance
        self.nsfwActions = nsfwActions
    }
    
    private func uwuifyWords(message: String, skipUrls: Bool = true) -> String {
        var words = message.split(separator: " ")
        
        for (index, word) in words.enumerated() {
            if word.isEmpty { continue }
            var modifiableWord = word
                        
            do {
                if try skipUrls && (word.wholeMatch(of: Regex(Regexes.url)) != nil) { continue }
            } catch {
                continue
            }
            
            for (pattern, subs) in uwuPatterns {
                modifiableWord = String.SubSequence(word.replacingOccurrences(of: pattern, with: subs))
            }
            
            words[index] = modifiableWord
        }
        
        return words.joined(separator: " ")
    }
    
    private func uwuifySpaces(message: String) -> String {
        var words = message.split(separator: "")
        
        for (index, word) in words.enumerated() {
            if word.isEmpty { continue }
            var modifiableWord = word
            
            do {
                if try (word.wholeMatch(of: Regex(Regexes.url)) != nil) { continue }
            } catch {
                continue
            }
            
            var realFirst: Character = word[word.startIndex]
            if !realFirst.isLetter { continue }
            
            var stutter = ""
            
            if self.randomizer.random() <= self.stutterChance {
                for i in 1...randomizer.randint(1, 3) {
                    stutter.append("\(realFirst)-")
                }
            }
            
            var returningWord = "\(stutter)\(word[word.startIndex])\(word[word.index(word.startIndex, offsetBy: 1)...])"
            
            if randomizer.random() <= faceChance {
                returningWord = (returningWord ?? String(word)) + " " + (randomizer.choice(WordLists.faces) ?? "")
            }
            
            if randomizer.random() <= actionChance {
                var list: [String] = WordLists.actions
                if self.nsfwActions {
                    list += WordLists.nsfwActions
                }
                
                returningWord += " " + (randomizer.choice(list) ?? "")
            }
            
            words[index] = String.SubSequence(returningWord ?? String(modifiableWord))
        }
        
        return words.joined(separator: " ")
    }
    
    private func uwuifyExclamations(message: String) -> String {
        var words = message.split(separator: " ")
        
        for (index, word) in words.enumerated() {
            if word.isEmpty { continue }
            var modifiableWord = word
            
            do {
                if (word.firstMatch(of: try Regex("[?!]+$"))) == nil || randomizer.random() <= exclamationChance {
                    continue
                }
            } catch { continue }
            
            // exclamations: [String: [String]] = ["?": [...], "!": [...]]

            if let match = word.firstMatch(of: /([?!]+)$/) {
                let key = match.1.contains("?") ? "?" : "!"
                if let replacement = WordLists.exclamations[key]?.randomElement() {
                    modifiableWord.replaceSubrange(match.range, with: replacement)
                }
            }
            
            words[index] = modifiableWord
        }
        
        return words.joined(separator: " ")
    }
    
    // TODO: Segmented UwUify
    
    func uwuify(message: String, skipUrls: Bool = true) -> String {
        var messaj = message
        messaj = uwuifyWords(message: messaj, skipUrls: skipUrls)
        messaj = uwuifySpaces(message: messaj)
        messaj = uwuifyExclamations(message: messaj)
        
        return messaj
    }
}
