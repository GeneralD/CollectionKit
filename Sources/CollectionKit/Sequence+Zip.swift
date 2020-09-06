//
//  Sequence+Zip.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2020/09/05.
//  Copyright © 2020 ZYXW. All rights reserved.
//

public extension Sequence {
	
	/// Creates a sequence of pairs built out of two underlying sequences.
	///
	/// In the `Zip2Sequence` instance returned by this function, the elements of
	/// the *i*th pair are the *i*th elements of each underlying sequence. The
	/// following example uses the `zip(_:)` function to iterate over an array
	/// of strings and a countable range at the same time:
	///	```
	/// let words = ["one", "two", "three", "four"]
	/// let numbers = 1...4
	///
	/// for (word, number) in words.zip(numbers) {
	///     print("\(word): \(number)")
	/// }
	/// // Prints "one: 1"
	/// // Prints "two: 2
	/// // Prints "three: 3"
	/// // Prints "four: 4"
	/// ```
	/// If the sequence passed to `zip(_:)` is different length from this sequence,
	/// the resulting sequence is the same length as the shorter sequence. In this
	/// example, the resulting array is the same length as `words`:
	/// ```
	/// let naturalNumbers = 1...Int.max
	/// let zipped = Array(words.zip(naturalNumbers))
	/// // zipped == [("one", 1), ("two", 2), ("three", 3), ("four", 4)]
	/// ```
	/// - Parameters:
	///   - another: The second sequence or collection to zip.
	/// - Returns: A sequence of tuple pairs, where the elements of each pair are
	///   corresponding elements of `sequence1` and `sequence2`.
	func zip<Another: Sequence>(_ another: Another) -> Zip2Sequence<Self, Another> {
		Swift.zip(self, another)
	}
	
	/// Create a sequence with elements that combines each element from two sequences.
	///
	/// example:
	/// ```
	/// let combined = [1, 2, 3].zip([2, 3, 4], resultSelector: +)
	/// // combined == [3, 5, 7]
	/// ```
	/// - Parameters:
	///   - another: The second sequence or collection to zip.
	///   - resultSelector: Selector to combine the elements.
	///   - lhs: An element in receiver sequence.
	///   - rhs: An element in sender sequence.
	/// - Returns: Combined sequence.
	func zip<Another: Sequence, Result>(_ another: Another, resultSelector: (_ lhs: Element, _ rhs: Another.Element) -> Result) -> [Result] {
		zip(another).map(resultSelector)
	}
	
	/// Creates a sequence of triplets built out of three underlying sequences.
	/// - Parameters:
	///   - a: The second sequence or collection to zip.
	///   - b: The third sequence or collection to zip.
	/// - Returns: A sequence of tuple triplets.
	func zip<A: Sequence, B: Sequence>(_ a: A, _ b: B) -> [(Element, A.Element, B.Element)] {
		zip(a).zip(b).map {
			let ((e0, e1), e2) = $0
			return (e0, e1, e2)
		}
	}
	
	/// Creates a sequence of quartets built out of four underlying sequences.
	/// - Parameters:
	///   - a: The second sequence or collection to zip.
	///   - b: The third sequence or collection to zip.
	///   - c: The fourth sequence or collection to zip.
	/// - Returns: A sequence of tuple quartets.
	func zip<A: Sequence, B: Sequence, C: Sequence>(_ a: A, _ b: B, _ c: C) -> [(Element, A.Element, B.Element, C.Element)] {
		zip(a, b).zip(c).map {
			let ((e0, e1, e2), e3) = $0
			return (e0, e1, e2, e3)
		}
	}
	
	/// Creates a sequence of quintets built out of four underlying sequences.
	/// - Parameters:
	///   - a: The second sequence or collection to zip.
	///   - b: The third sequence or collection to zip.
	///   - c: The fourth sequence or collection to zip.
	///   - d: The fifth sequence or collection to zip.
	/// - Returns: A sequence of tuple quintets.
	func zip<A: Sequence, B: Sequence, C: Sequence, D: Sequence>(_ a: A, _ b: B, _ c: C, _ d: D) -> [(Element, A.Element, B.Element, C.Element, D.Element)] {
		zip(a, b, c).zip(d).map {
			let ((e0, e1, e2, e3), e4) = $0
			return (e0, e1, e2, e3, e4)
		}
	}
	
	/// Creates a sequence of sextets built out of four underlying sequences.
	/// - Parameters:
	///   - a: The second sequence or collection to zip.
	///   - b: The third sequence or collection to zip.
	///   - c: The fourth sequence or collection to zip.
	///   - d: The fifth sequence or collection to zip.
	///   - e: The sixth sequence or collection to zip.
	/// - Returns: A sequence of tuple sextets.
	func zip<A: Sequence, B: Sequence, C: Sequence, D: Sequence, E: Sequence>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E) -> [(Element, A.Element, B.Element, C.Element, D.Element, E.Element)] {
		zip(a, b, c, d).zip(e).map {
			let ((e0, e1, e2, e3, e4), e5) = $0
			return (e0, e1, e2, e3, e4, e5)
		}
	}
}
