//
//  Register2ViewController.swift
//  Test
//
//  Created by admin on 2/28/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Alamofire

class Register2ViewController: UIViewController {

    @IBOutlet weak var btnExit: UIButton!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var tfFullname: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    private func isValidPassword(password: String) -> Bool {
        return password.count >= 6
    }
    
    private func isValidated() -> Bool {
        guard let email = tfEmail.text, isValidEmail(testStr: email) else {
            showAlert(title: "Message", alertMessage: "Invalid email !!!")
            return false
        }
        
        guard let password = tfPassword.text, isValidPassword(password: password) else {
            showAlert(title: "Message", alertMessage: "Invalid pass !!!")
            return false
        }
        
        guard let fullName = tfFullname.text, !fullName.isEmpty else { return false }
        
        return true
    }
    
    @IBAction func btnDonePressed(_ sender: UIButton) {
        guard isValidated(), let email = tfEmail.text, let password = tfPassword.text, let fullname = tfFullname.text else { return }
        let urlLis = "https://reqres.in/api/register"
        
        let parameter: Parameters = [
            "fullName": fullname,
            "email": email,
            "password": password
        ]
        
        AF
            .request(urlLis, method: .post, parameters: parameter, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let token):
                    print("isi: \(token)")
                    print("Successfully !!!")
                    
                    
                case .failure(_):
                    print("Something is wrong !!!")
                }
        }
    }
    
    @IBAction func btnExitPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
}
}
