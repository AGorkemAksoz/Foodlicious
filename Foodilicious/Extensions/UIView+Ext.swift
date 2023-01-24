//
//  UIView+Ext.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 23.01.2023.
//

import UIKit


extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

