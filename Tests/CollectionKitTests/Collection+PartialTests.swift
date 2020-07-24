//
//  Collection+PartialTests.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class CollectionPartialTests: XCTestCase {
	
	private func sum(_ ary: [Int]) -> Int {
		guard let (x, xs) = ary.splat else { return 0 }
		return x + sum(xs.map { $0 })
	}
	
	func testSplat() {
		let (x, xs) = [1, 2, 3, 4, 5].splat!
		XCTAssertEqual(x, 1)
		XCTAssertEqual(xs, [2, 3, 4, 5])
		XCTAssertEqual(sum((1...100).map { $0 }), 5050)
	}
	
	func testSplat2() {
		let (x, y, ys) = [1, 2, 3, 4, 5].splat2!
		XCTAssertEqual(x, 1)
		XCTAssertEqual(y, 2)
		XCTAssertEqual(ys, [3, 4, 5])
	}
	
	func testSplat3() {
		let (x, y, z, zs) = [1, 2, 3, 4, 5].splat3!
		XCTAssertEqual(x, 1)
		XCTAssertEqual(y, 2)
		XCTAssertEqual(z, 3)
		XCTAssertEqual(zs, [4, 5])
	}
	
	func testDevided () {
		XCTAssertEqual([1, 2, 3, 4, 5].divided(at: 3).1.first, 4)
	}
}
