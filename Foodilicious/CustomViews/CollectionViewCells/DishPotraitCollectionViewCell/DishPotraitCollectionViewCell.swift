//
//  DishPotraitCollectionViewCell.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 26.01.2023.
//

import UIKit

class DishPotraitCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: DishPotraitCollectionViewCell.self)

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(dish: Dish) {
        titleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }
}
