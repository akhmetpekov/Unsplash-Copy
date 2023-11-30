//
//  CustomButton.swift
//  UnsplashApp
//
//  Created by Erik on 26.11.2023.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        configuration = .filled()
        configuration?.baseBackgroundColor = .white
        configuration?.titleAlignment = .center
        configuration?.baseForegroundColor = .black
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 5
    }
}
