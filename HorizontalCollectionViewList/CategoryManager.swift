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
                Product(id: "1", title: "Bread"),
                Product(id: "2",title: "Rice"),
                Product(id: "3",title: "Pasta"),
                Product(id: "5",title: "Oats"),
                Product(id: "6",title: "Quinoa"),
                Product(id: "7",title: "Barley"),
                Product(id: "8",title: "Cornmeal"),
                Product(id: "9",title: "Bagels"),
                Product(id: "10",title: "Croissants")
            ]),
            Category(category: "Meat and Poultry", products: [
                Product(id: "11",title: "Chicken"),
                Product(id: "12",title: "Beef"),
                Product(id: "13",title: "Turkey"),
                Product(id: "14",title: "Pork"),
                Product(id: "15",title: "Lamb"),
                Product(id: "16",title: "Duck"),
                Product(id: "17",title: "Bacon"),
                Product(id: "18",title: "Sausages"),
                Product(id: "19",title: "Veal")
            ]),
            Category(category: "Dairy Products", products: [
                Product(id: "20", title: "Milk"),
                Product(id: "21", title: "Cheese"),
                Product(id: "22", title: "Butter"),
                Product(id: "23", title: "Yogurt"),
                Product(id: "24", title: "Cream"),
                Product(id: "25", title: "Ice Cream"),
                Product(id: "26", title: "Sour Cream"),
                Product(id: "27", title: "Cottage Cheese"),
                Product(id: "28", title: "Whipped Cream")
            ])
        ]
    }
}
