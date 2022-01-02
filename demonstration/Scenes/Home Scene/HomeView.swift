//
//  HomeView.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import UIKit

final class HomeView: UIView {
    
    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let balanceTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = UIColor.secondaryColor
        label.text = "Sum balance in accounts"
        return label
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor.primaryAccent
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(_ viewModel: HomeModels.ViewModel) {
        
        balanceLabel.text = viewModel.balance
        contentStackView.removeAllArrangedSubviews()
        
        let sections = [BalanceSummarySectionViewModel(type: .month, value: "", month: "December", first: true),
                          BalanceSummarySectionViewModel(type: .income, value: viewModel.income),
                          BalanceSummarySectionViewModel(type: .expense, value: viewModel.expenses),
                          BalanceSummarySectionViewModel(type: .monthlyBalance, value: viewModel.monthlyBalance, last: true)]
        
        for section in sections {
            let sectionView = BalanceSummarySectionView(viewModel: section)
            contentStackView.addArrangedSubview(sectionView)
        }
    }
}

extension HomeView: ViewCode {
    
    func setupHierarchy() {
        addSubview(headerStackView)
        headerStackView.addArrangedSubview(balanceTitleLabel)
        headerStackView.addArrangedSubview(balanceLabel)
        addSubview(contentStackView)
    }
    
    func setupConstraints() {
        
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
