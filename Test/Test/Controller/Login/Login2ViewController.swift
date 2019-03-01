//
//  Login2ViewController.swift
//  Test
//
//  Created by admin on 2/27/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Alamofire

class Login2ViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnSkip: UIButton!
    
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
            showAlert(title: "Message", alertMessage: "Invalid password !!!")
            return false
        }
        
        return true
    }
    
    @IBAction func btnLoginPressed(_ sender: UIButton) {
        guard isValidated(), let email = tfEmail.text, let password = tfPassword.text else { return }
        let urlLis = "https://reqres.in/api/login"
        
        let parameter: Parameters = [
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
                    self.showAlert(title: "Message", alertMessage: "Successfully")
                    
                case .failure(_):
                    print("Something is wrong !!!")
                }
        }
        
    }
    
    @IBAction func btnRegisterPressed(_ sender: UIButton) {
        
        if let registerViewController = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(withIdentifier: "Register2ViewController") as? Register2ViewController {
            navigationController?.pushViewController(registerViewController, animated: true)
        }
        
    }
    
    @IBAction func btnSkipPressed(_ sender: UIButton) {
        //if let TableViewController = UIStoryboard(name: "TableViewTest", bundle: nil).instantiateViewController(withIdentifier: "TableViewTest") as? TableViewTestViewController {
            //navigationController?.pushViewController(TableViewController, animated: true)
        if let TBTViewController = UIStoryboard(name: "TableViewTest", bundle: nil).instantiateViewController(withIdentifier: "TableViewTestViewController") as? TableViewTestViewController {
            navigationController?.pushViewController(TBTViewController, animated: true)
        }
    }
    
}

