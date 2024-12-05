//
//  CategoryManager.swift
//  HorizontalCollectionViewList
//
//  Created by user on 03.12.2024.
//

import UIKit

protocol ICategoryManager {
    func getCategories() -> [Category]
}

class CategoryManager {}

extension CategoryManager: ICategoryManager {
    func getCategories() -> [Category] {
        [
            Category(category: "Grains and Bread", products: [
                Product(title: "Bread"),
                Product(title: "Rice"),
                Product(title: "Pasta"),
                Product(title: "Oats"),
                Product(title: "Quinoa"),
                Product(title: "Barley"),
                Product(title: "Cornmeal"),
                Product(title: "Bagels"),
                Product(title: "Croissants")
            ]),
            Category(category: "Meat and Poultry", products: [
                Product(title: "Chicken"),
                Product(title: "Beef"),
                Product(title: "Turkey"),
                Product(title: "Pork"),
                Product(title: "Lamb"),
                Product(title: "Duck"),
                Product(title: "Bacon"),
                Product(title: "Sausages"),
                Product(title: "Veal")
            ]),
            Category(category: "Dairy Products", products: [
                Product(title: "Milk"),
                Product(title: "Cheese"),
                Product(title: "Butter"),
                Product(title: "Yogurt"),
                Product(title: "Cream"),
                Product(title: "Ice Cream"),
                Product(title: "Sour Cream"),
                Product(title: "Cottage Cheese"),
                Product(title: "Whipped Cream")
            ])
        ]
    }
}
