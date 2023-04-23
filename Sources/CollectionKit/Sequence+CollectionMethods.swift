//
//  Sequence+CollectionMethods.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2023/04/23.
//  Copyright © 2019 ZYXW. All rights reserved.
//

public extension Sequence {
	var first: Element? {
		first { _ in true }
	}

	var isEmpty: Bool {
		first == nil
	}
}
