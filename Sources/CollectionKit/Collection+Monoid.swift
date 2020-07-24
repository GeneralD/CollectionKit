//
//  Collection+Monoid.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2020/02/28.
//  Copyright © 2020 ZYXW. All rights reserved.
//

#if canImport(Foundation)
import Foundation
#endif

// MARK: Monoid Definition

/// Haskell class, `Monoid`
public protocol Monoid {
	/// mempty
	static var zero: Self { get }
	/// mconcat
	static func +(lhs: Self, rhs: Self) -> Self
}

public extension Collection where Element: Monoid {
	
	/// `reduce(_:_:)` with `initialResult` = `zero`
	///
	/// - Parameters:
	///		- initialResult: The value to use as the initial accumulating value.
	///		- updateAccumulatingResult: A closure that updates the accumulating
	///			value with an element of the sequence.
	/// - Returns:
	/// 		The final accumulated value. If the sequence has no elements,
	///			the result is value of `zero`.
	///
	/// - Complexity: O(*n*), where *n* is the length of the sequence.
	func reduce(_ nextPartialResult: (Element, Element) -> Element) -> Element {
		reduce(.zero, nextPartialResult)
	}
	
	/// Returns aggregated value.
	///
	/// Same as `reduce(+)`.
	/// This is named `mappend` in Haskell.
	var joined: Element {
		reduce(+)
	}
}

// MARK: Sum & Product Monoid
public struct Sum<T> {
	public let run: T
	init(_ value: T) {
		run = value
	}
}
public struct Product<T> {
	public let run: T
	init(_ value: T) {
		run = value
	}
}

extension Sum: Monoid where T: AdditiveArithmetic {
	public static func + (lhs: Sum<T>, rhs: Sum<T>) -> Sum<T> {
		.init(lhs.run + rhs.run)
	}
	
	public static var zero: Sum<T> {
		.init(.zero)
	}
}

extension Product: Monoid where T: Numeric {
	public static func + (lhs: Product<T>, rhs: Product<T>) -> Product<T> {
		.init(lhs.run * rhs.run)
	}
	
	public static var zero: Product<T> {
		.init(1)
	}
}

extension String: Monoid {
	public static let zero: String = ""
}

// MARK: All & Any Monoid
public struct All<T> {
	public let run: T
	init(_ value: T) {
		run = value
	}
}

public struct `Any`<T> {
	public let run: T
	init(_ value: T) {
		run = value
	}
}

extension All: Monoid where T == Bool {
	public static func + (lhs: All<T>, rhs: All<T>) -> All<T> {
		.init(lhs.run && rhs.run)
	}
	
	public static var zero: All<T> {
		.init(true)
	}
}

extension `Any`: Monoid where T == Bool {
	public static func + (lhs: `Any`<T>, rhs: `Any`<T>) -> `Any`<T> {
		.init(lhs.run || rhs.run)
	}
	
	public static var zero: `Any`<T> {
		.init(false)
	}
}

// MARK: Ord Monoid
#if canImport(Foundation)
extension ComparisonResult: Monoid {
	public static func + (lhs: ComparisonResult, rhs: ComparisonResult) -> ComparisonResult {
		if case .orderedSame = lhs {
			return rhs
		}
		return lhs
	}
	
	public static var zero: ComparisonResult {
		.orderedSame
	}
}
#endif

// MARK: List Monoid
extension Array : Monoid {
	public static var zero: Array<Element> {
		return []
	}
}

// MARK: Maybe Monoid
extension Optional : Monoid where Wrapped: Monoid {
	public static func + (lhs: Optional<Wrapped>, rhs: Optional<Wrapped>) -> Optional<Wrapped> {
		switch (lhs, rhs) {
		case (.some(let l), .some(let r)):
			return .some(l + r)
		case (.some(let l), .none):
			return .some(l)
		case (.none, .some(let r)):
			return .some(r)
		default:
			return .none
		}
	}
	
	public static var zero: Optional<Wrapped> {
		.none
	}
}

// MARK: Maybe First Monoid
public struct FirstMaybe<T> {
	let run: T?
	init(_ value: T?) {
		run = value
	}
}

extension FirstMaybe : Monoid {
	public static func + (lhs: FirstMaybe<T>, rhs: FirstMaybe<T>) -> FirstMaybe<T> {
		.init([lhs.run, rhs.run].compactMap { $0 }.first)
	}
	
	public static var zero: FirstMaybe<T> {
		.init(.none)
	}
}

// MARK: Maybe Last Monoid
public struct LastMaybe<T> {
	let run: T?
	init(_ value: T?) {
		run = value
	}
}

extension LastMaybe : Monoid {
	public static func + (lhs: LastMaybe<T>, rhs: LastMaybe<T>) -> LastMaybe<T> {
		.init([lhs.run, rhs.run].compactMap { $0 }.last)
	}
	
	public static var zero: LastMaybe<T> {
		.init(.none)
	}
}

// MARK: Dual Monoid
public struct Dual<T> {
	public let run: T
	init(_ value: T) {
		run = value
	}
}

extension Dual: Monoid where T: Monoid {
	public static func + (lhs: Dual<T>, rhs: Dual<T>) -> Dual<T> {
		.init(rhs.run + lhs.run)
	}
	
	public static var zero: Dual<T> {
		.init(.zero)
	}
}
