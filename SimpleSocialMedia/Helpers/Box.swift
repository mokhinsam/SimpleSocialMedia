//
//  Box.swift
//  SimpleSocialMedia
//
//  Created by Дарина Самохина on 22.11.2025.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: Listener?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
    }
}
