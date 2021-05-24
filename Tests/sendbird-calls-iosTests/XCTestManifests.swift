import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(sendbird_calls_iosTests.allTests),
    ]
}
#endif
