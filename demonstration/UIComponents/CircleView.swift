//
//  HomeCircleView.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import UIKit

final class CircleView: UIView {
    
    private var color: UIColor
    private var borderColor: UIColor
    private var size: CGFloat
    private var borderWidth: CGFloat
    
    convenience init(color: UIColor, size: CGFloat) {
        self.init(color: color, borderColor: color, size: size, borderWidth: 0)
    }
    
    init(color: UIColor, borderColor: UIColor, size: CGFloat, borderWidth: CGFloat) {
        self.color = color
        self.borderColor = borderColor
        self.size = size
        self.borderWidth = borderWidth
        super.init(frame: .zero)
        setupView()
    }
    
    func set(color: UIColor) {
        self.color = color
        backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = size/2
        clipsToBounds = true
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
}

extension CircleView: ViewCode {
    
    func setupHierarchy() { }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: size),
            widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    func configureView() {
        backgroundColor = color
    }
}
