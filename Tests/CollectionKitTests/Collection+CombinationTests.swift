//
//  Collection+CombinationTests.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class CollectionCombinationTests: XCTestCase {
	
	private let a = 1...5
	
	func testCombinations() {
		let correct = [[1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5], [1, 4, 5], [2, 3, 4], [2, 3, 5], [2, 4, 5], [3, 4, 5]]
		XCTAssertEqual(a.combinations(of: 3), correct)
	}
	
	func testPairs() {
		let correct = [(1, 2), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (2, 5), (3, 4), (3, 5), (4, 5)]
		XCTAssertEqual(a.pairs.map { [$0.0, $0.1] }, correct.map { [$0.0, $0.1] })
	}
	
	func testExample() {
		func sub<T: AdditiveArithmetic>(_ t: (T, T)) -> T {
			t.1 - t.0
		}
		
		// Facebook coding problem
		func profit(prices p: [Int], k: Int) -> Int {
			guard k > 0 else { return 0 }
			return (0...p.count).map(p.divided(at:)).map { a, b in
				let maxA = a.pairs.map(sub).max ?? 0
				let maxB = profit(prices: b.map { $0 }, k: k - 1)
				return maxA + maxB
			}.max ?? 0
		}
		
		let prices = [0, 2, 7, 4, 9, 12, 1, 1, 4, 8, 3, 9]
		XCTAssertEqual(profit(prices: prices, k: 2), 20)
		XCTAssertEqual(profit(prices: prices, k: 3), 25)
		XCTAssertEqual(profit(prices: prices, k: 4), 28)
	}
}
