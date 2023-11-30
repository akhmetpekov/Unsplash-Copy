//
//  CustomCollectionViewCell.swift
//  UnsplashApp
//
//  Created by Erik on 27.11.2023.
//

import UIKit

class CustomTopicsCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCellIdentifier"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private let cellTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    public func configure(with image: UIImage, label: String) {
        cellTitle.text = label
//        imageView.image = image.imageWithAlpha(alpha: 0.5)
        setupUI()
        makeConstraints()
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        imageView.addSubview(cellTitle)
        contentView.layer.cornerRadius = 7
        contentView.layer.masksToBounds = true
    }
    
    private func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        cellTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
