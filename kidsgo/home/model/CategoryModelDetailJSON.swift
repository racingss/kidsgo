//
//  CategoryModelDetailJSON.swift
//  kidsgo
//
//  Created by Jeffery Xu on 2018/8/22.
//  Copyright © 2018 Jeffery Xu. All rights reserved.
//

import HandyJSON

class CategoryModelDetailJSON : HandyJSON {
    var id : Int = 0
    var pic : String?
    var title : String?
    
    required init() {}
}
