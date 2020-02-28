//
//  Collection+MonoidTest.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2020/02/28.
//  Copyright © 2020 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class CollectionMonoidTest: XCTestCase {
	
	func testSumMonoid() {
		XCTAssertEqual([1, 2, 3, 4, 5].map(Sum.init).joined.run, 15)
		XCTAssertEqual([1.1, 2.2, 3.3].map(Sum.init).joined.run, 6.6)
		XCTAssertEqual([].map(Sum.init).joined.run, 0)
	}
	
	func testProductMonoid() {
		XCTAssertEqual([1, 2, 3, 4, 5].map(Product.init).joined.run, 120)
		XCTAssertEqual([1.1, 2.2, 3.3].map(Float.init).map(Product.init).joined.run, 1.1 * 2.2 * 3.3)
		XCTAssertEqual([Float]().map(Product.init).joined.run, 1)
	}
	
	func testStringMonoid() {
		XCTAssertEqual(["A", "p", "p", "l", "e"].joined, "Apple")
		XCTAssertEqual([String]().joined, "")
	}
	
	func testDualStringMonoid() {
		XCTAssertEqual(["A", "p", "p", "l", "e"].map(Dual.init).joined.run, "elppA")
		XCTAssertEqual([String]().map(Dual.init).joined.run, "")
	}
	
	func testAllMonoid() {
		XCTAssertEqual([true, true, true].map(All.init).joined.run, true)
		XCTAssertEqual([true, false, true].map(All.init).joined.run, false)
		XCTAssertEqual([].map(All.init).joined.run, true)
	}
	
	func testAnyMonoid() {
		XCTAssertEqual([false, false, false].map(`Any`.init).joined.run, false)
		XCTAssertEqual([true, false, true].map(`Any`.init).joined.run, true)
		XCTAssertEqual([].map(`Any`.init).joined.run, false)
	}
	
	func testOrdMonoid() {
		XCTAssertEqual([].joined, ComparisonResult.orderedSame)
		XCTAssertEqual([.orderedSame, .orderedSame, .orderedAscending].joined, ComparisonResult.orderedAscending)
		XCTAssertEqual([.orderedSame, .orderedDescending, .orderedSame].joined, ComparisonResult.orderedDescending)
		XCTAssertEqual([.orderedSame, .orderedSame, .orderedSame].joined, ComparisonResult.orderedSame)
	}
	
	func testCompareWithOrdMonoid() {
		// They should be same result
		XCTAssertEqual("apple".compare("application"), .orderedAscending)
		XCTAssertEqual("apple".zip("application").map { String($0).compare(String($1)) }.joined, .orderedAscending)
	}
	
	func testListMonoid() {
		XCTAssertEqual([[1], [2, 2], [3, 3, 3]].joined, [1, 2, 2, 3, 3, 3])
		XCTAssertEqual([[[1], [2, 2], [3, 3, 3]], [[1], [2, 2], [3, 3, 3]]].joined.joined, [1, 2, 2, 3, 3, 3, 1, 2, 2, 3, 3, 3])
	}
	
	func testDualListMonoid() {
		XCTAssertEqual([[1], [1, 2], [1, 2, 3]].map(Dual.init).joined.run, [1, 2, 3, 1, 2, 1])
	}
	
	func testMaybeMonoid() {
		XCTAssertEqual([Optional.some(Sum(1)), Optional.some(Sum(2)), Optional.some(Sum(3))].joined?.run, .some(6))
		XCTAssertEqual([Optional.some("Apple"), Optional.none, Optional.some("Computer")].joined, .some("AppleComputer"))
	}
	
	func testMaybeFirstMonoid() {
		XCTAssertEqual([FirstMaybe(.some(true)), FirstMaybe(.none), FirstMaybe(.some(false))].joined.run, .some(true))
		XCTAssertEqual([FirstMaybe<Int>(.none), FirstMaybe(.none), FirstMaybe(.none)].joined.run, .none)
	}
	
	func testMaybeLastMonoid() {
		XCTAssertEqual([LastMaybe(.some(true)), LastMaybe(.none), LastMaybe(.some(false))].joined.run, .some(false))
		XCTAssertEqual([FirstMaybe<Character>(.none), FirstMaybe(.none), FirstMaybe(.none)].joined.run, .none)
	}
	
	func testMaybeLastDualMonoid() {
		XCTAssertEqual([Dual(LastMaybe(.some(777))), Dual(LastMaybe(.none)), Dual(LastMaybe(.some(666)))].joined.run.run, .some(777))
	}
}
