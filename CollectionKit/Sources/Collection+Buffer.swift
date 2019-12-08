//
//  Collection+Buffer.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/12/08.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Collection {
	func buffer(count: Int, skip: Int? = nil) -> [[Element]] {
		guard !isEmpty else { return [] }
		return [prefix(count).array] + dropFirst(skip ?? count).buffer(count: count, skip: skip)
	}
}
