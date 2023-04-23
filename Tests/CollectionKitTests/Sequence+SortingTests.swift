//
//  Sequence+SortingTests.swift
//  
//
//  Created by Yumenosuke Koukata on 2020/10/22.
//

import Foundation

import XCTest
@testable import CollectionKit

class SequenceSortingTests: XCTestCase {
	
	private struct Genius: Equatable {
		let id: Int
		let name: String
		let age: Int
	}
	
	private let geniuses: [Genius] = [.init(id: 1, name: "Alexa", age: 15), .init(id: 2, name: "Google", age: 20), .init(id: 3, name: "Siri", age: 30), .init(id: 4, name: "Clova", age: 5)]
	
	func testSortedAt() {
		XCTAssertEqual(geniuses.sorted(at: \.age, by: >).map(\.id), [3, 2, 1, 4])
	}
	
	func testAscended() {
		XCTAssertEqual(geniuses.ascended(at: \.name).map(\.id), [1, 4, 2, 3])
		XCTAssertEqual(geniuses.map(\.name).ascended, ["Alexa", "Clova", "Google", "Siri"])
	}
	
	func testDescended() {
		XCTAssertEqual(geniuses.descended(at: \.name).map(\.id), [3, 2, 4, 1])
		XCTAssertEqual(geniuses.map(\.name).descended, ["Siri", "Google", "Clova", "Alexa"])
	}
}
