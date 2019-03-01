//
//  Test.swift
//  Test
//
//  Created by admin on 2/28/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import ObjectMapper

class UnknownResponse: Mappable {
    public var detail: [DataDetails]?
    public var total: Int?
    public var page: Int?
    public var total_pages: Int?
    public var per_page: Int?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        total_pages <- map["total_pages"]
        page <- map["page"]
        per_page <- map["per_page"]
        detail <- map["data"]
    }
}

class DataDetails: Mappable {
    var iD: Int?
    var name: String?
    var year: Int?
    var color: String?
    var pantoneValue: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        iD <- map["id"]
        color <- map["color"]
        name <- map["name"]
        pantoneValue <- map["pantone_value"]
        year <- map["year"]
    }
}


