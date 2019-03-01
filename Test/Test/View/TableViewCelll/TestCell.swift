//
//  TestCell.swift
//  Test
//
//  Created by admin on 2/28/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {

    @IBOutlet weak var lbID: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbColor: UILabel!
    @IBOutlet weak var lbPantone: UILabel!
    
    func populateData(data: String) {
        lbID.text = data
        
    }

}
