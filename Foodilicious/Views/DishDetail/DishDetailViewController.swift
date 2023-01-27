//
//  DishDetailViewController.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 27.01.2023.
//

import UIKit

class DishDetailViewController: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func orderButtonClicked(_ sender: Any) {
    }
    
}
