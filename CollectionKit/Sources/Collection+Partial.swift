//
//  Collection+Partial.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Array {
	
	/// Divide the `Array` to two `SubSequence`s.
	/// - Parameters:
	/// 	- k: Where divide the `Array` at.
	/// - Returns: SubSequence before *k*th and after *k*th in a tuple.
	func divided(at k: Int) -> (SubSequence, SubSequence) {
		(self[startIndex..<k], self[k..<endIndex])
	}
}

public extension Collection {
	
	/// The head element and the tail elements in a tuple.
	///
	/// This is useful to implement something in Haskell-like way. (It's like pattern matching for the *list*.)
	///
	/// Example:
	/// ```
	/// guard let (x, xs) = [1, 2, 4, 8].splat else { return [] }
	/// ```
	var splat: (x: Element, xs: SubSequence)? {
		guard let x = first else { return .none }
		let xs = dropFirst()
		return (x, xs)
	}
	
	/// The 2 head element and the tail elements in a tuple.
	///
	/// This is useful to implement something in Haskell-like way. (It's like pattern matching for the *list*.)
	///
	/// Example:
	/// ```
	/// guard let (x, y, ys) = [1, 2, 4, 8].splat else { return [] }
	/// ```
	var splat2: (x: Element, y: Element, ys: SubSequence)? {
		guard let (x, xs) = splat, let y = xs.first else { return .none }
		let ys = xs.dropFirst()
		return (x, y, ys)
	}
	
	/// The 3 head element and the tail elements in a tuple.
	///
	/// This is useful to implement something in Haskell-like way. (It's like pattern matching for the *list*.)
	///
	/// Example:
	/// ```
	/// guard let (x, y, z, zs) = [1, 2, 4, 8].splat else { return [] }
	/// ```
	var splat3: (x: Element, y: Element, z: Element, zs: SubSequence)? {
		guard let (x, y, ys) = splat2, let z = ys.first else { return .none }
		let zs = ys.dropFirst()
		return (x, y, z, zs)
	}
}
