//
//  Controller.swift
//  Test
//
//  Created by admin on 2/27/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func showAlert(title: String, alertMessage: String) {
        let alert = UIAlertController(title: title, message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
