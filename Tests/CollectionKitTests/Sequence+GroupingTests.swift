//
//  Sequence+GroupingTests.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2020/04/20.
//  Copyright © 2020 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class SequenceGroupingTests: XCTestCase {
	
	func testGroup() {
		XCTAssertEqual((0..<100).group { $0 % 10 } [3], [3, 13, 23, 33, 43, 53, 63, 73, 83, 93])
		XCTAssertEqual((0..<100).group { $0 / 10 } [3], [30, 31, 32, 33, 34, 35, 36, 37, 38, 39])
	}
}
