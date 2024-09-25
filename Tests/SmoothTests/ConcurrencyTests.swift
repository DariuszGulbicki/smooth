import XCTest
import LoggingCamp
@testable import Concurrency

final class ConcurrencyTests: XCTestCase {

    // MARK: - Promise

    func testPromiseThen() throws {
        let promise = Promise<Int> {
            return 1
        }
        promise.then { value in
            XCTAssertEqual(value, 1)
        }
    }

    func testPromiseAwait() throws {
        let promise = Promise<Int> {
            return 1
        }
        XCTAssertEqual(promise.await(), 1)
    }

    func testOptionalPromise() throws {
        let promise = Promise<Int?> {
            return nil
        }
        promise.then { value in
            XCTAssertNil(value)
        }
    }

    func testPromiseAwaitOperator() throws {
        let promise = Promise<Int> {
            return 1
        }
        XCTAssertEqual(promise~, 1)
    }

    func testPromiseThenOperator() throws {
        let promise = Promise<Int> {
            return 1
        }
        promise ~~ { value in
            XCTAssertEqual(value, 1)
        }
    }

}
