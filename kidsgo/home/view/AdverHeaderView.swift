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
let iconViewW:Double = 60
let iconViewH:Double = 80

//整个header view (轮播图+分类视图+等级视图)
class AdverHeaderView : UIView {
    @IBOutlet weak var imageAdverScrollview: UIScrollView!
    @IBOutlet weak var categoryScrollview: UIScrollView!
    @IBOutlet weak var levelScrollview: UIScrollView!
    var imageAdver:[String]! {
        didSet {
           setupAdverImage()
        }
    }
    
    var categories:[CategoryModelDetailJSON]! {
        didSet {
            setupCategory()
        }
    }
    
    class func newInstance() -> AdverHeaderView? {
        let nibView = Bundle.main.loadNibNamed("adverheader", owner: nil, options: nil)
        if let view = nibView?.first as? AdverHeaderView {
            return view
        }
        return nil
    }
}

extension AdverHeaderView {
    func setupAdverImage() {
        _ = imageAdverScrollview.subviews.map {
            $0.removeFromSuperview()
        }
        
        if let tmpimageadverview = SDCycleScrollView(frame: CGRect(x: 0, y: 0, width: screenW, height: imageAdverHeight), delegate: self, placeholderImage: nil) {
            tmpimageadverview.showPageControl = true
            tmpimageadverview.imageURLStringsGroup = imageAdver
            imageAdverScrollview.addSubview(tmpimageadverview)
        }
    }
    
    func setupCategory() {
        _ = categoryScrollview.subviews.map{
            $0.removeFromSuperview()
        }
        
        //Setup a icon view
        let categoryCounts:Double = Double(categories.count)
        if categoryCounts == 0 {
            return
        }
        categoryScrollview.contentSize = CGSize(width: iconViewW*categoryCounts, height: iconViewH)
        for index in 0..<categories.count {
            let detail = categories[index]
            if let iconView = CategoryIconView.newInstance() {
                iconView.frame = CGRect(x: Double(index)*iconViewW, y: 0, width: iconViewW, height: iconViewH)
                iconView.model = detail
                categoryScrollview.addSubview(iconView)
            }
        }
    }
}

extension AdverHeaderView : SDCycleScrollViewDelegate {
    
}
