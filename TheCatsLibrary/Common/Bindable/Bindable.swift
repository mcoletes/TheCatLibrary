//
//  Bindable.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import Foundation

public class Bindable<T> {
    
    // MARK: - Typealias
    
    public typealias BindType = ((T) -> Void)
    
    // MARK: - Properties
    
    public var binds: [BindType] = []
    
    public var value: T {
        didSet {
                self.execBinds()
            
        }
    }
    
    // MARK: - Initializer
    
    public init(_ val: T) {
        value = val
    }
    
    // MARK: - Public Methods
    
    public func bind(_ bind: @escaping BindType) {
        binds.append(bind)
    }
    
    // MARK: - Private Methods
    
    private func execBinds() {
        self.binds.forEach { [weak self] bind in
            guard let self = self else { return }
            bind(self.value)
        }
    }
}
