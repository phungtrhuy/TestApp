//
//  RegisterViewController.swift
//  Test
//
//  Created by admin on 2/27/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var tfFullName: UITextField!
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnDonePressed(_ sender: UIButton) {
        guard let fullName = tfFullName.text, !fullName.isEmpty else { return }
        guard let userName = tfUserName.text, !userName.isEmpty else { return }
        guard let password = tfPassword.text, !password.isEmpty else { return }
        let urlLis = "https://reqres.in/api/register"
        
        let parameter: Parameters = [
            "fullName": fullName,
            "userName": userName,
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
    @IBAction func btnClosePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


