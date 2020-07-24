//
//  Collection+Condition.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/12/07.
//  Copyright © 2019 ZYXW. All rights reserved.
//

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
