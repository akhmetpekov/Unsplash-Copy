//
//  CustomTextField.swift
//  UnsplashApp
//
//  Created by Erik on 26.11.2023.
//

import UIKit

class CustomTextField: UITextField {
    
    private let bottomLine: CALayer = {
        let line = CALayer()
        line.backgroundColor = UIColor.lightGray.cgColor
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .clear
        borderStyle = .none
        attributedPlaceholder = NSAttributedString(
            string: "Placeholder", attributes: [
                NSAttributedString.Key.foregroundColor: Resources.Colors.secondaryGray,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)
            ]
        )
        textColor = .white
        autocorrectionType = .no
        tintColor = .white
        addBottomLine()
    }
    
    private func addBottomLine() {
        layer.addSublayer(bottomLine)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bottomLine.frame = CGRect(x: 0, y: bounds.height + 3, width: bounds.width, height: 1)
    }
}

extension CustomTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        bottomLine.backgroundColor = UIColor.white.cgColor
    }
    
    
}
