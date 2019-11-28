//
//  Collection+Partial.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Array {
	
	func divided(at k: Int) -> (SubSequence, SubSequence) {
		(self[startIndex..<k], self[k..<endIndex])
	}
}

public extension Collection {
	
	var splat: (x: Element, xs: SubSequence)? {
		guard let x = first else { return .none }
		let xs = dropFirst()
		return (x, xs)
	}
	
	var splat2: (x: Element, y: Element, ys: SubSequence)? {
		guard let (x, xs) = splat, let y = xs.first else { return .none }
		let ys = xs.dropFirst()
		return (x, y, ys)
	}
	
	var splat3: (x: Element, y: Element, z: Element, zs: SubSequence)? {
		guard let (x, y, ys) = splat2, let z = ys.first else { return .none }
		let zs = ys.dropFirst()
		return (x, y, z, zs)
	}
}
