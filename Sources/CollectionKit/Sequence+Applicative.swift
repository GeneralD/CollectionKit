//
//  Sequence+Applicative.swift
//  CollectionKit
//
//  Created by Yumenosuke Koukata on 2020/04/20.
//  Copyright © 2020 ZYXW. All rights reserved.
//

import Foundation

public extension Sequence {
	
	func apply<T, Seq>(_ fs: Seq) -> [T] where Seq: Sequence, Seq.Element == (Element) -> T {
		fs.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A>(_ fs: Seq) -> [(A) -> T] where Seq: Sequence, Seq.Element == (Element, A) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B>(_ fs: Seq) -> [(A) -> (B) -> T] where Seq: Sequence, Seq.Element == (Element, A, B) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C>(_ fs: Seq) -> [(A) -> (B) -> (C) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D, E>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> (E) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D, E) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D, E, F>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> (E) -> (F) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D, E, F) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D, E, F, G>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D, E, F, G) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D, E, F, G, H>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D, E, F, G, H) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D, E, F, G, H, I>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D, E, F, G, H, I) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D, E, F, G, H, I, J>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D, E, F, G, H, I, J) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D, E, F, G, H, I, J, K>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D, E, F, G, H, I, J, K) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D, E, F, G, H, I, J, K, L>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D, E, F, G, H, I, J, K, L) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D, E, F, G, H, I, J, K, L, M>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D, E, F, G, H, I, J, K, L, M) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D, E, F, G, H, I, J, K, L, M, N) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, R>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (R) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, R) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
	
	func apply<T, Seq, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, R, S>(_ fs: Seq) -> [(A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (R) -> (S) -> T] where Seq: Sequence, Seq.Element == (Element, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, R, S) -> T {
		fs.map { curry($0) }.flatMap { self.map($0) }
	}
}

private func curry<A, B>(_ function: @escaping (A) -> B) -> (A) -> B {
	{ (a: A) -> B in function(a) }
}

private func curry<A, B, C>(_ function: @escaping ((A, B)) -> C) -> (A) -> (B) -> C {
	{ (a: A) -> (B) -> C in { (b: B) -> C in function((a, b)) } }
}

private func curry<A, B, C, D>(_ function: @escaping ((A, B, C)) -> D) -> (A) -> (B) -> (C) -> D {
	{ (a: A) -> (B) -> (C) -> D in { (b: B) -> (C) -> D in { (c: C) -> D in function((a, b, c)) } } }
}

private func curry<A, B, C, D, E>(_ function: @escaping ((A, B, C, D)) -> E) -> (A) -> (B) -> (C) -> (D) -> E {
	{ (a: A) -> (B) -> (C) -> (D) -> E in { (b: B) -> (C) -> (D) -> E in { (c: C) -> (D) -> E in { (d: D) -> E in function((a, b, c, d)) } } } }
}

private func curry<A, B, C, D, E, F>(_ function: @escaping ((A, B, C, D, E)) -> F) -> (A) -> (B) -> (C) -> (D) -> (E) -> F {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> F in { (b: B) -> (C) -> (D) -> (E) -> F in { (c: C) -> (D) -> (E) -> F in { (d: D) -> (E) -> F in { (e: E) -> F in function((a, b, c, d, e)) } } } } }
}

private func curry<A, B, C, D, E, F, G>(_ function: @escaping ((A, B, C, D, E, F)) -> G) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> G {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> G in { (b: B) -> (C) -> (D) -> (E) -> (F) -> G in { (c: C) -> (D) -> (E) -> (F) -> G in { (d: D) -> (E) -> (F) -> G in { (e: E) -> (F) -> G in { (f: F) -> G in function((a, b, c, d, e, f)) } } } } } }
}

private func curry<A, B, C, D, E, F, G, H>(_ function: @escaping ((A, B, C, D, E, F, G)) -> H) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> H {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> H in { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> H in { (c: C) -> (D) -> (E) -> (F) -> (G) -> H in { (d: D) -> (E) -> (F) -> (G) -> H in { (e: E) -> (F) -> (G) -> H in { (f: F) -> (G) -> H in { (g: G) -> H in function((a, b, c, d, e, f, g)) } } } } } } }
}

private func curry<A, B, C, D, E, F, G, H, I>(_ function: @escaping ((A, B, C, D, E, F, G, H)) -> I) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> I {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> I in { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> I in { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> I in { (d: D) -> (E) -> (F) -> (G) -> (H) -> I in { (e: E) -> (F) -> (G) -> (H) -> I in { (f: F) -> (G) -> (H) -> I in { (g: G) -> (H) -> I in { (h: H) -> I in function((a, b, c, d, e, f, g, h)) } } } } } } } }
}

private func curry<A, B, C, D, E, F, G, H, I, J>(_ function: @escaping ((A, B, C, D, E, F, G, H, I)) -> J) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> J {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> J in { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> J in { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> J in { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> J in { (e: E) -> (F) -> (G) -> (H) -> (I) -> J in { (f: F) -> (G) -> (H) -> (I) -> J in { (g: G) -> (H) -> (I) -> J in { (h: H) -> (I) -> J in { (i: I) -> J in function((a, b, c, d, e, f, g, h, i)) } } } } } } } } }
}

private func curry<A, B, C, D, E, F, G, H, I, J, K>(_ function: @escaping ((A, B, C, D, E, F, G, H, I, J)) -> K) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> K {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> K in { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> K in { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> K in { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> K in { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> K in { (f: F) -> (G) -> (H) -> (I) -> (J) -> K in { (g: G) -> (H) -> (I) -> (J) -> K in { (h: H) -> (I) -> (J) -> K in { (i: I) -> (J) -> K in { (j: J) -> K in function((a, b, c, d, e, f, g, h, i, j)) } } } } } } } } } }
}

private func curry<A, B, C, D, E, F, G, H, I, J, K, L>(_ function: @escaping ((A, B, C, D, E, F, G, H, I, J, K)) -> L) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> L {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> L in { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> L in { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> L in { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> L in { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> L in { (f: F) -> (G) -> (H) -> (I) -> (J) -> (K) -> L in { (g: G) -> (H) -> (I) -> (J) -> (K) -> L in { (h: H) -> (I) -> (J) -> (K) -> L in { (i: I) -> (J) -> (K) -> L in { (j: J) -> (K) -> L in { (k: K) -> L in function((a, b, c, d, e, f, g, h, i, j, k)) } } } } } } } } } } }
}

private func curry<A, B, C, D, E, F, G, H, I, J, K, L, M>(_ function: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L)) -> M) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M in { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M in { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M in { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M in { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M in { (f: F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M in { (g: G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M in { (h: H) -> (I) -> (J) -> (K) -> (L) -> M in { (i: I) -> (J) -> (K) -> (L) -> M in { (j: J) -> (K) -> (L) -> M in { (k: K) -> (L) -> M in { (l: L) -> M in function((a, b, c, d, e, f, g, h, i, j, k, l)) } } } } } } } } } } } }
}

private func curry<A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_ function: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M)) -> N) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> N {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> N in { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> N in { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> N in { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> N in { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> N in { (f: F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> N in { (g: G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> N in { (h: H) -> (I) -> (J) -> (K) -> (L) -> (M) -> N in { (i: I) -> (J) -> (K) -> (L) -> (M) -> N in { (j: J) -> (K) -> (L) -> (M) -> N in { (k: K) -> (L) -> (M) -> N in { (l: L) -> (M) -> N in { (m: M) -> N in function((a, b, c, d, e, f, g, h, i, j, k, l, m)) } } } } } } } } } } } } }
}

private func curry<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_ function: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N)) -> O) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> O {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> O in { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> O in { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> O in { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> O in { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> O in { (f: F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> O in { (g: G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> O in { (h: H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> O in { (i: I) -> (J) -> (K) -> (L) -> (M) -> (N) -> O in { (j: J) -> (K) -> (L) -> (M) -> (N) -> O in { (k: K) -> (L) -> (M) -> (N) -> O in { (l: L) -> (M) -> (N) -> O in { (m: M) -> (N) -> O in { (n: N) -> O in function((a, b, c, d, e, f, g, h, i, j, k, l, m, n)) } } } } } } } } } } } } } }
}

private func curry<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P>(_ function: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O)) -> P) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> P {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> P in { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> P in { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> P in { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> P in { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> P in { (f: F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> P in { (g: G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> P in { (h: H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> P in { (i: I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> P in { (j: J) -> (K) -> (L) -> (M) -> (N) -> (O) -> P in { (k: K) -> (L) -> (M) -> (N) -> (O) -> P in { (l: L) -> (M) -> (N) -> (O) -> P in { (m: M) -> (N) -> (O) -> P in { (n: N) -> (O) -> P in { (o: O) -> P in function((a, b, c, d, e, f, g, h, i, j, k, l, m, n, o)) } } } } } } } } } } } } } } }
}

private func curry<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q>(_ function: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P)) -> Q) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> Q {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> Q in { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> Q in { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> Q in { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> Q in { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> Q in { (f: F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> Q in { (g: G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> Q in { (h: H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> Q in { (i: I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> Q in { (j: J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> Q in { (k: K) -> (L) -> (M) -> (N) -> (O) -> (P) -> Q in { (l: L) -> (M) -> (N) -> (O) -> (P) -> Q in { (m: M) -> (N) -> (O) -> (P) -> Q in { (n: N) -> (O) -> (P) -> Q in { (o: O) -> (P) -> Q in { (p: P) -> Q in function((a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p)) } } } } } } } } } } } } } } } }
}

private func curry<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R>(_ function: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q)) -> R) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> R {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> R in { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> R in { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> R in { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> R in { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> R in { (f: F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> R in { (g: G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> R in { (h: H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> R in { (i: I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> R in { (j: J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> R in { (k: K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> R in { (l: L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> R in { (m: M) -> (N) -> (O) -> (P) -> (Q) -> R in { (n: N) -> (O) -> (P) -> (Q) -> R in { (o: O) -> (P) -> (Q) -> R in { (p: P) -> (Q) -> R in { (q: Q) -> R in function((a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q)) } } } } } } } } } } } } } } } } }
}

private func curry<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S>(_ function: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R)) -> S) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> S {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> S in { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> S in { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> S in { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> S in { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> S in { (f: F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> S in { (g: G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> S in { (h: H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> S in { (i: I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> S in { (j: J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> S in { (k: K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> S in { (l: L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> S in { (m: M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> S in { (n: N) -> (O) -> (P) -> (Q) -> (R) -> S in { (o: O) -> (P) -> (Q) -> (R) -> S in { (p: P) -> (Q) -> (R) -> S in { (q: Q) -> (R) -> S in { (r: R) -> S in function((a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r)) } } } } } } } } } } } } } } } } } }
}

private func curry<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T>(_ function: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S)) -> T) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T in { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T in { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T in { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T in { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T in { (f: F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T in { (g: G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T in { (h: H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T in { (i: I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T in { (j: J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T in { (k: K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T in { (l: L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T in { (m: M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T in { (n: N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T in { (o: O) -> (P) -> (Q) -> (R) -> (S) -> T in { (p: P) -> (Q) -> (R) -> (S) -> T in { (q: Q) -> (R) -> (S) -> T in { (r: R) -> (S) -> T in { (s: S) -> T in function((a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s)) } } } } } } } } } } } } } } } } } } }
}

private func curry<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U>(_ function: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T)) -> U) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U {
	{ (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (f: F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (g: G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (h: H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (i: I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (j: J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (k: K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (l: L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (m: M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (n: N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (o: O) -> (P) -> (Q) -> (R) -> (S) -> (T) -> U in { (p: P) -> (Q) -> (R) -> (S) -> (T) -> U in { (q: Q) -> (R) -> (S) -> (T) -> U in { (r: R) -> (S) -> (T) -> U in { (s: S) -> (T) -> U in { (t: T) -> U in function((a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t)) } } } } } } } } } } } } } } } } } } } }
}
