//
//  PieChartCell.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//

import UIKit
import Charts

final class PieChartCell: UITableViewCell {
    
    private lazy var pieChart: PieChartView = {
        let pieChart = PieChartView()
        pieChart.usePercentValuesEnabled = true
        pieChart.legend.enabled = false
        pieChart.holeColor = .clear
        pieChart.transparentCircleColor = .clear
        return pieChart
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(data: PieChartData) {
        pieChart.data = data
        let percentFormatter = NumberFormatter()
        percentFormatter.numberStyle = .percent
        percentFormatter.maximumFractionDigits = 1
        percentFormatter.multiplier = 1
        pieChart.data?.setValueFormatter(DefaultValueFormatter(formatter: percentFormatter))
    }
}

extension PieChartCell: ViewCode {
    func setupHierarchy() {
        addSubview(pieChart)
    }
    
    func setupConstraints() {
        pieChart.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pieChart.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            pieChart.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            pieChart.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            pieChart.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    func configureView() {
        backgroundColor = .clear
        selectionStyle = .none
    }
}
