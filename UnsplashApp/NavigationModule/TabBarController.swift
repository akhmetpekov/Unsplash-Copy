//
//  TabBarController.swift
//  UnsplashApp
//
//  Created by Erik on 08.11.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let customTabBar = CustomTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValue(customTabBar, forKey: "tabBar")
        setupTabItems()
    }
    
    private func setupTabItems() {
        let firstVC = FeedView()
        let secondVC = SearchView()
        let thirdVC = AddNewImageView()
        let fourthVC = ProfileView()
        
        firstVC.tabBarItem.image = UIImage(systemName: "photo.fill")
        secondVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        thirdVC.tabBarItem.image = UIImage(systemName: "plus.square.fill")
        fourthVC.tabBarItem.image = UIImage(systemName: "person.circle.fill")
        
        let nav1 = UINavigationController(rootViewController: firstVC)
        let nav2 = UINavigationController(rootViewController: secondVC)
        let nav3 = UINavigationController(rootViewController: thirdVC)
        let nav4 = UINavigationController(rootViewController: fourthVC)
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }
}
