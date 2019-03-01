//
//  TableViewTestViewController.swift
//  Test
//
//  Created by admin on 2/28/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper


class TableViewTestViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var models: [DataDetails] = []
    
    
    func getInfo(){
        let URL = "https://reqres.in/api/unknown"
        
        AF.request(URL).responseObject { (response: DataResponse<UnknownResponse>) in
            
            let unknownResponse = response.result.value
            
            if let detail = unknownResponse?.detail  {
                self.models = detail
                self.tableView.reloadData()

                
            }
        }
    }


    let cellIdentifier = "TestCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "TestCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        getInfo()
        
    }
}


extension TableViewTestViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! TestCell
        cell.lbID.text = "\(String(describing: models[indexPath.row].iD))"
        cell.lbName.text = "\(String(describing: models[indexPath.row].name))"
        cell.lbColor.text = "\(String(describing: models[indexPath.row].color))"
        cell.lbYear.text = "\(String(describing: models[indexPath.row].year))"
        cell.lbPantone.text = "\(String(describing: models[indexPath.row].pantoneValue))"

        return cell
}
}

