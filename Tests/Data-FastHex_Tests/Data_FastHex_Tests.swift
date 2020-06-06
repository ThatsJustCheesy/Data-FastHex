// Data+FastHex.h
// Originally created by Jonathon Mah on 2015-05-14.
// Modified by Ian Gregory.
// Copyright (c) 2015 Jonathon Mah. All rights reserved.

import Cocoa
import XCTest
@testable import Data_FastHex

class SwiftTests: XCTestCase {
    func testSimpleEncodingDecoding_Data() {
        let bytes: [UInt8] = [0xDE, 0xAD, 0xBE, 0xEF, 0x42]
        let data = Data(bytes: bytes, count: bytes.count)

        let hexString = data.hexStringRepresentation
        XCTAssertEqual(hexString, "DEADBEEF42")

        let decoded = Data(hexString: hexString)
        XCTAssertEqual(decoded, data)
    }
	
    func testSimpleEncodingDecoding_NSData() {
        let bytes: [UInt8] = [0xDE, 0xAD, 0xBE, 0xEF, 0x42]
        let data = NSData(bytes: bytes, length: bytes.count)

        let hexString = data.hexStringRepresentation
        XCTAssertEqual(hexString, "DEADBEEF42")

        let decoded = NSData(hexString: hexString)
        XCTAssertEqual(decoded, data)
    }

    static var allTests = [
        ("testSimpleEncodingDecoding_Data", testSimpleEncodingDecoding_Data),
        ("testSimpleEncodingDecoding_NSData", testSimpleEncodingDecoding_NSData),
    ]
}
