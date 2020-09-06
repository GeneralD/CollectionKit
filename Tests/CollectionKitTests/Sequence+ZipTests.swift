//
//  Sequence+ZipTests.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2020/09/06.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class SequenceZipTests: XCTestCase {
	
	func testZip() {
		let first = [10, 100, 1000]
		let second = ["ten", "hundred", "thousand"]
		// zip extension method is just calling Swift.zip in the implementation.
		// Compare them to check if they are same.
		let zipped = first.zip(second)
		let swiftZipped = Swift.zip(first, second)
		XCTAssertTrue(Swift.zip(zipped, swiftZipped).allSatisfy(==))
	}
	
	func testCombined() {
		let numbers = 0..<10
		let ones = numbers.map { _ in 1 }
		let combined = ones.zip(numbers, resultSelector: <<)
		XCTAssertEqual(combined, [1, 2, 4, 8, 16, 32, 64, 128, 256, 512])
	}
	
	func testZip3() {
		let first = 1..<12 // length: 11
		let second = 3...8 // length: 6
		let third = 5...9 // length: 5
		let zipped = first.zip(second, third)
		XCTAssertEqual(zipped.description, [(1, 3, 5), (2, 4, 6), (3, 5, 7), (4, 6, 8), (5, 7, 9)].description)
	}
	
	func testZip4() {
		let first = 1..<12 // length: 11
		let second = 3...8 // length: 6
		let third = 5...9 // length: 5
		let forth = 2... // infinity
		let zipped = first.zip(second, third, forth)
		XCTAssertEqual(zipped.description, [(1, 3, 5, 2), (2, 4, 6, 3), (3, 5, 7, 4), (4, 6, 8, 5), (5, 7, 9, 6)].description)
	}
	
	func testZip5() {
		let first = 1...5
		let second = 2...
		let third = 3...
		let forth = 4...
		let fifth = 5...
		let zipped = first.zip(second, third, forth, fifth)
		XCTAssertEqual(zipped.description, [(1, 2, 3, 4, 5), (2, 3, 4, 5, 6), (3, 4, 5, 6, 7), (4, 5, 6, 7, 8), (5, 6, 7, 8, 9)].description)
	}
	
	func testZip6() {
		let first = 1...5
		let second = 2...
		let third = 3...
		let forth = 4...
		let fifth = 5...
		let sixth = 6...
		let zipped = first.zip(second, third, forth, fifth, sixth)
		XCTAssertEqual(zipped.description, [(1, 2, 3, 4, 5, 6), (2, 3, 4, 5, 6, 7), (3, 4, 5, 6, 7, 8), (4, 5, 6, 7, 8, 9), (5, 6, 7, 8, 9, 10)].description)
	}
}
