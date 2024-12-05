//
//  SceneDelegate.swift
//  HorizontalCollectionViewList
//
//  Created by brubru on 25.11.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: windowScene)
        let categoryManager = CategoryManager()
        window?.rootViewController = ViewController(categoryManager: categoryManager)
		window?.makeKeyAndVisible()
	}
}

