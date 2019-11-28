//
//  Collection+Aggregation.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

// MARK: - Find Best

public extension Collection {
	
	/// Find the best of what you need.
	/// - Parameters:
	/// 	- more: Returns an element which is more of two.
	/// 	- lhs: Compared an element
	/// 	- rhs: Another element
	/// - Throws: Error which is occurred in predicate is going to be rethrown
	/// - Returns: Best one
	/// - Complexity: O(n), where n is the length of the sequence.
	func most(_ more: (_ lhs: Element, _ rhs: Element) throws -> Element) rethrows -> Element? {
		guard let fst = first else { return nil }
		return try reduce(fst, more)
	}
	
	/// Find the best of what you need.
	/// - Parameters:
	/// 	- more: Returns `true` to choose `lhs`, otherwise `rhs`
	/// 	- lhs: Compared an element
	/// 	- rhs: Another element
	/// - Throws: Error which is occurred in predicate is going to be rethrown
	/// - Returns: Best one
	/// - Complexity: O(n), where n is the length of the sequence.
	func most(_ more: (_ lhs: Element, _ rhs: Element) throws -> Bool) rethrows -> Element? {
		try most { try more($0, $1) ? $0 : $1 }
	}
}

public extension Collection where Element: Comparable {
	
	var max: Element? {
		most(max(_:_:))
	}
	
	var min: Element? {
		most(min(_:_:))
	}
}

// MARK: - Check Condition

public extension Collection {
	
	/// Check if every element passes the condition
	/// - Parameters:
	/// 	- condition: If the element passes the condition
	/// 	- element: Iterated element
	/// - Throws: Error which is occurred in predicate is going to be rethrown
	/// - Returns: If every element passes the condition
	/// - Complexity: Maximum O(n), where n is the length of the sequence.
	func all(_ condition: (_ element: Element) throws -> Bool) rethrows -> Bool {
		try first { try !condition($0) } == nil
	}
	
	/// Check if any element passes the condition
	/// - Parameters:
	/// 	- condition: If the element passes the condition
	/// 	- element: Iterated element
	/// - Throws: Error which is occurred in predicate is going to be rethrown
	/// - Returns: If any element passes the condition
	/// - Complexity: Maximum O(n), where n is the length of the sequence.
	func any(_ condition: (Element) throws -> Bool) rethrows -> Bool {
		try first { try condition($0) } != nil
	}
}