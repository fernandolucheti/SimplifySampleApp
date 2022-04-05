//
//  PieChartDataApapter.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//

import UIKit
import Charts

final class PieChartDataApapter {
    static func convertData(_ viewModel: PieChartModels.ViewModel) -> PieChartData {
        
        let entries = viewModel.categories.compactMap { PieChartDataEntry(value: ($0.totalSpent)) }
        let set = PieChartDataSet(entries: entries)
        set.sliceSpace = 2
        set.colors = viewModel.categories.compactMap { UIColor(hex: $0.color) }
        return PieChartData(dataSet: set)
    }
}

