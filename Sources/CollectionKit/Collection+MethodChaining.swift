//
//  Collection+MethodChaining.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2020/12/29.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Collection {
	subscript() -> ArrayMemberLookupReference<Self> {
		.init(source: self)
	}
}

@dynamicMemberLookup
public struct ArrayMemberLookupReference<C: Collection> {
	fileprivate let source: C
}

extension ArrayMemberLookupReference {
	subscript<Property>(dynamicMember keyPath: KeyPath<C.Element, Property>) -> [Property] {
		source.map { t in t[keyPath: keyPath] }
	}
}

extension ArrayMemberLookupReference where C.Element: Collection {
	subscript<Property>(dynamicMember keyPath: KeyPath<C.Element.Element, Property>) -> [Property] {
		source.flatten.map { t in t[keyPath: keyPath] }
	}
}
