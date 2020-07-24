//
//  Dictionary+FlatMapTests.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class DictionaryFlatMapTests: XCTestCase {
	
	let d1 = ["banana": 6, "gorilla": 7, "ola": 3]
	
	func testDictionaryFlatMap1() {
		let correct = ["banana1": 7, "banana2": 8, "banana3": 9, "banana4": 10, "banana5": 11, "banana6": 12,
					   "gorilla1": 8, "gorilla2": 9, "gorilla3": 10, "gorilla4": 11, "gorilla5": 12, "gorilla6": 13, "gorilla7": 14,
					   "ola1": 4, "ola2": 5, "ola3": 6]
		XCTAssertEqual(d1.flatMap { k, v in (1...k.count).reduce(into: [:]) { $0["\(k)\($1)"] = v + $1 }}, correct)
	}
	
	func testDictionaryFlatMap2() {
		let correct = ["banana": 216, "gorilla": 343, "ola": 27]
		XCTAssertEqual(d1.flatMap(uniquingKeysWith: *) { _, _ in d1 }, correct)
	}
}
