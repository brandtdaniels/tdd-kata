import XCTest
@testable import Refactoring

class RefactoringTests: XCTestCase {

    func testRefactoring() {
        XCTAssertEqual(0, 0)
    }
    
    static var allTests: [(String, (RefactoringTests) -> () throws -> Void)] {
        return [
            ("testRefactoring", testRefactoring),
        ]
    }
}
