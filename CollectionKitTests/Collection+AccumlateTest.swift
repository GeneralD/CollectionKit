//
//  Collection+AccumlateTest.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2019/12/07.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class CollectionAccumlateTest: XCTestCase {
	
	func testReduce2() {
		XCTAssertEqual((1..<10).reduce(
			"", { "\($0) \($1)" },
			"", { "\($0) \($1 * 10)" }, +), " 1 2 3 4 5 6 7 8 9 10 20 30 40 50 60 70 80 90")
	}
	
	func testReduce3() {
		let mult: (Int, Int) -> Int = (*) // To avoid: `The compiler is unable to type-check this expression in reasonable`
		XCTAssertEqual((1...4).reduce(1, mult, 100, mult, 10000, mult) { $0 + $1 + $2 }, 242424)
	}
}
