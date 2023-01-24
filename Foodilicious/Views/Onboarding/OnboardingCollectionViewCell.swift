//
//  OnboardingCollectionViewCell.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 23.01.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OnboardingCollectionViewCell"
    
    @IBOutlet weak var sildeImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescLabel: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        sildeImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescLabel.text = slide.description
    }
}
