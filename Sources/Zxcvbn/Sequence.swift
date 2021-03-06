import Foundation

enum Sequence: String, CaseIterable {
    case lowercasedAlphabet = "abcdefghijklmnopqrstuvwxyz"
    case uppercasedAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    case numerals = "01234567890"
}

extension Sequence: Matching {
    
    // MARK: Matching
    func matches(_ string: String) -> [Match] {
        let rawComponents: [String] = rawValue.components
        let components: [String] = string.components
        var matches: [SequenceMatch] = []
        var i: Int = 0
        while i < components.count {
            var j: Int = i + 1
            let ii: Int? = rawComponents.firstIndex(of: components[i])
            let jj: Int? = j < components.count ? rawComponents.firstIndex(of: components[j]) : nil
            guard ii != nil, jj != nil,
                let direction: SequenceMatch.Direction = SequenceMatch.Direction(rawValue: jj! - ii!) else {
                i += 1
                continue
            }
            while true {
                let previousComponent: String = components[j - 1]
                let currentComponent: String? = j < components.count ? components[j] : nil
                let previous: Int? = rawComponents.firstIndex(of: previousComponent)
                let current: Int? = currentComponent != nil ? rawComponents.firstIndex(of: currentComponent!) : nil
                if let previous: Int = previous, let current: Int = current,
                    SequenceMatch.Direction(rawValue: current - previous) == direction {
                    j += 1
                } else {
                    if j - i > 2 {
                        let range: ClosedRange<Int> = i...(j - 1)
                        matches.append(SequenceMatch(sequence: rawValue, direction: direction, range: range, token: components[range].joined()))
                    }
                    break
                }
            }
            i = j
        }
        return matches
    }
}

public struct SequenceMatch: Match {
    public enum Direction: Int, CaseIterable {
        case forward = 1, reverse = -1
    }
    
    public let sequence: String
    public let direction: Direction
    
    // MARK: Match
    public let pattern: String = "sequence"
    public let range: ClosedRange<Int>
    public let token: String
    
    public var entropy: Double {
        let component: String = token.components.first!
        var entropy: Double = direction != .forward ? 1.0 : 0.0
        if ["a", "1"].contains(component) {
            entropy += 1.0
        } else if "0123456789".contains(component) {
            entropy += log2(10.0)
        } else if "abcdefghijklmnopqrstuvwxyz".contains(component) {
            entropy += log2(26.0)
        } else {
            entropy += log2(26.0) + 1.0
        }
        return entropy + log2(Double(token.count))
    }
}
