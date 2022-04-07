//
//  Observable.swift
//  Utility
//
//  Created by Zhang, Wanming on 4/6/22.


import Foundation
/**
  * The Observable is  initialized with the value we want to observe (or pass around)
  * Function bind does the binding of the value and the listener
  * Listener is our closure called when the value is set
 */
 
class Observable<T> {
    var value: T {
        didSet {
            listener?(value)
        }
    }

    private var listener: ((T) -> Void)?

    init(_ value: T) {
        self.value = value
    }

    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}
