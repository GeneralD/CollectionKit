//
//  Zip2Sequence+Extension.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/11/30.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Zip2Sequence where Sequence1.Element: Hashable {
	
	/// Create `Dictionary` from this `Zip2Sequence` instance.
	///
	/// Every tuple in this instance will be key and value of the `Dictionary`.
	/// If the `Sequence1` has duplicated element, their `Sequence2` values are going to be merged.
	/// - Parameters:
	///     - mergeValues: Returns merge result of two
	///     - lhs: Earlier element in Sequence2
	///     - rhs: Later element in Sequence2
	/// - Throws: Error which is occurred in predicate is going to be rethrown
	/// - Returns: Created dictionary
	func dictionary(_ mergeValues: (_ lhs: Sequence2.Element, _ rhs: Sequence2.Element) throws -> Sequence2.Element) rethrows -> [Sequence1.Element: Sequence2.Element] {
		try reduce(into: [:]) { accum, t in
			accum[t.0] = try accum[t.0].map { try mergeValues($0, t.1) } ?? t.1
		}
	}
	
	/// Create `Dictionary` from this `Zip2Sequence` instance.
	///
	/// Every tuple in this instance will be key and value of the `Dictionary`.
	/// If the `Sequence1` has duplicated element, either one of two in `Sequence2` is going to be chosen as the value.
	/// - Parameters:
	///     - chooseValue: Returns `true` to choose left, otherwise right
	///     - lhs: Earlier element in Sequence2
	///     - rhs: Later element in Sequence2
	/// - Throws: Error which is occurred in predicate is going to be rethrown
	/// - Returns: Created dictionary
	func dictionary(_ chooseValue: (_ lhs: Sequence2.Element, _ rhs: Sequence2.Element) throws -> Bool) rethrows -> [Sequence1.Element: Sequence2.Element] {
		try dictionary { try chooseValue($0, $1) ? $0 : $1 }
	}
	
	/// Create `Dictionary` from this `Zip2Sequence` instance.
	///
	/// Every tuple in this instance will be key and value of the `Dictionary`.
	/// If the `Sequence1` has duplicated element, it chooses later element in `Sequence2` as the value.
	/// - Returns: Created dictionary
	var dictionary: [Sequence1.Element: Sequence2.Element] {
		dictionary { _, later in later }
	}
}
