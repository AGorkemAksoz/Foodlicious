//
//  CategoryCollectionViewCell.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 26.01.2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    func setup(category: DishCategory) {
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }

}
