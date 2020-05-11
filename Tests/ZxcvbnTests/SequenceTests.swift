import XCTest
@testable import Zxcvbn

final class SequenceTests: XCTestCase {
    
}

extension SequenceTests {
    
    // MARK: Matching
    func testStringMatches() {
        XCTAssertEqual(Sequence.lowercasedAlphabet.matches("zxcvbn").count, 0)
        XCTAssertEqual(Sequence.uppercasedAlphabet.matches("zxcvbn").count, 0)
        XCTAssertEqual(Sequence.numerals.matches("zxcvbn").count, 0)
        
        XCTAssertEqual(Sequence.lowercasedAlphabet.matches("qwER43@!").count, 0)
        XCTAssertEqual(Sequence.uppercasedAlphabet.matches("qwER43@!").count, 0)
        XCTAssertEqual(Sequence.numerals.matches("qwER43@!").count, 0)
        
        XCTAssertEqual(Sequence.lowercasedAlphabet.matches("coRrecth0rseba++ery9.23.2007staple$").count, 0)
        XCTAssertEqual(Sequence.uppercasedAlphabet.matches("coRrecth0rseba++ery9.23.2007staple$").count, 0)
        XCTAssertEqual(Sequence.numerals.matches("coRrecth0rseba++ery9.23.2007staple$").count, 0)
        
        XCTAssertEqual(Sequence.lowercasedAlphabet.matches("abcdefghijk987654321").count, 1)
        XCTAssertEqual(Sequence.uppercasedAlphabet.matches("abcdefghijk987654321").count, 0)
        XCTAssertEqual(Sequence.numerals.matches("abcdefghijk987654321").count, 1)
        
        XCTAssertEqual(Sequence.lowercasedAlphabet.matches("1qaz2wsx3edc").count, 1)
        XCTAssertEqual(Sequence.uppercasedAlphabet.matches("1qaz2wsx3edc").count, 0)
        XCTAssertEqual(Sequence.numerals.matches("1qaz2wsx3edc").count, 0)
        
        XCTAssertEqual(Sequence.lowercasedAlphabet.matches("12345678").count, 0)
        XCTAssertEqual(Sequence.uppercasedAlphabet.matches("12345678").count, 0)
        XCTAssertEqual(Sequence.numerals.matches("12345678").count, 1)
        
        XCTAssertEqual(Sequence.lowercasedAlphabet.matches("defghi6789").count, 1)
        XCTAssertEqual(Sequence.uppercasedAlphabet.matches("defghi6789").count, 0)
        XCTAssertEqual(Sequence.numerals.matches("defghi6789").count, 1)
        
        XCTAssertEqual(Sequence.lowercasedAlphabet.matches("").count, 0)
        XCTAssertEqual(Sequence.uppercasedAlphabet.matches("").count, 0)
        XCTAssertEqual(Sequence.numerals.matches("").count, 0)
    }
}
