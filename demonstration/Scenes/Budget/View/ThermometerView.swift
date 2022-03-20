//
//  ThermometerView.swift
//  demonstration
//
//  Created by Fernando Lucheti on 19/03/22.
//

import UIKit

final class ThermometerView: UIView {
    
    private var color: UIColor {
        didSet {
            verticalBar.backgroundColor = color
        }
    }
    private var fillPercent: Int
    
    private let verticalBarBackground: UIView = {
        let view = UIView()
        view.backgroundColor = ColorTheme.secondaryColor.color
        view.clipsToBounds = true
        view.layer.cornerRadius = 3
        return view
    }()
    
    private lazy var verticalBar: UIView = {
        let view = UIView()
        view.backgroundColor = color
        return view
    }()
    
    private lazy var circle: CircleView = {
        let view = CircleView(color: color, size: 20)
        return view
    }()
    
    private lazy var verticalBarHeightConstraint = verticalBar.heightAnchor.constraint(equalToConstant: 32)
    
    public var circleCenterYAnchor: NSLayoutYAxisAnchor {
        circle.centerYAnchor
    }
    
    init(color: UIColor, fillPercent: Int) {
        self.color = color
        self.fillPercent = fillPercent
        super.init(frame: .zero)
        setupView()
    }
    
    func setup(color: UIColor, fillPercent: Int) {
        self.color = color
        self.fillPercent = fillPercent
        circle.set(color: color)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        verticalBarHeightConstraint.constant = 32 + ((verticalBarBackground.frame.height - 32) * (CGFloat(fillPercent)/100))
    }
}

extension ThermometerView: ViewCode {
    func setupHierarchy() {
        addSubview(verticalBarBackground)
        verticalBarBackground.addSubview(verticalBar)
        addSubview(circle)
    }
    
    func setupConstraints() {
        verticalBarBackground.translatesAutoresizingMaskIntoConstraints = false
        verticalBar.translatesAutoresizingMaskIntoConstraints = false
        circle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalBarBackground.centerXAnchor.constraint(equalTo: centerXAnchor),
            verticalBarBackground.topAnchor.constraint(equalTo: topAnchor),
            verticalBarBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            verticalBarBackground.widthAnchor.constraint(equalToConstant: 6),
            
            verticalBar.leadingAnchor.constraint(equalTo: verticalBarBackground.leadingAnchor),
            verticalBar.trailingAnchor.constraint(equalTo: verticalBarBackground.trailingAnchor),
            verticalBar.topAnchor.constraint(equalTo: verticalBarBackground.topAnchor),
            verticalBarHeightConstraint,
            
            circle.leadingAnchor.constraint(equalTo: leadingAnchor),
            circle.trailingAnchor.constraint(equalTo: trailingAnchor),
            circle.topAnchor.constraint(equalTo: topAnchor, constant: 12),
        ])
    }
}
