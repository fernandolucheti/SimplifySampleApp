//
//  CategoryCell.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//

import UIKit

final class CategoryCell: UITableViewCell {
    
    var viewModel: PieChartModels.CategoryViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.name
            titleLabel.textColor = viewModel.color
            totalLabel.text = viewModel.totalSpent.currencyString()
            circleView.set(color: viewModel.color)
        }
    }
    
    private let circleView = CircleView(color: ColorTheme.secondaryColor.color, size: 20)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let totalLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = ColorTheme.secondaryColor.color
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryCell: ViewCode {
    func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(circleView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(UIView.spacer)
        stackView.addArrangedSubview(totalLabel)
    }
    
    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configureView() {
        backgroundColor = .clear
        selectionStyle = .none
    }
}
