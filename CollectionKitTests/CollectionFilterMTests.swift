//
//  CollectionKitTests.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class CollectionFilterMTests: XCTestCase {

	private let a = [1, 2, 3, 4, 5]
	
	private func odd(_ n: Int) -> Bool { return n % 2 == 1 }
	
	func testFilterM
	
    func testExample() {
		// Debug

		print(a.filterM { _ in [true, false] } )

		print(a.filterM { e in [odd(e), false] } )

		print(a.filterM { _ -> Maybe<Bool> in true } as Any)

		print(a.filterM { e -> Maybe<Bool> in odd(e) } as Any)

		print(a.filterM { _ -> Maybe<Bool> in .none } as Any)

		print(a.filterM { _ -> Either<Error, Bool> in .success(true) } )

		print(a.filterM { e -> Either<Error, Bool> in .success(odd(e)) } )

		extension String: Error {}

		print(a.filterM { _ -> Either<String, Bool> in .failure("Error") } )

		print(a.filterM { _ -> Reader<Void, Bool> in .init { _ in true } }.run(()))

		print(a.filterM { i -> Reader<Void, Bool> in .init { _ in odd(i) } }.run(()))

		print(a.filterM { i -> Reader<Int, Bool> in .init { j in odd(i + j) } }.run(1))

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
