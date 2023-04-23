//
//  Sequence+CollectionMethods.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2023/04/23.
//  Copyright © 2022 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class SequenceCollectionMethodsTests: XCTestCase {

	private let seq1: any Sequence<Int> = [2, -69, 66, -18, 0, 7, 81]
	private let seq2: any Sequence<Int> = []

	func testFirst() {
		XCTAssertEqual(seq1.first, 2)
		XCTAssertEqual(seq2.first, nil)
	}

	func testIsEmpty() {
		XCTAssertEqual(seq1.isEmpty, false)
		XCTAssertEqual(seq2.isEmpty, true)
	}
}
