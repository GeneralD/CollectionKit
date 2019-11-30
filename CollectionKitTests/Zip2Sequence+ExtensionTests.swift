//
//  Zip2Sequence+ExtensionTests.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2019/11/30.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class Zip2SequenceExtensionTests: XCTestCase {
	
	func testDictionary() {
		let words = ["one", "two", "three", "four"]
		let numbers = 1...
		let d = words.zip(numbers).dictionary
		XCTAssertEqual(d["two"], 2)
		XCTAssertEqual(d["four"], 4)
		XCTAssertEqual(d["five"], nil)
	}
	
	func testDictionaryValueConflicted() {
		let words = ["one", "two", "one", "two", "one", "two"]
		let numbers = 1...
		let d = words.zip(numbers).dictionary
		XCTAssertEqual(d["one"], 5)
		XCTAssertEqual(d["two"], 6)
	}
	
	func testDictionaryMergeValue() {
		let words = ["one", "two", "one", "two", "one", "two"]
		let numbers = 1...
		let d = words.zip(numbers).dictionary(+)
		XCTAssertEqual(d["one"], 1 + 3 + 5)
		XCTAssertEqual(d["two"], 2 + 4 + 6)
	}
	
	func testDictionaryChooseValue() {
		let words = ["one", "two", "one", "two", "one", "two"]
		let numbers = 1...
		let d = words.zip(numbers).dictionary(<)
		XCTAssertEqual(d["one"], 1)
		XCTAssertEqual(d["two"], 2)
	}
}
