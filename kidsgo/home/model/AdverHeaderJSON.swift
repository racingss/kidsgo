//
//  AdverHeaderJSON.swift
//  kidsgo
//
//  Created by Jeffery Xu on 2018/8/15.
//  Copyright © 2018 Jeffery Xu. All rights reserved.
//

import HandyJSON

class AdverHeaderJSON : HandyJSON {
    var title : String?
    
    var list : [AdverHeaderImagesJSON]?
    
    required init() {}
}
