//
//  Sequence+Filter.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2022/10/25.
//  Copyright © 2022 ZYXW. All rights reserved.
//

public extension Sequence {
	func unless(_ isExcluded: (Self.Element) throws -> Bool) rethrows -> [Self.Element] {
		try filter { try !isExcluded($0) }
	}
}

public extension Sequence where Element == Bool {
	func filter() -> [Self.Element] {
		filter { $0 }
	}
}
