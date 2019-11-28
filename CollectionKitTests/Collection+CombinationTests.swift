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
}
