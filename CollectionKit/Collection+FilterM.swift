//
//  Collection+FilterM.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2019/11/28.
//  Copyright © 2019 ZYXW. All rights reserved.
//

// Monads should have flatMap and return

/// Haskell calls Array List
public typealias List<A> = [A]
/// Haskell calls Optional Maybe
public typealias Maybe<A> = A?
/// Haskell calls Result Either
public typealias Either<L: Error, R> = Result<R, L>

// typealias React<T> = Publisher<T, Error>

// MARK: - FilterM

public extension Collection {
	
	/// This function is brought from Haskell.
	/// Original source is below:
	/// ```
	/// filterM :: (Monad m) => (a -> m Bool) -> [a] -> m [a]
	/// filterM p = foldr go (return [])
	/// 	where
	/// 		go x r = do
	/// 		flg <- p x
	/// 		ys <- r
	/// 		return (if flg then x:ys else ys)
	/// ```
	/// - Parameters:
	/// 	- predicate: Filter predicate
	/// 	- element: Iterated item
	/// - Throws: Error which is occurred in predicate is going to be rethrown
	/// - Returns: Result of the filter
	func filterM(where predicate: @escaping (_ element: Element) throws -> List<Bool>) rethrows -> List<[Element]> {
		return try reversed().reduce(`return`([]), { r, x in return try predicate(x).flatMap { flg in r.flatMap { ys in `return`(flg ? [x] + ys: ys) }}
		})
	}
	
	/// This function is brought from Haskell.
	/// Original source is below:
	/// ```
	/// filterM :: (Monad m) => (a -> m Bool) -> [a] -> m [a]
	/// filterM p = foldr go (return [])
	/// 	where
	/// 		go x r = do
	/// 		flg <- p x
	/// 		ys <- r
	/// 		return (if flg then x:ys else ys)
	/// ```
	/// - Parameters:
	/// 	- predicate: Filter predicate
	/// 	- element: Iterated item
	/// - Throws: Error which is occurred in predicate is going to be rethrown
	/// - Returns: Result of the filter
	func filterM(where predicate: @escaping (_ element: Element) throws -> Maybe<Bool>) rethrows -> Maybe<[Element]> {
		return try reversed().reduce(`return`([]), { r, x in return try predicate(x).flatMap { flg in r.flatMap { ys in `return`(flg ? [x] + ys: ys) }}
		})
	}
	
	/// This function is brought from Haskell.
	/// Original source is below:
	/// ```
	/// filterM :: (Monad m) => (a -> m Bool) -> [a] -> m [a]
	/// filterM p = foldr go (return [])
	/// 	where
	/// 		go x r = do
	/// 		flg <- p x
	/// 		ys <- r
	/// 		return (if flg then x:ys else ys)
	/// ```
	/// - Parameters:
	/// 	- predicate: Filter predicate
	/// 	- element: Iterated item
	/// - Throws: Error which is occurred in predicate is going to be rethrown
	/// - Returns: Result of the filter
	func filterM<E: Error>(where predicate: @escaping (_ element: Element) throws -> Either<E, Bool>) rethrows -> Either<E, [Element]> {
		return try reversed().reduce(`return`([]), { r, x in return try predicate(x).flatMap { flg in r.flatMap { ys in `return`(flg ? [x] + ys: ys) }}
		})
	}
}

// MARK: - Return

fileprivate func `return`<T>(_ t: T) -> List<T> {
	return [t]
}

fileprivate func `return`<T>(_ t: T) -> Maybe<T> {
	return t
}

fileprivate func `return`<L: Error, R>(_ t: R) -> Either<L, R> {
	return .success(t)
}
