//
//  AlertController + Custom.swift
//  Coctails_Test
//
//  Created by Andrew Matsota on 20.06.2020.
//  Copyright © 2020 Andrew Matsota. All rights reserved.
//

import UIKit

//MARK: - SHOW INFORMATION
extension UIAlertController {
    
    static func alertAppearanceForHalfSec(title: String, message: String) -> (UIAlertController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            alert.dismiss(animated: true, completion: nil)
        }
        return alert
    }
    static func alertAppearanceForTwoSec(title: String, message: String) -> (UIAlertController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            alert.dismiss(animated: true, completion: nil)
        }
        return alert
    }
    
}

