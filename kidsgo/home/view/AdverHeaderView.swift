//
//  AdverHeaderView.swift
//  kidsgo
//
//  Created by XuYe on 2018/8/12.
//  Copyright © 2018年 Jeffery Xu. All rights reserved.
//

import UIKit
import SDCycleScrollView

// 广告图片轮播视图高度
let imageAdverHeight:CGFloat = 150

class AdverHeaderView : UIView {
    @IBOutlet weak var imageAdverScrollview: UIScrollView!

    @IBOutlet weak var adverScrollview: UIScrollView!

    class func newInstance() -> AdverHeaderView? {
        let nibView = Bundle.main.loadNibNamed("adverheader", owner: nil, options: nil)
        if let view = nibView?.first as? AdverHeaderView {
            return view
        }
        return nil
    }
}
