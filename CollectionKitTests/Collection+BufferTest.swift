//
//  Collection+BufferTest.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2019/12/08.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class CollectionBufferTest: XCTestCase {

	func testBuffer() {
		XCTAssertEqual((1...10).buffer(count: 3), [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]])
		XCTAssertEqual((1...10).buffer(count: 3, skip: 2), [[1, 2, 3], [3, 4, 5], [5, 6, 7], [7, 8, 9], [9, 10]])
		XCTAssertEqual((1...10).buffer(count: 2, skip: 3), [[1, 2], [4, 5], [7, 8], [10]])
	}
}
