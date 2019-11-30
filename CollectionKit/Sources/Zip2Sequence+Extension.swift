//
//  Zip2Sequence+Extension.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/11/30.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Sequence {
	
	/// Creates a sequence of pairs built out of two underlying sequences.
	///
	/// In the `Zip2Sequence` instance returned by this function, the elements of
	/// the *i*th pair are the *i*th elements of each underlying sequence. The
	/// following example uses the `zip(_:)` function to iterate over an array
	/// of strings and a countable range at the same time:
	///
	///     let words = ["one", "two", "three", "four"]
	///     let numbers = 1...4
	///
	///     for (word, number) in words.zip(numbers) {
	///         print("\(word): \(number)")
	///     }
	///     // Prints "one: 1"
	///     // Prints "two: 2
	///     // Prints "three: 3"
	///     // Prints "four: 4"
	///
	/// If the sequence passed to `zip(_:)` is different length from this sequence,
	/// the resulting sequence is the same length as the shorter sequence. In this
	/// example, the resulting array is the same length as `words`:
	///
	///     let naturalNumbers = 1...Int.max
	///     let zipped = Array(words.zip(naturalNumbers))
	///     // zipped == [("one", 1), ("two", 2), ("three", 3), ("four", 4)]
	///
	/// - Parameters:
	///   - another: The second sequence or collection to zip.
	/// - Returns: A sequence of tuple pairs, where the elements of each pair are
	///   corresponding elements of `sequence1` and `sequence2`.
	func zip<Another: Sequence>(_ another: Another) -> Zip2Sequence<Self, Another> {
		Swift.zip(self, another)
	}
}

public extension Zip2Sequence where Sequence1.Element: Hashable {
	
	/// Create `Dictionary` from this `Zip2Sequence` instance.
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
	/// Every tuple in this instance will be key and value of the `Dictionary`.
	/// If the `Sequence1` has duplicated element, it chooses later element in `Sequence2` as the value.
	/// - Returns: Created dictionary
	var dictionary: [Sequence1.Element: Sequence2.Element] {
		dictionary { _, later in later }
	}
}
