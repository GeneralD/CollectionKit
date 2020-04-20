//
//  Sequence+CommonTest.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2019/12/08.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class SequenceCommonTest: XCTestCase {
	
	func testArray() {
		XCTAssertEqual((1...3).array, [1, 2, 3])
	}
	
	func testFlatten() {
		XCTAssertEqual([[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]].flatten, (1...10).array)
	}
}
