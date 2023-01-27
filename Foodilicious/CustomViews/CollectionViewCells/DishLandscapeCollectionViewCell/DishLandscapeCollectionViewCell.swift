//
//  DishLandscapeCollectionViewCell.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 26.01.2023.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DishLandscapeCollectionViewCell"
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories 
    }

}
