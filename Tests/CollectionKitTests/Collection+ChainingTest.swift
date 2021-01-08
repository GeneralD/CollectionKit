//
//  Collection+MethodChainingTest.swift
//  CollectionKitTests
//
//  Created by Yumenosuke Koukata on 2020/12/29.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import XCTest
@testable import CollectionKit

class CollectionChainingTest: XCTestCase {
	
	private struct Person {
		let name: String
		let age: Int
		let friends: [Person]
	}
	
	private let people: [Person] = [
		.init(name: "me", age: 32, friends: [
			.init(name: "Tom", age: 40, friends: [])
		]),
		.init(name: "you", age: 28, friends: [
			.init(name: "Nancy", age: 10, friends: []),
			.init(name: "Freddie", age: 20, friends: [
				.init(name: "Bob", age: 50, friends: [])
			])
		])
	]
	
	func testChaining() {
		XCTAssertEqual(people[].age, [32, 28])
		
		XCTAssertEqual(people[].friends[].name, ["Tom", "Nancy", "Freddie"])
		
		let bob = people[].friends[safe: 1]?[].friends[safe: 1]?[].name.first
		XCTAssertEqual(bob, "Bob")
		
		let him = people[].friends[1][].friends[1][].name.first
		XCTAssertEqual(him, "Bob")
	}
}
