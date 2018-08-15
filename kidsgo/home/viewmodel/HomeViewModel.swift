//
//  HomeViewModel.swift
//  kidsgo
//
//  Created by Jeffery Xu on 2018/8/15.
//  Copyright © 2018 Jeffery Xu. All rights reserved.
//

import UIKit
import HandyJSON

class HomeViewModel : NSObject {
    var adverHeader : AdverHeaderJSON!
    var adverimageurlString : [String] = [String]()
    
    typealias AddBlock = () ->Void;
    var updateBlock = AddBlock?{}
}

extension HomeViewModel {
    func refreshDataSource() {
        let jsonString = "{\"title\":\"CardAdverImage\" , \"list\": [{\"id\":0,\"pic\":\"https://images.pexels.com/photos/983297/pexels-photo-983297.jpeg?auto=compress&cs=tinysrgb&h=650&w=940\"},{\"id\":1,\"pic\":\"https://images.pexels.com/photos/1315891/pexels-photo-1315891.jpeg?auto=compress&cs=tinysrgb&h=650&w=940\"}]}"
        if let jsonobj = AdverHeaderJSON.deserialize(from: jsonString) {
            self.adverHeader = jsonobj
            if let images = jsonobj.list {
                for image in images {
                    adverimageurlString.append(image.pic!)
                }
            }
        } else {
            self.adverHeader = nil
        }
        self.updateBlock!()
    }
}
