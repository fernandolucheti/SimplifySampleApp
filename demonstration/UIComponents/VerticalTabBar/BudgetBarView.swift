//
//  BudgetBarView.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//

import UIKit

final class BudgetBarView: UIView {
    
    var viewModel: VerticalTabBarModels.ViewModel? {
        didSet {
            guard let totalSpentSum = viewModel?.categories.compactMap({ $0.totalSpent }).reduce(0, +) else { return }
            let screenHeight = UIScreen.main.bounds.height
            viewModel?.categories.forEach({ category in
                let view = UIView()
                contentStack.addArrangedSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    view.leadingAnchor.constraint(equalTo: leadingAnchor),
                    view.trailingAnchor.constraint(equalTo: trailingAnchor),
                    view.heightAnchor.constraint(equalToConstant: (category.totalSpent/totalSpentSum)*screenHeight)
                ])
                view.backgroundColor = category.color
            })
        }
    }
    
    let contentStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BudgetBarView: ViewCode {
    func setupHierarchy() {
        addSubview(contentStack)
    }
    
    func setupConstraints() {
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentStack.topAnchor.constraint(equalTo: topAnchor),
            contentStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
