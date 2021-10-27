import XCTest
import SendBirdCalls
@testable import SendBirdCallsTarget

final class sendbird_calls_iosTests: XCTestCase {
    func test() throws {
        XCTAssertNotNil(SendBirdCall.sdkVersion)
    }
}
