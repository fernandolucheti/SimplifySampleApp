//
//  HeaderView.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func setIcon(_ icon: SystemIcons)
    func setMonthName(_ monthName: String)
}

final class HeaderView: UIView {
    
    private var presenter: HeaderViewPresenter
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.locations = [0.6, 1]
        return gradient
    }()
    
    private let selectMonthLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.locations = [0.65, 1]
        return gradient
    }()
    
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

    private lazy var monthButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(systemName: SystemIcons.calendar.rawValue,
                                     withConfiguration: UIImage.SymbolConfiguration(pointSize: 26)), for: .normal)
        button.imageView?.tintColor = ColorTheme.secondaryColor.color
        button.addTarget(self, action: #selector(toggleMonth), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextMonthButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(systemName: SystemIcons.chevronRight.rawValue,
                                     withConfiguration: UIImage.SymbolConfiguration(pointSize: 26)), for: .normal)
        button.imageView?.tintColor = ColorTheme.secondaryColor.color
        button.addTarget(self, action: #selector(nextMonth), for: .touchUpInside)
        return button
    }()
    
    private lazy var previousMonthButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(systemName: SystemIcons.chevronLeft.rawValue,
                                     withConfiguration: UIImage.SymbolConfiguration(pointSize: 26)), for: .normal)
        button.imageView?.tintColor = ColorTheme.secondaryColor.color
        button.addTarget(self, action: #selector(previousMonth), for: .touchUpInside)
        return button
    }()
    
    private let selectMonthView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = ColorTheme.tertiaryColor.color
        stackView.distribution = .equalSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: -20, leading: 25, bottom: 0, trailing: 16)
        return stackView
    }()
    
    private lazy var monthNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = ColorTheme.secondaryColor.color
        label.text = presenter.monthName
        label.textAlignment = .center
        return label
    }()
    
    private lazy var selectMonthViewHiddenTopAnchor = selectMonthView.bottomAnchor.constraint(equalTo: topAnchor)
    private lazy var selectMonthViewDisplayTopAnchor = selectMonthView.topAnchor.constraint(equalTo: topAnchor)
    
    override func layoutSubviews() {
        setupGradient()
        toggleMonthView.layer.cornerRadius = 20
        toggleMonthView.clipsToBounds = true
        toggleMonthView.layer.borderColor = ColorTheme.secondaryColor.color.cgColor
        toggleMonthView.layer.borderWidth = 2
    }
    
    init(didSelectMonth: @escaping (MonthYear) -> Void) {
        self.presenter = HeaderViewPresenter(didSelectMonth: didSelectMonth)
        super.init(frame: .zero)
        presenter.setDelegate(self)
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
        selectMonthLayer.colors = [initialColor.cgColor, finalColor.cgColor]
        selectMonthLayer.frame = bounds
    }
    
    @objc private func toggleMonth() {
        if selectMonthViewDisplayTopAnchor.isActive {
            selectMonthViewDisplayTopAnchor.isActive = false
            selectMonthViewHiddenTopAnchor.isActive = true
        } else {
            selectMonthViewHiddenTopAnchor.isActive = false
            selectMonthViewDisplayTopAnchor.isActive = true
        }
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    @objc private func nextMonth() {
        presenter.updateMonth(.next)
    }
    
    @objc private func previousMonth() {
        presenter.updateMonth(.previous)
    }
}

extension HeaderView: ViewCode {
    func setupHierarchy() {
        layer.addSublayer(gradientLayer)
        addSubview(titleLabel)
        addSubview(selectMonthView)
        selectMonthView.layer.addSublayer(selectMonthLayer)
        selectMonthView.addArrangedSubview(.spacer)
        selectMonthView.addArrangedSubview(.spacer)
        selectMonthView.addArrangedSubview(.spacer)
        selectMonthView.addArrangedSubview(previousMonthButton)
        selectMonthView.addArrangedSubview(monthNameLabel)
        selectMonthView.addArrangedSubview(nextMonthButton)
        addSubview(toggleMonthView)
        addSubview(monthButton)
    }
    
    func setupConstraints() {
        selectMonthView.translatesAutoresizingMaskIntoConstraints = false
        toggleMonthView.translatesAutoresizingMaskIntoConstraints = false
        monthButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            toggleMonthView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -59),
            toggleMonthView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            toggleMonthView.widthAnchor.constraint(equalToConstant: 190),
            toggleMonthView.heightAnchor.constraint(equalToConstant: 190),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
            
            monthButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            monthButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            selectMonthView.heightAnchor.constraint(equalTo: heightAnchor),
            selectMonthView.leadingAnchor.constraint(equalTo: leadingAnchor),
            selectMonthView.trailingAnchor.constraint(equalTo: trailingAnchor),
            selectMonthViewHiddenTopAnchor,
            
            monthNameLabel.widthAnchor.constraint(equalToConstant: 130)
        ])
        toggleMonthView.rotate(angle: 45)
    }
    
    func configureView() {
        selectMonthView.backgroundColor = .clear
        toggleMonthView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleMonth)))
    }
}

extension HeaderView: HeaderViewDelegate {
    func setIcon(_ icon: SystemIcons) {
        monthButton.setImage(UIImage.init(systemName: icon.rawValue,
                                          withConfiguration: UIImage.SymbolConfiguration(pointSize: 26)),
                                          for: .normal)
    }
    
    func setMonthName(_ monthName: String) {
        monthNameLabel.text = monthName
    }
}
