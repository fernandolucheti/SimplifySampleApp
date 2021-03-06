//
//  SummarySectionView.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import UIKit

final class SummarySectionView: UIView {
    
    var viewModel: SummarySectionViewModel
    
    private lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = ColorTheme.secondaryColor.color
        return view
    }()
    
    private lazy var circleView: CircleView = {
        let circle = CircleView(color: viewModel.sectionColor.color,
                                borderColor: viewModel.borderColor.color,
                                size: 22,
                                borderWidth: 2)
        return circle
    }()
    
    private lazy var ammountTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = ColorTheme.secondaryColor.color
        label.text = viewModel.title
        return label
    }()
    
    private lazy var ammountLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = viewModel.sectionColor.color
        label.text = viewModel.subTitle
        return label
    }()
   
    private let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    init(viewModel: SummarySectionViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SummarySectionView: ViewCode {
    
    func setupHierarchy() {
        addSubview(line)
        addSubview(circleView)
        addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(ammountTitleLabel)
        if viewModel.subTitle != nil {
            labelsStackView.addArrangedSubview(ammountLabel)
        }
    }
    
    func setupConstraints() {
        
        translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        circleView.translatesAutoresizingMaskIntoConstraints = false
        ammountTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ammountLabel.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 200),
            line.topAnchor.constraint(equalTo: viewModel.first ? circleView.centerYAnchor : topAnchor),
            line.bottomAnchor.constraint(equalTo: viewModel.last ? circleView.centerYAnchor : bottomAnchor),
            line.widthAnchor.constraint(equalToConstant: 2),
            line.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            circleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 10),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor)
        ])
    }
}

