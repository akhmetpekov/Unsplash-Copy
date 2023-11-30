//
//  CustomTabBar.swift
//  UnsplashApp
//
//  Created by Erik on 08.11.2023.
//

import UIKit

final class CustomTabBar: UITabBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTabBar()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabBar() {
        backgroundColor = Resources.Colors.background
        tintColor = .white
        unselectedItemTintColor = .systemGray
    }
}
