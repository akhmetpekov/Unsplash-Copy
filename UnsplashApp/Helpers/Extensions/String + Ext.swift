//
//  String + Ext.swift
//  UnsplashApp
//
//  Created by Erik on 27.11.2023.
//

import UIKit

extension String {
    /// Return attributed string
    /// - Parameter text: String text for bold text.
    func getAttributedBoldText(text: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self, attributes: [.foregroundColor: UIColor.blue])
        if let range = self.range(of: text) {
            let startIndex = self.distance(from: self.startIndex, to: range.lowerBound)
            let range = NSMakeRange(startIndex, text.count)
            attributedString.addAttributes([.font : UIFont.boldSystemFont(ofSize: 20)], range: range)
        }
        return attributedString
    }
}
