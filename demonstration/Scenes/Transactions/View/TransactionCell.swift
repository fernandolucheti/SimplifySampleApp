//
//  TransactionCell.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

final class TransactionCell: UITableViewCell {
    
    var viewModel: TransactionCellViewModel
    
    private let contentStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private lazy var categoryView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: viewModel.categoryColor)
        return view
    }()
    
    private let verticalLabelsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var transactionNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = ColorTheme.secondaryColor.color
        label.text = viewModel.name
        return label
    }()
    
    private lazy var transactionDateLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = ColorTheme.secondaryColor.color
        label.text = viewModel.date
        return label
    }()
    
    private lazy var transactionValueLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = viewModel.value > 0 ? ColorTheme.primaryAccent.color : ColorTheme.secondaryAccent.color
        label.text = viewModel.value.currencyString()
        return label
    }()
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, viewModel: TransactionCellViewModel) {
        self.viewModel = viewModel
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TransactionCell: ViewCode {
    func setupHierarchy() {
        addSubview(categoryView)
        addSubview(contentStack)
        contentStack.addArrangedSubview(verticalLabelsStack)
        verticalLabelsStack.addArrangedSubview(transactionNameLabel)
        verticalLabelsStack.addArrangedSubview(transactionDateLabel)
        contentStack.addArrangedSubview(transactionValueLabel)
    }
    
    func setupConstraints() {
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        verticalLabelsStack.translatesAutoresizingMaskIntoConstraints = false
        transactionNameLabel.translatesAutoresizingMaskIntoConstraints = false
        transactionDateLabel.translatesAutoresizingMaskIntoConstraints = false
        transactionDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryView.widthAnchor.constraint(equalToConstant: 10),
            categoryView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            categoryView.topAnchor.constraint(equalTo: topAnchor),
            categoryView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentStack.leadingAnchor.constraint(equalTo: categoryView.trailingAnchor, constant: 10),
            contentStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    func configureView() {
        selectionStyle = .none
        backgroundColor = .clear
    }
}
