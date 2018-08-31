//
//  CardModelJSON.swift
//  kidsgo
//
//  Created by Jeffery Xu on 2018/8/29.
//  Copyright © 2018 Jeffery Xu. All rights reserved.
//

import HandyJSON

class CardModelJSON : HandyJSON {
    var id:Int = 0
    var title:String?
    var pic:String!
    
    required init() {}
}
