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
    
    override var backgroundColor: UIColor? {
        didSet {
            tabBarView.backgroundColor = backgroundColor
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
    
    var navigationItens: [NavigationTabItem]
    private weak var delegate: TabViewDelegate?
    
    init(itens: [NavigationTabItem]) {
        self.navigationItens = itens
        super.init(frame: .zero)
        setupView()
    }
    
    func setDelegate(_ delegate: TabViewDelegate) {
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapButtonAt(sender: TabBarTapGesture) {
        delegate?.didSelectTabAtIndex(sender.index)
        for iten in navigationItens {
            iten.button?.isSelected = false
        }
        sender.button.isSelected = true
    }
    
    private func setupNavigationItens() {
        
        tabBarView.addArrangedSubview(UIView.spacer)
        for (index, item) in navigationItens.enumerated() {
            let button = UIButton()
            button.setImage(item.icon, for: .normal)
            button.setImage(item.iconFilled, for: .selected)
            if index == 0 {
                button.isSelected = true
            }
            let tapGesture = TabBarTapGesture(button: button,
                                              index: index,
                                              target: self,
                                              action: #selector(didTapButtonAt(sender:)))
            button.addGestureRecognizer(tapGesture)
            navigationItens[index].button = button
            tabBarView.addArrangedSubview(button)
        }
        tabBarView.addArrangedSubview(UIView.spacer)
    }
}

extension VerticalTabBarView: ViewCode {
    
    func setupHierarchy() {
        addSubview(contentView)
        addSubview(tabBarView)
        setupNavigationItens()
    }
    
    func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
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
