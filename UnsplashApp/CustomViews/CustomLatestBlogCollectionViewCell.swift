//
//  CustomLatestBlogCollectionViewCell.swift
//  UnsplashApp
//
//  Created by Erik on 28.11.2023.
//

import UIKit

class CustomLatestBlogCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomLatestBlogCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private let cellTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let labelsView: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .clear
        return uiview
    }()
    
    public func configure(with image: UIImage, label: String, subtitleText: String) {
        cellTitle.text = label
        subtitle.text = subtitleText
//        imageView.image = image.imageWithAlpha(alpha: 0.5)
        setupUI()
        makeConstraints()
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        imageView.layer.cornerRadius = 7
        imageView.layer.masksToBounds = true
        contentView.addSubview(labelsView)
        labelsView.addSubview(cellTitle)
        labelsView.addSubview(subtitle)
    }
    
    private func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(labelsView.snp.top).offset(-10)
        }
        
        labelsView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(contentView.frame.height / 5)
        }
        
        cellTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        subtitle.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
}
