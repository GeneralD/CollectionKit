//
//  Collection+Common.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/12/08.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Collection {
	
	var array: [Element] {
		return map { $0 }
	}
	
	func filterType<T>() -> [T] {
		return compactMap { $0 as? T }
	}
}

public extension Collection where Element: Collection {
	var flatten: [Element.Element] {
		return flatMap { $0 }
	}
}
