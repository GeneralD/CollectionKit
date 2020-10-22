//
//  Collection+Sorting.swift
//  
//
//  Created by Yumenosuke Koukata on 2020/10/22.
//

import Foundation

public extension Collection {
	
	func sorted<Where>(at: (Element) throws -> Where, by: (Where, Where) throws -> Bool) rethrows -> [Element] {
		try sorted {
			try by(at($0), at($1))
		}
	}
	
	func ascended<Where: Comparable>(at: (Element) throws -> Where) rethrows -> [Element] {
		try sorted(at: at, by: <)
	}
	
	func descended<Where: Comparable>(at: (Element) throws -> Where) rethrows -> [Element] {
		try sorted(at: at, by: >)
	}
}

public extension Collection where Element: Comparable {
	
	var ascended: [Element] {
		sorted(by: <)
	}
	
	var descended: [Element] {
		sorted(by: >)
	}
}
