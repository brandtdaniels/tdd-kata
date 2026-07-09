import XCTest
@testable import StringCalculator

class StringCalculatorTests: XCTestCase {

    func testEmptyString() {
        XCTAssertEqual(0, try StringCalculator().add(""))
    }
}
