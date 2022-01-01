//
//  HomeCircleView.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import UIKit

final class HomeCircleView: UIView {
    
    var color: UIColor {
        didSet {
            backgroundColor = color
        }
    }
    
    var borderColor: UIColor
    
    init(color: UIColor, borderColor: UIColor = .primaryColor) {
        self.color = color
        self.borderColor = borderColor
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = 11
        clipsToBounds = true
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = 2.0
    }
}

extension HomeCircleView: ViewCode {
    
    func setupHierarchy() { }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 22),
            widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    func configureView() {
        backgroundColor = color
    }
}
