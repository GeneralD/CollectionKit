//
//  Collection+Accumlate.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/12/07.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Collection {
	
	/// Evaluates the 2 results of combining the elements of the sequence using the
	/// given closures. Finally, the results are combined as one using the closure.
	///
	/// - Parameters:
	/// 	- initS: The value to use as the initial accumulating value.
	/// 	- accumS: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initT: The value to use as the initial accumulating value.
	/// 	- accumT: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- result: A closure that combines the accumulated values.
	/// 	- s: First accmulated result.
	/// 	- t: Second accmulated result.
	/// - Returns: The final value.
	func reduce<R, S, T>(
		_ initS: S, _ accumS: (_ accum: S, _ element: Element) throws -> S,
		_ initT: T, _ accumT: (_ accum: T, _ element: Element) throws -> T,
		_ result: (_ s: S, _ t: T) throws -> R) rethrows -> R {
		let t = try reduce((initS, initT)) { accum, elem in
			(try accumS(accum.0, elem), try accumT(accum.1, elem))
		}
		return try result(t.0, t.1)
	}
	
	/// Evaluates the 3 results of combining the elements of the sequence using the
	/// given closures. Finally, the results are combined as one using the closure.
	///
	/// - Parameters:
	/// 	- initS: The value to use as the initial accumulating value.
	/// 	- accumS: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initT: The value to use as the initial accumulating value.
	/// 	- accumT: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initU: The value to use as the initial accumulating value.
	/// 	- accumU: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- result: A closure that combines the accumulated values.
	/// 	- s: First accmulated result.
	/// 	- t: Second accmulated result.
	/// 	- u: Third accmulated result.
	/// - Returns: The final value.
	func reduce<R, S, T, U>(
		_ initS: S, _ accumS: (_ accum: S, _ element: Element) throws -> S,
		_ initT: T, _ accumT: (_ accum: T, _ element: Element) throws -> T,
		_ initU: U, _ accumU: (_ accum: U, _ element: Element) throws -> U,
		_ result: (_ s: S, _ t: T, _ u: U) throws -> R) rethrows -> R {
		let t = try reduce((initS, initT, initU)) { accum, elem in
			(try accumS(accum.0, elem), try accumT(accum.1, elem), try accumU(accum.2, elem))
		}
		return try result(t.0, t.1, t.2)
	}
	
	/// Evaluates the 4 results of combining the elements of the sequence using the
	/// given closures. Finally, the results are combined as one using the closure.
	///
	/// - Parameters:
	/// 	- initS: The value to use as the initial accumulating value.
	/// 	- accumS: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initT: The value to use as the initial accumulating value.
	/// 	- accumT: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initU: The value to use as the initial accumulating value.
	/// 	- accumU: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initV: The value to use as the initial accumulating value.
	/// 	- accumV: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- result: A closure that combines the accumulated values.
	/// 	- s: First accmulated result.
	/// 	- t: Second accmulated result.
	/// 	- u: Third accmulated result.
	/// 	- v: Fourth accmulated result.
	/// - Returns: The final value.
	func reduce<R, S, T, U, V>(
		_ initS: S, _ accumS: (_ accum: S, _ element: Element) throws -> S,
		_ initT: T, _ accumT: (_ accum: T, _ element: Element) throws -> T,
		_ initU: U, _ accumU: (_ accum: U, _ element: Element) throws -> U,
		_ initV: V, _ accumV: (_ accum: V, _ element: Element) throws -> V,
		_ result: (_ s: S, _ t: T, _ u: U, _ v: V) throws -> R) rethrows -> R {
		let t = try reduce((initS, initT, initU, initV)) { accum, elem in
			(try accumS(accum.0, elem), try accumT(accum.1, elem), try accumU(accum.2, elem), try accumV(accum.3, elem))
		}
		return try result(t.0, t.1, t.2, t.3)
	}
	
	/// Evaluates the 5 results of combining the elements of the sequence using the
	/// given closures. Finally, the results are combined as one using the closure.
	///
	/// - Parameters:
	/// 	- initS: The value to use as the initial accumulating value.
	/// 	- accumS: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initT: The value to use as the initial accumulating value.
	/// 	- accumT: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initU: The value to use as the initial accumulating value.
	/// 	- accumU: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initV: The value to use as the initial accumulating value.
	/// 	- accumV: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initW: The value to use as the initial accumulating value.
	/// 	- accumW: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- result: A closure that combines the accumulated values.
	/// 	- s: First accmulated result.
	/// 	- t: Second accmulated result.
	/// 	- u: Third accmulated result.
	/// 	- v: Fourth accmulated result.
	/// 	- w: Fifth accmulated result.
	/// - Returns: The final value.
	func reduce<R, S, T, U, V, W>(
		_ initS: S, _ accumS: (_ accum: S, _ element: Element) throws -> S,
		_ initT: T, _ accumT: (_ accum: T, _ element: Element) throws -> T,
		_ initU: U, _ accumU: (_ accum: U, _ element: Element) throws -> U,
		_ initV: V, _ accumV: (_ accum: V, _ element: Element) throws -> V,
		_ initW: W, _ accumW: (_ accum: W, _ element: Element) throws -> W,
		_ result: (_ s: S, _ t: T, _ u: U, _ v: V, _ w: W) throws -> R) rethrows -> R {
		let t = try reduce((initS, initT, initU, initV, initW)) { accum, elem in
			(try accumS(accum.0, elem), try accumT(accum.1, elem), try accumU(accum.2, elem), try accumV(accum.3, elem), try accumW(accum.4, elem))
		}
		return try result(t.0, t.1, t.2, t.3, t.4)
	}
	
	/// Evaluates the 6 results of combining the elements of the sequence using the
	/// given closures. Finally, the results are combined as one using the closure.
	///
	/// - Parameters:
	/// 	- initS: The value to use as the initial accumulating value.
	/// 	- accumS: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initT: The value to use as the initial accumulating value.
	/// 	- accumT: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initU: The value to use as the initial accumulating value.
	/// 	- accumU: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initV: The value to use as the initial accumulating value.
	/// 	- accumV: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initW: The value to use as the initial accumulating value.
	/// 	- accumW: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initX: The value to use as the initial accumulating value.
	/// 	- accumX: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- result: A closure that combines the accumulated values.
	/// 	- s: First accmulated result.
	/// 	- t: Second accmulated result.
	/// 	- u: Third accmulated result.
	/// 	- v: Fourth accmulated result.
	/// 	- w: Fifth accmulated result.
	/// 	- x: Sixth accmulated result.
	/// - Returns: The final value.
	func reduce<R, S, T, U, V, W, X>(
		_ initS: S, _ accumS: (_ accum: S, _ element: Element) throws -> S,
		_ initT: T, _ accumT: (_ accum: T, _ element: Element) throws -> T,
		_ initU: U, _ accumU: (_ accum: U, _ element: Element) throws -> U,
		_ initV: V, _ accumV: (_ accum: V, _ element: Element) throws -> V,
		_ initW: W, _ accumW: (_ accum: W, _ element: Element) throws -> W,
		_ initX: X, _ accumX: (_ accum: X, _ element: Element) throws -> X,
		_ result: (_ s: S, _ t: T, _ u: U, _ v: V, _ w: W, _ x: X) throws -> R) rethrows -> R {
		let t = try reduce((initS, initT, initU, initV, initW, initX)) { accum, elem in
			(try accumS(accum.0, elem), try accumT(accum.1, elem), try accumU(accum.2, elem), try accumV(accum.3, elem), try accumW(accum.4, elem), try accumX(accum.5, elem))
		}
		return try result(t.0, t.1, t.2, t.3, t.4, t.5)
	}
	
	/// Evaluates the 7 results of combining the elements of the sequence using the
	/// given closures. Finally, the results are combined as one using the closure.
	///
	/// - Parameters:
	/// 	- initS: The value to use as the initial accumulating value.
	/// 	- accumS: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initT: The value to use as the initial accumulating value.
	/// 	- accumT: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initU: The value to use as the initial accumulating value.
	/// 	- accumU: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initV: The value to use as the initial accumulating value.
	/// 	- accumV: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initW: The value to use as the initial accumulating value.
	/// 	- accumW: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initX: The value to use as the initial accumulating value.
	/// 	- accumX: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initY: The value to use as the initial accumulating value.
	/// 	- accumY: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- result: A closure that combines the accumulated values.
	/// 	- s: First accmulated result.
	/// 	- t: Second accmulated result.
	/// 	- u: Third accmulated result.
	/// 	- v: Fourth accmulated result.
	/// 	- w: Fifth accmulated result.
	/// 	- x: Sixth accmulated result.
	/// 	- y: Seventh accmulated result.
	/// - Returns: The final value.
	func reduce<R, S, T, U, V, W, X, Y>(
		_ initS: S, _ accumS: (_ accum: S, _ element: Element) throws -> S,
		_ initT: T, _ accumT: (_ accum: T, _ element: Element) throws -> T,
		_ initU: U, _ accumU: (_ accum: U, _ element: Element) throws -> U,
		_ initV: V, _ accumV: (_ accum: V, _ element: Element) throws -> V,
		_ initW: W, _ accumW: (_ accum: W, _ element: Element) throws -> W,
		_ initX: X, _ accumX: (_ accum: X, _ element: Element) throws -> X,
		_ initY: Y, _ accumY: (_ accum: Y, _ element: Element) throws -> Y,
		_ result: (_ s: S, _ t: T, _ u: U, _ v: V, _ w: W, _ x: X, _ y: Y) throws -> R) rethrows -> R {
		let t = try reduce((initS, initT, initU, initV, initW, initX, initY)) { accum, elem in
			(try accumS(accum.0, elem), try accumT(accum.1, elem), try accumU(accum.2, elem), try accumV(accum.3, elem), try accumW(accum.4, elem), try accumX(accum.5, elem), try accumY(accum.6, elem))
		}
		return try result(t.0, t.1, t.2, t.3, t.4, t.5, t.6)
	}
	
	/// Evaluates the 8 results of combining the elements of the sequence using the
	/// given closures. Finally, the results are combined as one using the closure.
	///
	/// - Parameters:
	/// 	- initS: The value to use as the initial accumulating value.
	/// 	- accumS: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initT: The value to use as the initial accumulating value.
	/// 	- accumT: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initU: The value to use as the initial accumulating value.
	/// 	- accumU: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initV: The value to use as the initial accumulating value.
	/// 	- accumV: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initW: The value to use as the initial accumulating value.
	/// 	- accumW: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initX: The value to use as the initial accumulating value.
	/// 	- accumX: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initY: The value to use as the initial accumulating value.
	/// 	- accumY: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- initZ: The value to use as the initial accumulating value.
	/// 	- accumZ: A closure that updates the accumulating value with an element of the sequence.
	/// 	- accum: accumulating value. First time, it is initial value.
	/// 	- element: Iterated element.
	/// 	- result: A closure that combines the accumulated values.
	/// 	- s: First accmulated result.
	/// 	- t: Second accmulated result.
	/// 	- u: Third accmulated result.
	/// 	- v: Fourth accmulated result.
	/// 	- w: Fifth accmulated result.
	/// 	- x: Sixth accmulated result.
	/// 	- y: Seventh accmulated result.
	/// 	- z: Eighth accmulated result.
	/// - Returns: The final value.
	func reduce<R, S, T, U, V, W, X, Y, Z>(
		_ initS: S, _ accumS: (_ accum: S, _ element: Element) throws -> S,
		_ initT: T, _ accumT: (_ accum: T, _ element: Element) throws -> T,
		_ initU: U, _ accumU: (_ accum: U, _ element: Element) throws -> U,
		_ initV: V, _ accumV: (_ accum: V, _ element: Element) throws -> V,
		_ initW: W, _ accumW: (_ accum: W, _ element: Element) throws -> W,
		_ initX: X, _ accumX: (_ accum: X, _ element: Element) throws -> X,
		_ initY: Y, _ accumY: (_ accum: Y, _ element: Element) throws -> Y,
		_ initZ: Z, _ accumZ: (_ accum: Z, _ element: Element) throws -> Z,
		_ result: (_ s: S, _ t: T, _ u: U, _ v: V, _ w: W, _ x: X, _ y: Y, _ z: Z) throws -> R) rethrows -> R {
		let t = try reduce((initS, initT, initU, initV, initW, initX, initY, initZ)) { accum, elem in
			(try accumS(accum.0, elem), try accumT(accum.1, elem), try accumU(accum.2, elem), try accumV(accum.3, elem), try accumW(accum.4, elem), try accumX(accum.5, elem), try accumY(accum.6, elem), try accumZ(accum.7, elem))
		}
		return try result(t.0, t.1, t.2, t.3, t.4, t.5, t.6, t.7)
	}
}
