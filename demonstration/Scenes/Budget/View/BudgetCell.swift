//
//  BudgetCell.swift
//  demonstration
//
//  Created by Fernando Lucheti on 19/03/22.
//

import UIKit

final class BudgetCell: UITableViewCell {
    
    private var viewModel: BudgetModels.BudgetCellViewModel? {
        didSet {
            categoryNameLabel.text = viewModel?.categoryName
            if let colorHex = viewModel?.color {
                categoryNameLabel.textColor = UIColor(hex: colorHex)
            }
            categoryBudgetLabel.text = "Budget: \(viewModel?.categoryBudget ?? String())"
            categoryBudgetRemainingLabel.text = "Remaining: \(viewModel?.categoryBudgetRemaining ?? String())"
            totalSpentValueLabel.text = viewModel?.totalSpent
        }
    }
    private lazy var thermometerView = ThermometerView(color: ColorTheme.secondaryColor.color, fillPercent: 0)
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private let budgetStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private let totalSpentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        return stackView
    }()
    
    private let categoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()
    
    private let categoryBudgetLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = ColorTheme.secondaryColor.color
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()
    
    private let categoryBudgetRemainingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = ColorTheme.secondaryColor.color
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()
    
    private let totalSpentTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = ColorTheme.secondaryColor.color
        label.text = "Total spent:"
        label.setContentHuggingPriority(.required, for: .vertical)
        label.textAlignment = .right
        return label
    }()
    
    private let totalSpentValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = ColorTheme.secondaryAccent.color
        label.setContentHuggingPriority(.required, for: .vertical)
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    public func setupCell(_ viewModel: BudgetModels.BudgetCellViewModel) {
        self.viewModel = viewModel
        thermometerView.setup(color: UIColor(hex: viewModel.color), fillPercent: viewModel.fillPercent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BudgetCell: ViewCode {
    func setupHierarchy() {
        addSubview(thermometerView)
        addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(budgetStackView)
        horizontalStackView.addArrangedSubview(totalSpentStackView)
        
        budgetStackView.addArrangedSubview(categoryNameLabel)
        budgetStackView.addArrangedSubview(categoryBudgetLabel)
        budgetStackView.addArrangedSubview(categoryBudgetRemainingLabel)
        budgetStackView.addArrangedSubview(UIView.spacer)
        
        totalSpentStackView.addArrangedSubview(totalSpentTitleLabel)
        totalSpentStackView.addArrangedSubview(totalSpentValueLabel)
        totalSpentStackView.addArrangedSubview(UIView.spacer)
    }
    
    func setupConstraints() {
        thermometerView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thermometerView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            thermometerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            thermometerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            thermometerView.heightAnchor.constraint(equalToConstant: 120),
            
            horizontalStackView.leadingAnchor.constraint(equalTo: thermometerView.trailingAnchor, constant: 16),
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 26),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func configureView() {
        backgroundColor = .clear
        selectionStyle = .none
    }
}
