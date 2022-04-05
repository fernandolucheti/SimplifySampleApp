//
//  HomePageViewController.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//

import UIKit

final class HomePageViewController: UIPageViewController {
    
    private var orderedViewControllers = [
        TransactionsFactory.createViewController(),
        VerticalTabBarFactory.createViewController()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        setViewControllers([orderedViewControllers[1]],
                           direction: .forward,
                           animated: false,
                           completion: nil)
    }
}

extension HomePageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        guard orderedViewControllers.count > previousIndex else { return nil }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else { return nil }
        guard orderedViewControllersCount > nextIndex else { return nil }
        return orderedViewControllers[nextIndex]
    }
    
    
}

