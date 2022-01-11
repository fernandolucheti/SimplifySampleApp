//
//  HeaderView.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

final class HeaderView: UIView {
    
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.locations = [0.5, 1]
        return gradient
    }()
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    private let toggleMonthView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorTheme.tertiaryColor.color
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = ColorTheme.secondaryColor.color
        return label
    }()

    
    override func layoutSubviews() {
        setupGradient()
        toggleMonthView.layer.cornerRadius = 20
        toggleMonthView.clipsToBounds = true
        toggleMonthView.layer.borderColor = ColorTheme.secondaryColor.color.cgColor
        toggleMonthView.layer.borderWidth = 2
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGradient() {
        let initialColor = ColorTheme.primaryColor.color
        let finalColor = initialColor.withAlphaComponent(0.0)
        gradientLayer.colors = [initialColor.cgColor, finalColor.cgColor]
        gradientLayer.frame = bounds
    }
}

extension HeaderView: ViewCode {
    func setupHierarchy() {
        layer.addSublayer(gradientLayer)
        addSubview(toggleMonthView)
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        toggleMonthView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            toggleMonthView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -59),
            toggleMonthView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            toggleMonthView.widthAnchor.constraint(equalToConstant: 190),
            toggleMonthView.heightAnchor.constraint(equalToConstant: 190),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
        ])
        toggleMonthView.rotate(angle: 45)
    }
    
}
