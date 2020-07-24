//
//  Collection+Buffer.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/12/08.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Collection {
	
	/// Make groups from neighboring elements in the array
	///
	/// /// Example:
	/// ```
	/// let b1 = (1...10).buffer(count: 3)
	/// // [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]
	/// let b2 = (1...10).buffer(count: 3, skip: 2)
	/// // [[1, 2, 3], [3, 4, 5], [5, 6, 7], [7, 8, 9], [9, 10]]
	/// let b3 = (1...10).buffer(count: 2, skip: 3)
	/// // [[1, 2], [4, 5], [7, 8], [10]]
	/// ```
	///
	/// - Parameters:
	///   - count: Number of elements in a group
	///   - skip: Next group starts from *skip*th element after previous group's initial element
	func buffer(count: Int, skip: Int? = nil) -> [[Element]] {
		guard !isEmpty else { return [] }
		return [prefix(count).array] + dropFirst(skip ?? count).buffer(count: count, skip: skip)
	}
}
