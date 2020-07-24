//
//  Collection+ConditionTests.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2019/12/07.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class CollectionConditionTests: XCTestCase {
	
	private let a = [2, -69, 66, -18, 0, 7, 81]
	
	func testAll() {
		XCTAssertFalse(a.all { $0 < 0 })
		XCTAssertTrue(a.all { $0 < 100 })
	}
	
	func testAny() {
		XCTAssertTrue(a.any { $0 > 0 })
		XCTAssertFalse(a.any { $0 > 100 })
	}
}
