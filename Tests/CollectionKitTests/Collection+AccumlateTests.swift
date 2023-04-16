//
//  Collection+AccumlateTests.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2019/12/07.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class CollectionAccumlateTests: XCTestCase {
	
	func testReduce2() {
		XCTAssertEqual((1..<10).reduce(
			"", { "\($0) \($1)" },
			"", { "\($0) \($1 * 10)" }, +), " 1 2 3 4 5 6 7 8 9 10 20 30 40 50 60 70 80 90")
	}
	
	func testReduce3() {
		let mult: (Int, Int) -> Int = (*) // To avoid: `The compiler is unable to type-check this expression in reasonable`
		XCTAssertEqual((1...4).reduce(1, mult, 100, mult, 10000, mult) { $0 + $1 + $2 }, 242424)
	}

	func testReduceInto2() {
		let tuple = (1...10).reduce(into: 0, 1) { s, t, elem in
			s += elem
			t *= elem
		}
		XCTAssertEqual(tuple.0, 55)
		XCTAssertEqual(tuple.1, 3628800)
	}

	func testReduceInto3() {
		let tuple = (1...10).reduce(into: 0, 1, "") { s, t, u, elem in
			s += elem
			t *= elem
			u += elem.description
		}
		XCTAssertEqual(tuple.0, 55)
		XCTAssertEqual(tuple.1, 3628800)
		XCTAssertEqual(tuple.2, "12345678910")
	}

	func testReduceInto4() {
		let tuple = (1...10).reduce(into: 0, 1, "", 1) { s, t, u, v, elem in
			s += elem
			t *= elem
			u += elem.description
			v <<= 1
		}
		XCTAssertEqual(tuple.0, 55)
		XCTAssertEqual(tuple.1, 3628800)
		XCTAssertEqual(tuple.2, "12345678910")
		XCTAssertEqual(tuple.3, 1024)
	}

	func testReduceInto5() {
		let tuple = (1...10).reduce(into: 0, 1, "", 1, 2) { s, t, u, v, w, elem in
			s += elem
			t *= elem
			u += elem.description
			v <<= 1
			w <<= 1
		}
		XCTAssertEqual(tuple.0, 55)
		XCTAssertEqual(tuple.1, 3628800)
		XCTAssertEqual(tuple.2, "12345678910")
		XCTAssertEqual(tuple.3, 1024)
		XCTAssertEqual(tuple.4, 2048)
	}

	func testReduceInto6() {
		let tuple = (1...10).reduce(into: 0, 1, "", 1, 2, 1.0) { s, t, u, v, w, x, elem in
			s += elem
			t *= elem
			u += elem.description
			v <<= 1
			w <<= 1
			x /= 2
		}
		XCTAssertEqual(tuple.0, 55)
		XCTAssertEqual(tuple.1, 3628800)
		XCTAssertEqual(tuple.2, "12345678910")
		XCTAssertEqual(tuple.3, 1024)
		XCTAssertEqual(tuple.4, 2048)
		XCTAssertEqual(tuple.5, 0.0009765625)
	}

	func testReduceInto7() {
		let tuple = (1...10).reduce(into: 0, 1, "", 1, 2, 1.0, "") { s, t, u, v, w, x, y, elem in
			s += elem
			t *= elem
			u += elem.description
			v <<= 1
			w <<= 1
			x /= 2
			y = [elem.description, y].unless(\.isEmpty).joined(separator: " ")
		}
		XCTAssertEqual(tuple.0, 55)
		XCTAssertEqual(tuple.1, 3628800)
		XCTAssertEqual(tuple.2, "12345678910")
		XCTAssertEqual(tuple.3, 1024)
		XCTAssertEqual(tuple.4, 2048)
		XCTAssertEqual(tuple.5, 0.0009765625)
		XCTAssertEqual(tuple.6, "10 9 8 7 6 5 4 3 2 1")
	}

	func testReduceInto8() {
		let tuple = (1...10).reduce(into: 0, 1, "", 1, 2, 1.0, "", "") { s, t, u, v, w, x, y, z, elem in
			s += elem
			t *= elem
			u += elem.description
			v <<= 1
			w <<= 1
			x /= 2
			if elem.isMultiple(of: 2) {
				y += elem.description
			} else {
				z += elem.description
			}
		}
		XCTAssertEqual(tuple.0, 55)
		XCTAssertEqual(tuple.1, 3628800)
		XCTAssertEqual(tuple.2, "12345678910")
		XCTAssertEqual(tuple.3, 1024)
		XCTAssertEqual(tuple.4, 2048)
		XCTAssertEqual(tuple.5, 0.0009765625)
		XCTAssertEqual(tuple.6, "246810")
		XCTAssertEqual(tuple.7, "13579")
	}
}
