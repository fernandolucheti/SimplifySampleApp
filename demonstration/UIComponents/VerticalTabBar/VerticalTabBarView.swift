//
//  HomeTabView.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

protocol TabViewDelegate: AnyObject {
    func didSelectTabAtIndex(_ index: Int)
}

final class VerticalTabBarView: UIView {
    
    let backgroundView = UIView()
    
    override var backgroundColor: UIColor? {
        didSet {
            tabBarView.backgroundColor = backgroundColor
        }
    }
    
    var contentBackGroundColor: UIColor? {
        didSet {
            backgroundView.backgroundColor = contentBackGroundColor
        }
    }
    
    var contentView = UIView()
    
    private let tabBarView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var buttons: [UIButton]
    private weak var delegate: TabViewDelegate?
    
    init(buttons: [UIButton]) {
        self.buttons = buttons
        super.init(frame: .zero)
        setupView()
        setupNavigationItens(buttons)
    }
    
    func setDelegate(_ delegate: TabViewDelegate) {
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapButtonAt(sender: TabBarTapGesture) {
        delegate?.didSelectTabAtIndex(sender.index)
        for item in buttons {
            item.isSelected = false
        }
        sender.button.isSelected = true
    }
    
    private func setupNavigationItens(_ itens: [UIButton]) {
        tabBarView.addArrangedSubview(UIView.spacer)
        
        for (index, button) in itens.enumerated() {
            let tapGesture = TabBarTapGesture(button: button,
                                              index: index,
                                              target: self,
                                              action: #selector(didTapButtonAt(sender:)))
            button.addGestureRecognizer(tapGesture)
            tabBarView.addArrangedSubview(button)
        }
        tabBarView.addArrangedSubview(UIView.spacer)
    }
}

extension VerticalTabBarView: ViewCode {
    
    func setupHierarchy() {
        addSubview(backgroundView)
        addSubview(contentView)
        addSubview(tabBarView)
    }
    
    func setupConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: 1000),
            
            contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tabBarView.leadingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tabBarView.topAnchor.constraint(equalTo: topAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tabBarView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
