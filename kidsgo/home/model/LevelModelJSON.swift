//
//  LevelModelJSON.swift
//  kidsgo
//
//  Created by Jeffery Xu on 2018/8/27.
//  Copyright © 2018 Jeffery Xu. All rights reserved.
//

import HandyJSON

class LevelModelJSON : HandyJSON {
    var id : Int = 0
    var title : String?
    var list : [String]!
    
    required init() {}
}
