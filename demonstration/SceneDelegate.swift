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
        window.rootViewController = HomePageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        window.backgroundColor = ColorTheme.primaryColor.color
        self.window = window
        window.makeKeyAndVisible()
        
    }
}

