//
//  SceneDelegate.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let viewController = HomeTabViewController(
            navigationItens: [NavigationTabItem(icon: .add, viewController: HomeFactory.createViewController()),
                              NavigationTabItem(icon: .add, viewController: TransactionsFactory.createViewController())])
        window.rootViewController = viewController
        window.backgroundColor = .primaryColor
        self.window = window
        window.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

