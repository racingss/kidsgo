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
    var categories : [CategoryModelDetailJSON] = [CategoryModelDetailJSON]()
    var levels : [String] = [String]()
    
    typealias AddBlock = () ->Void;
    var updateBlock = AddBlock?{}
}

//view model data source
extension HomeViewModel {
    //整个home页的数据加载
    //TODO : 替换成json api
    func refreshDataSource() {
        //轮播图json
        let adverheaderjsonStr = "{\"title\":\"CardAdverImage\" , \"list\": [{\"id\":0,\"pic\":\"https://images.pexels.com/photos/983297/pexels-photo-983297.jpeg?auto=compress&cs=tinysrgb&h=650&w=940\"},{\"id\":1,\"pic\":\"https://images.pexels.com/photos/1315891/pexels-photo-1315891.jpeg?auto=compress&cs=tinysrgb&h=650&w=940\"}]}"
        //分类json
        let categoryjsonStr = "{\"id\":1, \"title\":\"category\" ,\"list\":[{\"id\":0, \"pic\":\"http://www.suyufuwu.com/diandian/frame/h_1.png\", \"title\":\"生活\"},{\"id\":1, \"pic\":\"http://www.suyufuwu.com/diandian/frame/h_2.png\", \"title\":\"科学\"},{\"id\":2, \"pic\":\"http://www.suyufuwu.com/diandian/frame/h_3.png\", \"title\":\"自然\"},{\"id\":3, \"pic\":\"http://www.suyufuwu.com/diandian/frame/h_4.png\", \"title\":\"艺术\"},{\"id\":4, \"pic\":\"http://www.suyufuwu.com/diandian/frame/h_5.png\", \"title\":\"社会\"}]}"
        //等级json
        let leveljsonStr = "{\"id\":2, \"title\": \"level\" , \"list\":[\"Level 1\", \"Level 2\", \"Level 3\"]}"
        if let jsonobj = AdverHeaderJSON.deserialize(from: adverheaderjsonStr) {
            self.adverHeader = jsonobj
            if let images = jsonobj.list {
                for image in images {
                    adverimageurlString.append(image.pic!)
                }
            }
        } else {
            self.adverHeader = nil
        }
        
        if let jsonobj = CategoryModelJSON.deserialize(from: categoryjsonStr) {
            self.categories = jsonobj.list!
        } else {
            NSLog("category is empty")
        }
        
        if let jsonobj = LevelModelJSON.deserialize(from: leveljsonStr) {
            if let tmplevels = jsonobj.list {
                for tmplevel in tmplevels {
                    levels.append(tmplevel)
                }
            }
        } else {
            NSLog("level is empty")
        }
        self.updateBlock!()
    }
}
