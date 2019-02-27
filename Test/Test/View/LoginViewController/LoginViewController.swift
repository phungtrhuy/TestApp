//
//  LoginViewController.swift
//  Test
//
//  Created by admin on 2/26/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Alamofire


class LoginViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLoginPressed(_ sender: UIButton) {
        guard let email = tfEmail.text, !email.isEmpty else { return }
        guard let password = tfPassword.text, !password.isEmpty else { return }
        let urlLis = "https://reqres.in/api/login"
        
        let parameter: Parameters = [
            "email": email,
            "password": password
        ]
        
        AF
            .request(urlLis, method: .post, parameters: parameter, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                     print("isi: \(data)")
                    print("Successfully !!!")
                    self.showAlert(title: "Message", alertMessage: "Successfully")
                    
                case .failure(_):
                        print("Something is wrong !!!")
                }
                }
    }
    
    
    @IBAction func btnRegisterPressed(_ sender: UIButton) {
        let vc = RegisterViewController(); self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
