//
//  Sequence+MethodChaining.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2020/12/29.
//  Copyright © 2019 ZYXW. All rights reserved.
//

/// You can get this middle object via array subscript without argument.
/// By using this object, array can seems to have a new syntax, *array-chaining*.
///
/// Example:
/// ```
/// struct Person {
///     let name: String
///     let age: Int
///     let friends: [Person]
/// }
///
/// let people: [Person] = [
///     .init(name: "me", age: 32, friends: [
///         .init(name: "Tom", age: 40, friends: [])
///     ]),
///     .init(name: "you", age: 28, friends: [
///         .init(name: "Nancy", age: 10, friends: []),
///         .init(name: "Freddie", age: 20, friends: [
///             .init(name: "Bob", age: 50, friends: [])
///         ])
///     ])
/// ]
///
/// let ourFriends = people[].friends[].name // ["Tom", "Nancy", "Freddie"]
/// let sumAge = people[].age.reduce(0, +) // 60
/// ```
@dynamicMemberLookup
public struct ArrayMemberLookupReference<S: Sequence> {
	fileprivate let source: S
	
	subscript<Property>(dynamicMember keyPath: KeyPath<S.Element, Property>) -> [Property] {
		source.map { t in t[keyPath: keyPath] }
	}
}

public extension Sequence {
	subscript() -> ArrayMemberLookupReference<Self> {
		.init(source: self)
	}
}

public extension Sequence where Element: Sequence {
	subscript() -> ArrayMemberLookupReference<[Element.Element]> {
		.init(source: lazy.flatten)
	}
}
