//
//  Collection+SafeRandomAccess.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Collection {
	
	/// Returns an element by the given index.
	/// - Parameters:
	/// - index: The index
	/// - Returns: An element at the given index.
	/// - Example:
	/// ```
	/// let a = [1, 2, 3][safe: 2] // .some(3)
	/// let b = [1, 2, 3][safe: 4] // .none
	/// ```
	subscript(safe index: Index) -> Element? {
		guard indices.contains(index) else { return .none }
		return self[index]
	}
}

public extension Collection where Self.Element: Collection {
	
	/// Returns an element of 2 dimension collection by the given indexies.
	/// - Parameters:
	/// - i: The index of first dimension
	/// - j: The index of second dimension
	/// - Returns: An element at the given indexies.
	/// - Example:
	/// ```
	/// let a = [[1], [1, 2], [1, 2, 3]][safe: 2, 1] // .some(2)
	/// let b = [[1], [1, 2], [1, 2, 3]][safe: 1, 3] // .none
	/// ```
	subscript(safe i: Index, _ j: Self.Element.Index) -> Self.Element.Element? {
		guard indices.contains(i) else { return .none }
		guard self[i].indices.contains(j) else { return .none }
		return self[i][j]
	}
}

public extension Optional where Wrapped: Collection {
	
	/// Returns an element of a collection wrapped by the optional by the given indexies.
	/// - Parameters:
	/// - i: The index
	/// - Returns: An element at the given index.
	/// - Example:
	/// ```
	/// let a = [[[1]], [[1], [1, 2]], [[1], [1, 2], [1, 2, 3]]][safe: 2][2][1] // .some(2)
	/// let b = [[[1]], [[1], [1, 2]], [[1], [1, 2], [1, 2, 3]]][safe: 4][1][1] // .none
	/// ```
	subscript(_ index: Wrapped.Index) -> Wrapped.Element? {
		self?[safe: index]
	}
}
