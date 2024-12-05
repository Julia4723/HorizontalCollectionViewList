//
//  DetailsVC.swift
//  HorizontalCollectionViewList
//
//  Created by user on 05.12.2024.
//

import UIKit

class DetailsVC: UIViewController {
    
    //MARK: - Private Property
    private let titleLabel = UILabel()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        setupLabel()
        setupLayout()
    }
    
    //MARK: - Methods
    func configure(product: String) {
        titleLabel.text = product
    }
}

//MARK: - Methods
extension DetailsVC {
    private func setupLabel() {
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .black
    }
    
    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }
}
