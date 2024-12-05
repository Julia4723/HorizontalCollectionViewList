//
//  ViewController.swift
//  HorizontalCollectionViewList
//
//  Created by brubru on 25.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Private Property
    private let cellIdentifier = "cellIdentifier"
    private let tableView = UITableView()
    private var label = UILabel()
    private var categories: [Category] = []
    
    var categoryManager: ICategoryManager?
    
    
    //MARK: - Init
    init(categoryManager: ICategoryManager) {
        self.categoryManager = categoryManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        
        getCategories()
        print(categories.count)
    }
    
    //MARK: - Methods
    func getCategories() {
        guard let manager = categoryManager else {return}
        categories = manager.getCategories()
        
        tableView.reloadData()
    }
}

// MARK: - Settings View
private extension ViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.rowHeight = 150
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

//MARK: - Layout
private extension ViewController {
    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        categories[section].category
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? CustomTableViewCell else { return UITableViewCell() }
        
        
        let category = categories[indexPath.section]
        
        cell.action = { text in
            let detailsVC = DetailsVC()
            detailsVC.configure(product: text)
            self.present(detailsVC, animated: true)
        }
        
        cell.configure(with: category)
        return cell
    }
}
