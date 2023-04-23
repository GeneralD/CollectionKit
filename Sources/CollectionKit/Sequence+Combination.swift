//
//  Sequence+Combination.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Sequence {
	
	/// Get all combinations of `n` in this sequence.
	///
	/// Example:
	/// ```
	/// let a = (1...5).combinations(of: 3)
	/// // [[1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5], [1, 4, 5], [2, 3, 4], [2, 3, 5], [2, 4, 5], [3, 4, 5]]
	/// ```
	/// - Parameter n: Count of elements in every combination.
	/// - Returns: All combinations in an `Array`.
	func combinations(of n: Int) -> [[Element]] {
		guard n > 1 else { return map { [$0] } }
		guard let x = first else { return [] }
		let xs = dropFirst()
		return xs.combinations(of: n - 1).map { [x] + $0 } + xs.combinations(of: n)
	}
	
	/// Get all pairs in this sequence.
	///
	/// Example:
	/// ```
	/// let pairs = (1...5).pairs
	/// // [(1, 2), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (2, 5), (3, 4), (3, 5), (4, 5)]
	/// ```
	var pairs: [(Element, Element)] {
		guard let x = first else { return [] }
		let xs = dropFirst()
		return xs.map { (x, $0) } + xs.pairs
	}
}
