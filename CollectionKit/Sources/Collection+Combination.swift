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



extension Array {
	func divided(at k: Int) -> (ArraySlice<Element>, ArraySlice<Element>) {
		(self[startIndex..<k], self[k..<endIndex])
	}
}

func sub<T: AdditiveArithmetic>(_ t: (T, T)) -> T {
	t.1 - t.0
}

//print([1,2,3,4,5].divided(at: 2))
//print([1,2,3,4,5].filterM { _ in [true, false] } )
//
//
//// Facebook coding problem
//func profit(prices p: [Int], k: Int) -> Int {
//	guard k > 0 else { return 0 }
//	return (0...p.count).map(p.divided(at:)).map { a, b in
//		let maxA = a.pairs.map(sub).max ?? 0
//		let maxB = profit(prices: b.array, k: k - 1)
//		return maxA + maxB
//	}
//	.max ?? 0
//}
//
//let prices = [0, 2, 7, 4, 9, 12, 1, 1, 4, 8, 3, 9]
//print(profit(prices: prices, k: 2))
//print(profit(prices: prices, k: 3))
//print(profit(prices: prices, k: 4))
//
