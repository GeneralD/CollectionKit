//
//  Collection+SafeRandomAccessTests.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class CollectionSafeRandomAccessTests: XCTestCase {
	
	func testSafeAccess1Dimension() {
		XCTAssertEqual([1, 2, 3][safe: 2], 3)
		XCTAssertEqual([1, 2, 3][safe: 4], nil)
	}
	
	func testSafeAccess2Dimensions() {
		XCTAssertEqual([[1], [1, 2], [1, 2, 3]][safe: 2, 1], 2)
		XCTAssertEqual([[1], [1, 2], [1, 2, 3]][safe: 1, 3], nil)
	}
	
	func testSafeAccess3Dimensions() {
		XCTAssertEqual([[[1]], [[1], [1, 2]], [[1], [1, 2], [1, 2, 3]]][safe: 2][2][1], 2)
		XCTAssertEqual([[[1]], [[1], [1, 2]], [[1], [1, 2], [1, 2, 3]]][safe: 4][1][1], nil)
	}
}
