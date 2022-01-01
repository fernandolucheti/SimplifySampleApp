//
//  ViewCode.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import Foundation

public protocol ViewCode {
    
    func setupHierarchy()
    func setupConstraints()
    func configureView()
}

extension ViewCode {
    
    func configureView() { }
    
    func setupView() {
        setupHierarchy()
        setupConstraints()
        configureView()
    }
}
