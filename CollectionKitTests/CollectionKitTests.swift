//
//  CollectionKitTests.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class CollectionKitTests: XCTestCase {

	private let a = [1, 2, 3, 4, 5]
	private lazy var b = a.filter(odd)
	
	private func odd(_ n: Int) -> Bool { return n % 2 == 1 }
	
	func testFilterMList() {
		XCTAssertEqual(a.filterM { _ in [true, false] }, [[1, 2, 3, 4, 5], [1, 2, 3, 4], [1, 2, 3, 5], [1, 2, 3], [1, 2, 4, 5], [1, 2, 4], [1, 2, 5], [1, 2], [1, 3, 4, 5], [1, 3, 4], [1, 3, 5], [1, 3], [1, 4, 5], [1, 4], [1, 5], [1], [2, 3, 4, 5], [2, 3, 4], [2, 3, 5], [2, 3], [2, 4, 5], [2, 4], [2, 5], [2], [3, 4, 5], [3, 4], [3, 5], [3], [4, 5], [4], [5], []])
		XCTAssertEqual(a.filterM { e in [self.odd(e), false] }, [[1, 3, 5], [1, 3], [1, 3, 5], [1, 3], [1, 5], [1], [1, 5], [1], [1, 3, 5], [1, 3], [1, 3, 5], [1, 3], [1, 5], [1], [1, 5], [1], [3, 5], [3], [3, 5], [3], [5], [], [5], [], [3, 5], [3], [3, 5], [3], [5], [], [5], []])
	}
	
	func testFilterMaybe() {
		XCTAssertEqual(a.filterM { _ -> Maybe<Bool> in true }, .some(a))
		XCTAssertEqual(a.filterM { e -> Maybe<Bool> in self.odd(e) }, .some(b))
		XCTAssertEqual(a.filterM { _ -> Maybe<Bool> in .none }, .none)
	}
	
	func testFilterEither() {
		XCTAssertEqual(a.filterM { _ -> SEither<Bool> in .success(true) }, .success(a))
		XCTAssertEqual(a.filterM { e -> SEither<Bool> in .success(self.odd(e)) }, .success(b))
		XCTAssertEqual(a.filterM { _ -> SEither<Bool> in .failure("Error") }, .failure("Error"))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension String: Error {}
fileprivate typealias SEither<T> = Either<String, T>
