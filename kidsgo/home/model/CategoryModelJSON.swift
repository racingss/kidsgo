//
//  CategoryModelJSON.swift
//  kidsgo
//
//  Created by Jeffery Xu on 2018/8/22.
//  Copyright © 2018 Jeffery Xu. All rights reserved.
//

import HandyJSON

class CategoryModelJSON : HandyJSON {
    var id : Int = 0
    var ret : Int = 0
    var list : [CategoryModelDetailJSON]?
    required init() {}
}
