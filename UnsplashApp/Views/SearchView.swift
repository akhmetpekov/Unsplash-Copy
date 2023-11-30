//
//  SearchView.swift
//  UnsplashApp
//
//  Created by Erik on 08.11.2023.
//

import UIKit
import SnapKit
import CHTCollectionViewWaterfallLayout

class SearchView: UIViewController {
    
    private var contentViewBottomConstraint: Constraint?
    private var models = [Image]()
    let images = Array(1...9).map { "\($0)" }
    
    private let searchTextField: UISearchTextField = {
        let searchTextField = UISearchTextField()
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Search photos, collections, users", attributes: [
            NSAttributedString.Key.foregroundColor: Resources.Colors.searchTextFieldPlaceholderColor,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)
        ])
//        searchTextField.attributedText = NSAttributedString(string: "", attributes: [
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
//            NSAttributedString.Key.foregroundColor: UIColor.white
//        ])
        
        searchTextField.textColor = .white
        if let glassIconView = searchTextField.leftView as? UIImageView {
            glassIconView.tintColor = Resources.Colors.searchTextFieldPlaceholderColor
        }
        searchTextField.backgroundColor = Resources.Colors.searchTextFieldBackground
        searchTextField.layer.cornerRadius = 10
        searchTextField.layer.masksToBounds = true
        return searchTextField
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let discoverLabel: UILabel = {
        let label = UILabel()
        label.text = "Discover"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        return label
    }()
    
    private let waterfallCollectionView: UICollectionView = {
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .shortestFirst
        layout.columnCount = 2
        layout.minimumColumnSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setupUI()
        makeConstraints()
        updateContentViewHeight()
        waterfallCollectionView.delegate = self
        waterfallCollectionView.dataSource = self
        models = images.compactMap {
            return Image.init(imageName: $0, height: CGFloat.random(in: 300...400))
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
    
    private func setupUI() {
        view.backgroundColor = Resources.Colors.background
        view.addSubview(searchTextField)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(discoverLabel)
        contentView.addSubview(waterfallCollectionView)
    }
    
    private func makeConstraints() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(Resources.Constants.padding)
            make.trailing.equalToSuperview().offset(-1 * Resources.Constants.padding)
            make.height.equalTo(30)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(1)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.width.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView) // Set to scrollView's height or greater
        }
        
        discoverLabel.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(20)
            make.leading.equalTo(Resources.Constants.padding)
        }
    
        waterfallCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(discoverLabel.snp.bottom).offset(10)
        }
    }

}

extension SearchView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else { fatalError() }
        let image = UIImage(named: models[indexPath.row].imageName)
        cell.configure(image: image, title: models[indexPath.row].imageName)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingFor section: Int) -> CGFloat {
        return 2
    }
    
    
}

extension SearchView: CHTCollectionViewDelegateWaterfallLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2, height: models[indexPath.row].height)
    }
}

