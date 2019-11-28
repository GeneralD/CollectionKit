//
//  Dictionary+FlatMap.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

import Foundation

public extension Dictionary {
	
	/// This flatMap is alternative of Sfift's one
	/// - Parameters:
	/// 	- merge: If the dictionaries which are going to be returned by `transform` have duplicated key, the values are going to be merged with this method.
	/// 	- transform: To create Dictionary with an iterated pair
	/// 	- pair: Iterated key and value
	/// 		- key: Iterated key
	/// 		- value: Iterated value
	/// - Throws: Error which is occurred in predicate is going to be rethrown
	/// - Returns:
	/// 	- Flatten Dictionary
	func flatMap<NewKey: Hashable, NewValue>(uniquingKeysWith merge: ((NewValue, NewValue) -> NewValue)? = nil, _ transform: (_ pair: (key: Key, value: Value)) throws -> [NewKey: NewValue]) rethrows -> [NewKey: NewValue] {
		return try reduce(into: [:]) { accum, t in
			accum.merge(try transform(t),  uniquingKeysWith: merge ?? {$1})
		}
	}
}
