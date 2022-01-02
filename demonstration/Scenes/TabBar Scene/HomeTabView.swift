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

final class HomeTabView: UIView {
    
    var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .primaryColor
        return view
    }()
    
    private let tabBarView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .tertiaryColor
        stackView.alignment = .center
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
        backgroundColor = .tertiaryColor
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
        
        for (index, item) in navigationItens.enumerated() {
            let button = UIButton()
            button.setImage(item.icon.withTintColor(.secondaryColor), for: .normal)
            button.setImage(item.icon.withTintColor(.primaryAccent), for: .selected)
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
    }
}

extension HomeTabView: ViewCode {
    
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
            tabBarView.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            tabBarView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80),
            tabBarView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
}
