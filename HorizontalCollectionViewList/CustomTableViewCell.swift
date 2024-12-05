//
//  CustomTableViewCell.swift
//  HorizontalCollectionViewList
//
//  Created by brubru on 25.11.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    //MARK: - Private Property
    private let cellIdentifier = "CollectionContainerViewCell"
    private let customTableVC = CustomCollectionViewCell()
    private var productsArray: [Product] = []
    
    var action: ((String) -> ())?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func configure(with categories: Category) {
        productsArray = categories.products //заполняем массив products
        collectionView.reloadData()
    }
}


//MARK: - Settings
extension CustomTableViewCell {
    private func setupView() {
        
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
}


//MARK: - Layout
extension CustomTableViewCell {
    func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}


//MARK: - UICollectionViewDataSource
extension CustomTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellIdentifier,
            for: indexPath
        ) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        
        let content = productsArray[indexPath.row] //получаем один продукт
        
        cell.configure(with: content.title) //конфигурируем в ячейку title этого продукта
        
        cell.action = { _ in
            self.action?(content.title)
        }
        
        cell.backgroundColor = .cyan // Делаем ячейку заметной.
        return cell
    }
}
