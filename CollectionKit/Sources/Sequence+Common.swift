//
//  Sequence+Common.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/12/08.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Sequence {
	
	/// Converts the sequence to an array
	var array: [Element] {
		self as? [Element] ?? map { $0 }
	}
}

public extension Sequence where Element: Sequence {
	
	/// Flats the array
	var flatten: [Element.Element] {
		flatMap { $0 }
	}
}
