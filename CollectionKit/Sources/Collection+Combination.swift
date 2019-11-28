//
//  Collection+Combination.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Collection {
	
	func combinations(of n: Int) -> [[Element]] {
		guard n > 1 else { return map { [$0] } }
		guard let x = first else { return [] }
		let xs = dropFirst()
		return xs.combinations(of: n - 1).map { [x] + $0 } + xs.combinations(of: n)
	}
	
	var pairs: [(Element, Element)] {
		guard let x = first else { return [] }
		let xs = dropFirst()
		return xs.map { (x, $0) } + xs.pairs
	}
}
