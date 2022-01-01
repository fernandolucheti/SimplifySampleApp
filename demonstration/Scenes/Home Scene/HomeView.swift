//
//  HomeView.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import UIKit

final class HomeView: UIView {
    
    let budgetBar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.secondaryColor
        return view
    }()
    
    let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let balanceTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = UIColor.secondaryColor
        label.text = "Sum balance in accounts"
        return label
    }()
    
    let balanceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor.primaryAccent
        label.text = "$ 40,503.76"
        return label
    }()
    
    let monthSection = BalanceSummarySectionView(viewModel: BalanceSummarySectionViewModel(type: .month, value: 0.0, first: true))
    
    let incomeSection = BalanceSummarySectionView(viewModel: BalanceSummarySectionViewModel(type: .income, value: 30000.00))
    
    let expenseSection = BalanceSummarySectionView(viewModel: BalanceSummarySectionViewModel(type: .expense, value: 120000.00))
    
    let monthlyBalanceSection = BalanceSummarySectionView(viewModel: BalanceSummarySectionViewModel(type: .monthlyBalance, value: -18000.00, last: true))
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCode {
    
    func setupHierarchy() {
//        addSubview(budgetBar)
        
        addSubview(headerStackView)
        headerStackView.addArrangedSubview(balanceTitleLabel)
        headerStackView.addArrangedSubview(balanceLabel)
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(monthSection)
        contentStackView.addArrangedSubview(incomeSection)
        contentStackView.addArrangedSubview(expenseSection)
        contentStackView.addArrangedSubview(monthlyBalanceSection)
    }
    
    func setupConstraints() {
        
        budgetBar.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerStackView.heightAnchor.constraint(equalToConstant: 60),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            contentStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configureView() {
        
        backgroundColor = .primaryColor
        
    }
}
