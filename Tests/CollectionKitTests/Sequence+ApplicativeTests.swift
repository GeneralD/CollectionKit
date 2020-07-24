//
//  Sequence+ApplicativeTests.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2020/04/20.
//  Copyright © 2020 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class SequenceApplicativeTests: XCTestCase {
	
	func testApply1arg() {
		XCTAssertEqual([1, 2, 3].apply([(-), (+)]), [-1, -2, -3, 1, 2, 3])
	}
}
