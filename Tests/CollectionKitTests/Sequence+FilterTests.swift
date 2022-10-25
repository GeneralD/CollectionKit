//
//  Sequence+FilterTests.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2022/10/25.
//  Copyright © 2022 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class SequenceFilterTests: XCTestCase {

	func testUnless() {
		XCTAssertEqual(["A", "B", "C", ""].unless(\.isEmpty), ["A", "B", "C"])
		XCTAssertEqual([true, false, true].unless(!), [true, true])
	}

	func testBoolFilter() {
		XCTAssertEqual([true, false, true].filter(), [true, true])
	}
}
