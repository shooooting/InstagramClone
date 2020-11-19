//
//  SceneDelegate.swift
//  InstagramClone
//
//  Created by ㅇ오ㅇ on 2020/11/18.
//

import Firebase
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        FirebaseApp.configure()
        
        let tabBar = UITabBarController()
        let home = UINavigationController(rootViewController: HomeViewController())
        let explore = UINavigationController(rootViewController: ExploreViewController())
        let camera = UINavigationController(rootViewController: CameraViewController())
        let noti = UINavigationController(rootViewController: NotificationViewController())
        let profile = UINavigationController(rootViewController: ProfileViewController())
        
        home.tabBarItem = UITabBarItem(title: .none, image: UIImage(systemName: "house"), tag: 0)
        explore.tabBarItem = UITabBarItem(title: .none, image: UIImage(systemName: "globe"), tag: 1)
        camera.tabBarItem = UITabBarItem(title: .none, image: UIImage(systemName: "plus"), tag: 2)
        noti.tabBarItem = UITabBarItem(title: .none, image: UIImage(systemName: "bell"), tag: 3)
        profile.tabBarItem = UITabBarItem(title: .none, image: UIImage(systemName: "person"), tag: 4)
        
        UITabBar.appearance().tintColor = .black
        tabBar.viewControllers = [home, explore, camera, noti, profile]
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
}

