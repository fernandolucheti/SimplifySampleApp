//
//  UIView+loading.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

enum ViewTags: Int {
    case loading = 943
}

extension UIView {
    
    func setLoading(_ isLoading: Bool) {
        
        removeLoading()
        if !isLoading { return }
        
        let background = UIView()
        background.tag = ViewTags.loading.rawValue
        background.backgroundColor = ColorTheme.primaryColor.color
        let loading = UIActivityIndicatorView(style: .large)
        loading.color = ColorTheme.secondaryColor.color
        loading.tag = ViewTags.loading.rawValue
        background.addSubview(loading)
        addSubview(background)
        loading.startAnimating()
        background.translatesAutoresizingMaskIntoConstraints = false
        loading.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.topAnchor.constraint(equalTo: topAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            loading.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            loading.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            loading.widthAnchor.constraint(equalToConstant: 60),
            loading.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func removeLoading() {
        for subview in self.subviews where subview.tag == ViewTags.loading.rawValue {
            subview.removeFromSuperview()
        }
    }
}
