//
//  Sequence+Monad.swift
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

// MARK: - FilterM

public extension Sequence {
	
	/// This function is brought from Haskell.
	///
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
		try reversed().reduce(`return`([]), { r, x in return try predicate(x).flatMap { flg in r.flatMap { ys in `return`(flg ? [x] + ys: ys) }}})
	}
	
	/// This function is brought from Haskell.
	///
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
		try reversed().reduce(`return`([]), { r, x in return try predicate(x).flatMap { flg in r.flatMap { ys in `return`(flg ? [x] + ys: ys) }}})
	}
	
	/// This function is brought from Haskell.
	///
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
		try reversed().reduce(`return`([]), { r, x in return try predicate(x).flatMap { flg in r.flatMap { ys in `return`(flg ? [x] + ys: ys) }}})
	}
}

// MARK: - MapM

public extension Sequence {
	
	/// This function is brought from Haskell.
	///
	/// Haskell explains about *MapM*:
	///
	/// *Map each element of a structure to a monadic action, evaluate these actions from left to right, and collect the results.*
	///
	/// Original source is below:
	/// ```
	/// mapM :: Monad m => (a -> m b) -> t a -> m (t b)
	/// mapM = traverse
	///
	/// traverse f = List.foldr cons_f (pure [])
	///   where cons_f x ys = liftA2 (:) (f x) ys
	/// ```
	/// - Parameters:
	/// 	- transform: transform
	/// 	- element: Iterated item
	/// - Throws: Error which is occurred in predicate is going to be rethrown
	/// - Returns: Result of the map
	func mapM(_ transform: @escaping (_ element: Element) throws -> List<Element>) rethrows -> List<[Element]> {
		try reversed().reduce(`return`([]), { r, x in return try transform(x).flatMap { y in r.flatMap { ys in `return`([y] + ys) }}})
	}
	
	/// This function is brought from Haskell.
	///
	/// Haskell explains about *MapM*:
	///
	/// *Map each element of a structure to a monadic action, evaluate these actions from left to right, and collect the results.*
	///
	/// Original source is below:
	/// ```
	/// mapM :: Monad m => (a -> m b) -> t a -> m (t b)
	/// mapM = traverse
	///
	/// traverse f = List.foldr cons_f (pure [])
	///   where cons_f x ys = liftA2 (:) (f x) ys
	/// ```
	/// - Parameters:
	/// 	- transform: transform
	/// 	- element: Iterated item
	/// - Throws: Error which is occurred in predicate is going to be rethrown
	/// - Returns: Result of the map
	func mapM(_ transform: @escaping (_ element: Element) throws -> Maybe<Element>) rethrows -> Maybe<[Element]> {
		try reversed().reduce(`return`([]), { r, x in return try transform(x).flatMap { y in r.flatMap { ys in `return`([y] + ys) }}})
	}
	
	/// This function is brought from Haskell.
	///
	/// Haskell explains about *MapM*:
	///
	/// *Map each element of a structure to a monadic action, evaluate these actions from left to right, and collect the results.*
	///
	/// Original source is below:
	/// ```
	/// mapM :: Monad m => (a -> m b) -> t a -> m (t b)
	/// mapM = traverse
	///
	/// traverse f = List.foldr cons_f (pure [])
	///   where cons_f x ys = liftA2 (:) (f x) ys
	/// ```
	/// - Parameters:
	/// 	- transform: transform
	/// 	- element: Iterated item
	/// - Throws: Error which is occurred in predicate is going to be rethrown
	/// - Returns: Result of the map
	func mapM<E: Error>(_ transform: @escaping (_ element: Element) throws -> Either<E, Element>) rethrows -> Either<E, [Element]> {
		try reversed().reduce(`return`([]), { r, x in return try transform(x).flatMap { y in r.flatMap { ys in `return`([y] + ys) }}})
	}
}
