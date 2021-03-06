import XCTest
@testable import Zxcvbn

final class L33tTests: XCTestCase {
    func testStringSubstitutions() {
        XCTAssertEqual(L33t.substitutions("zxcvbn").map { $0.keys.count }, [0])
        XCTAssertEqual(L33t.substitutions("qwER43@!").map { $0.keys.count }, [3, 3])
        XCTAssertEqual(L33t.substitutions("coRrecth0rseba++ery9.23.2007staple$").map { $0.keys.count }, [7, 6, 6])
        XCTAssertEqual(L33t.substitutions("D0g..................").map { $0.keys.count }, [1])
        XCTAssertEqual(L33t.substitutions("abcdefghijk987654321").map { $0.keys.count }, [8, 8, 8, 8, 8, 8])
        XCTAssertEqual(L33t.substitutions("neverforget13/3/1997").map { $0.keys.count }, [4, 4, 4])
        XCTAssertEqual(L33t.substitutions("thx1138").map { $0.keys.count }, [3, 3])
        XCTAssertEqual(L33t.substitutions("AOEUIDHG&*()LS_").map { $0.keys.count }, [1])
        XCTAssertEqual(L33t.substitutions("").map { $0.keys.count }, [0])
    }
    
    func testStringSubstitutionTable() {
        XCTAssertEqual(L33t.substitutionTable("zxcvbn").count, 0)
        XCTAssertEqual(L33t.substitutionTable("qwER43@!").count, 3)
        XCTAssertEqual(L33t.substitutionTable("coRrecth0rseba++ery9.23.2007staple$").count, 7)
        XCTAssertEqual(L33t.substitutionTable("D0g..................").count, 1)
        XCTAssertEqual(L33t.substitutionTable("").count, 0)
    }
    
    func testSubstitutionTable() {
        XCTAssertEqual(L33t.substitutionTable.count, 12)
    }
}

extension L33tTests {
    
    // MARK: Matching
    func testStringMatches() {
        XCTAssertEqual(L33t().matches("zxcvbn").count, 0)
        XCTAssertEqual(L33t().matches("qwER43@!").count, 6)
        XCTAssertEqual(L33t().matches("qwER43@!").first?.entropy ?? -1.0, 3.3219280, accuracy: 0.00001)
        XCTAssertEqual(L33t().matches("Tr0ub4dour&3").count, 6)
        XCTAssertEqual(L33t().matches("Tr0ub4dour&3").first?.entropy ?? -1.0, 16.784687, accuracy: 0.00001)
        XCTAssertEqual(L33t().matches("coRrecth0rseba++ery9.23.2007staple$").count, 29)
        XCTAssertEqual(L33t().matches("coRrecth0rseba++ery9.23.2007staple$").first?.entropy ?? -1.0, 11.688250, accuracy: 0.00001)
        XCTAssertEqual(L33t().matches("D0g..................").count, 2)
        XCTAssertEqual(L33t().matches("D0g..................").first?.entropy ?? -1.0, 6.584963, accuracy: 0.00001)
        XCTAssertEqual(L33t().matches("abcdefghijk987654321").count, 19)
        XCTAssertEqual(L33t().matches("abcdefghijk987654321").first?.entropy ?? -1.0, 3.321928, accuracy: 0.00001)
        XCTAssertEqual(L33t().matches("neverforget13/3/1997").count, 6)
        XCTAssertEqual(L33t().matches("neverforget13/3/1997").first?.entropy ?? -1.0, 11.458407, accuracy: 0.00001)
        XCTAssertEqual(L33t().matches("thx1138").count, 2)
        XCTAssertEqual(L33t().matches("thx1138").first?.entropy ?? -1.0, 2.0, accuracy: 0.00001)
        XCTAssertEqual(L33t().matches("AOEUIDHG&*()LS_").count, 0)
        XCTAssertEqual(L33t().matches("R0$38uD99").count, 4)
        XCTAssertEqual(L33t().matches("R0$38uD99").first?.entropy ?? -1.0, 10.936638, accuracy: 0.00001)
        XCTAssertEqual(L33t().matches("").count, 0)
    }
}
