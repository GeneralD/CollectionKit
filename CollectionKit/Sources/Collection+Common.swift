//
//  Collection+Common.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/12/08.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Collection {
	
	/// Converts the collection to an array
	var array: [Element] {
		return map { $0 }
	}
	
	/// Casts each elements with given type parameter.
	/// Elements which cannot be casted is dropped.
	func filterType<T>() -> [T] {
		return compactMap { $0 as? T }
	}
}

public extension Collection where Element: Collection {
	
	/// Flats the array
	var flatten: [Element.Element] {
		return flatMap { $0 }
	}
}
