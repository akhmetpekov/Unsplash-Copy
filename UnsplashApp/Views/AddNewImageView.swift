//
//  LoginView.swift
//  UnsplashApp
//
//  Created by Erik on 21.11.2023.
//

import UIKit
import SnapKit

class AddNewImageView: UIViewController {
    
    private var contentViewBottomConstraint: Constraint?
    
    private let header: UIView = {
        let header = UIView()
        header.backgroundColor = Resources.Colors.background
//        header.backgroundColor = .systemCyan
        return header
    }()
    
    private let headerTitle: UILabel = {
        let label = UILabel()
        label.text = "Contribute to Unsplash"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let uploadImageWindow: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let uploadImageWindowIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo.on.rectangle.angled")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .darkGray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let uploadImageWindowLabel: UILabel = {
        let label = UILabel()
        label.text = "Upload your photo to the largest\n library of open photography"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    private let submitToTopicsLabel: UILabel = {
        let label = UILabel()
        label.text = "Submit to topics"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private var topicsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.setCollectionViewLayout(layout, animated: true)
        collection.register(CustomTopicsCollectionViewCell.self, forCellWithReuseIdentifier: CustomTopicsCollectionViewCell.identifier)
        return collection
    }()
    
    private let latestFromTheBLogLabel: UILabel = {
        let label = UILabel()
        label.text = "Latest from the blog"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private var latestBlogCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
//        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.setCollectionViewLayout(layout, animated: true)
        collection.register(CustomLatestBlogCollectionViewCell.self, forCellWithReuseIdentifier: CustomLatestBlogCollectionViewCell.identifier)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topicsCollectionView.delegate = self
        topicsCollectionView.dataSource = self
        latestBlogCollectionView.delegate = self
        latestBlogCollectionView.dataSource = self
        setupUI()
        makeConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        uploadImageWindow.layer.masksToBounds = false
        uploadImageWindow.layer.cornerRadius = uploadImageWindow.bounds.height / 12
        uploadImageWindow.addDashedBorder()
    }
    
    private func setupUI() {
        view.backgroundColor = Resources.Colors.background
        view.addSubview(header)
        header.addSubview(headerTitle)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(uploadImageWindow)
        uploadImageWindow.addSubview(uploadImageWindowIcon)
        uploadImageWindow.addSubview(uploadImageWindowLabel)
        contentView.addSubview(submitToTopicsLabel)
        contentView.addSubview(topicsCollectionView)
        contentView.addSubview(latestFromTheBLogLabel)
        contentView.addSubview(latestBlogCollectionView)
        updateContentViewHeight()
    }
    
    private func makeConstraints() {
        header.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        
        headerTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalTo(Resources.Constants.padding)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        uploadImageWindow.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.padding)
            make.trailing.equalToSuperview().offset(-1 * Resources.Constants.padding)
            make.height.equalTo(200)
            make.top.equalToSuperview().offset(3)
        }
        
        uploadImageWindowIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-30)
            make.width.equalTo(70)
            make.height.equalTo(50)
        }
        
        uploadImageWindowLabel.snp.makeConstraints { make in
            make.top.equalTo(uploadImageWindowIcon.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        submitToTopicsLabel.snp.makeConstraints { make in
            make.top.equalTo(uploadImageWindow.snp.bottom).offset(Resources.Constants.padding + 10)
            make.leading.equalToSuperview().offset(Resources.Constants.padding)
        }
        
        topicsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(submitToTopicsLabel.snp.bottom).offset(Resources.Constants.padding)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(240)
        }
        
        latestFromTheBLogLabel.snp.makeConstraints { make in
            make.top.equalTo(topicsCollectionView.snp.bottom).offset(Float(Resources.Constants.padding) * 2.5)
            make.leading.equalToSuperview().offset(Resources.Constants.padding)
        }
        
        latestBlogCollectionView.snp.makeConstraints { make in
            make.top.equalTo(latestFromTheBLogLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(240)
        }
    }
    
    private func updateContentViewHeight() {
        guard let lastSubview = contentView.subviews.last else { return }
        
        contentViewBottomConstraint?.deactivate()
        
        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(lastSubview.snp.bottom).offset(Resources.Constants.padding)
            contentViewBottomConstraint = make.bottom.equalToSuperview().constraint
        }
    }
}

extension AddNewImageView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topicsCollectionView {
            return 7
        } else if collectionView == latestBlogCollectionView {
            return 4
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topicsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTopicsCollectionViewCell.identifier, for: indexPath) as! CustomTopicsCollectionViewCell
            guard let image = UIImage(named: "1") else { fatalError() }
            cell.configure(with: image, label: "Cozy Moments")
            return cell
        } else if collectionView == latestBlogCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomLatestBlogCollectionViewCell.identifier, for: indexPath) as! CustomLatestBlogCollectionViewCell
            guard let image = UIImage(named: "1") else { fatalError() }
            cell.configure(with: image, label: "Behind 5 Billion with Joanna Rowling", subtitleText: "Alyssa Wright")
            return cell
        }
        return UICollectionViewCell()
    }
    
}

extension AddNewImageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topicsCollectionView {
            let itemsPerRow: CGFloat = 2
            let padding = CGFloat(14)
            let heightPerItem = (collectionView.frame.height - padding) / 2
            let widthPerItem = heightPerItem * 1.5
            return CGSizeMake(widthPerItem, heightPerItem)
        } else if collectionView == latestBlogCollectionView {
            let itemsPerRow: CGFloat = 1
            let padding = CGFloat(14)
            let heightPerItem = collectionView.frame.height - padding * 2
            let widthPerItem = heightPerItem * 1.2
            return CGSizeMake(widthPerItem, heightPerItem)
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}

