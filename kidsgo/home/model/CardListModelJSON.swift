//
//  CardListModelJSON.swift
//  kidsgo
//
//  Created by Jeffery Xu on 2018/8/29.
//  Copyright © 2018 Jeffery Xu. All rights reserved.
//

import HandyJSON

class CardListModelJSON : HandyJSON {
    var id:Int = 0
    var title:String?
    var list:[CardModelJSON]!
    
    required init() {}
}
