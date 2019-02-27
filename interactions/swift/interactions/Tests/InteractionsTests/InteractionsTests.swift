import XCTest
@testable import Interactions

class InteractionsTests: XCTestCase {

    func testInteractions() {
        XCTAssertEqual(0, 0)
    }
    
    static var allTests: [(String, (InteractionsTests) -> () throws -> Void)] {
        return [
            ("testInteractions", testInteractions),
        ]
    }
}
