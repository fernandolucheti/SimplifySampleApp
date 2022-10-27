//
//  BudgetBarView.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//

import UIKit

final class BudgetBarView: UIView {
    
    var viewModel: HomeBudgetBarModels.ViewModel? {
        didSet {
            if let viewModel = viewModel {
                addCategoriesViews(using: viewModel)
            }
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
    
    private func addCategoriesViews(using viewModel: HomeBudgetBarModels.ViewModel) {
        
        guard viewModel.totalSpentSum != 0 else { return }
        let screenHeight = UIScreen.main.bounds.height
        
        viewModel.categories.forEach { category in
            let view = UIView()
            let categoryHeight = (category.totalSpent/viewModel.totalSpentSum) * screenHeight

            view.backgroundColor = UIColor(hex: category.color)
            contentStack.addArrangedSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
                view.heightAnchor.constraint(equalToConstant: categoryHeight)
            ])
        }
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
