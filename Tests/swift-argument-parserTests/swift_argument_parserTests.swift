import XCTest
@testable import swift_argument_parser

final class swift_argument_parserTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_argument_parser().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
