//
//  Sequence+Grouping.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2020/04/20.
//  Copyright © 2020 ZYXW. All rights reserved.
//

import Foundation

public extension Sequence {
	
	/// Convenient alias to Dictionary(grouping: by:).
	/// - Parameter keyForValue: A closure that returns a key for each element in values.
	/// - Returns: New dictionary whose keys are the groupings returned by the given closure and whose values are arrays of the elements that returned each key.
	func group<Key>(by keyForValue: (Element) throws -> Key) rethrows -> [Key: [Element]] where Key: Hashable {
		try .init(grouping: self, by: keyForValue)
	}
}
