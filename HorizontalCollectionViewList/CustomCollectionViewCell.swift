//
//  CustomCollectionViewCell.swift
//  HorizontalCollectionViewList
//
//  Created by brubru on 25.11.2024.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
	
    var action: ((String) -> ())?
    
	// Создаем UILabel
	private let titleLabel = UILabel()
    
    private var product: Product?
	
	// Инициализатор ячейки
    override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
		setupLayout()
        
	}
    
    init(product: Product) {
        super.init(frame: .zero)
        self.product = product
    }
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        action?(product?.id ?? "")
    }
	
	// Метод для конфигурации ячейки
	func configure(with text: String) {
		contentView.backgroundColor = .systemPink
		titleLabel.text = text
	}
}

extension CustomCollectionViewCell {
	private func setupViews() {
		contentView.addSubview(titleLabel)
		
		titleLabel.textAlignment = .center
		titleLabel.textColor = .black
		titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
		titleLabel.numberOfLines = 0
        
	}
}

//MARK: - Layout
extension CustomCollectionViewCell {
	func setupLayout() {
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
			titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
		])
	}
}
