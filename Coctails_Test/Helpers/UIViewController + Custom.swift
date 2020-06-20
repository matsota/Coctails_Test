//
//  UIViewController + Custom.swift
//  Coctails_Test
//
//  Created by Andrew Matsota on 20.06.2020.
//  Copyright © 2020 Andrew Matsota. All rights reserved.
//

import UIKit

//MARK: Alerts
extension UIViewController {
    
    func alertAboutConnectionLost(method name: String, error: Error) {
        self.present(UIAlertController.alertAppearanceForTwoSec(title: "Внимание", message: "Скорее всего произошла потеря соединения"), animated: true)
        print("ERROR: \(self): \(name) ", error.localizedDescription)
    }
    
    func alertAboutCoreDataError(method name: String, error: NSError) {
        self.present(UIAlertController.alertAppearanceForTwoSec(title: "Внимание", message: "Произошла ошибка приложения. Перезапустите его"), animated: true)
        print("ERROR: \(self): \(name) ", error.localizedDescription)
    }
    
}

//MARK: Keyboard
extension UIViewController {
    
    @objc func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
}
