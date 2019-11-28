//
//  Collection+AggregationTests.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class CollectionAggregationTests: XCTestCase {

	private let a = [2, -69, 66, -18, 0, 7, 81]
	private let c = "Functional Programming is the best solution!"
	
    func testMax() {
		XCTAssertEqual(a.max, 81)
		XCTAssertEqual(a.most(>), a.most(max(_:_:)))
		XCTAssertEqual(c.most(>=), c.most(max(_:_:)))
    }

	func testMin() {
        XCTAssertEqual(a.min, -69)
		XCTAssertEqual(a.most(<), a.most(min(_:_:)))
		XCTAssertEqual(c.most(<=), c.most(min(_:_:)))
    }
	
	func testAll() {
		XCTAssertFalse(a.all { $0 < 0 })
		XCTAssertTrue(a.all { $0 < 100 })
    }
	
	func testAny() {
		XCTAssertTrue(a.any { $0 > 0 })
		XCTAssertFalse(a.any { $0 > 100 })
    }
}
