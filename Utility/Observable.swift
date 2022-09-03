//
//  Observable.swift
//  Utility
//
//  Created by Zhang, Wanming on 9/2/22.
//

import Foundation

class Observable<T> {
    var value: T {
        didSet {
            observer?(value)
        }
    }
    var observer: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping ((T) -> Void)) {
        closure(value)
        self.observer = closure
    }
}
