//
//  CategoryIconView.swift
//  kidsgo
//
//  Created by Jeffery Xu on 2018/8/22.
//  Copyright © 2018 Jeffery Xu. All rights reserved.
//

import UIKit
import SDWebImage

class CategoryIconView : UIView {
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var model : CategoryModelDetailJSON! {
        didSet {
            setupDetailModel()
        }
    }
    class func newInstance() -> CategoryIconView? {
        let nibView = Bundle.main.loadNibNamed("categoryIcon", owner: nil, options: nil)
        if let view = nibView?.first as? CategoryIconView {
            return view
        }
        return nil
    }
}

extension CategoryIconView {
    func setupDetailModel() {
        guard let title = model.title else {return}
        label.text = title
        guard let iconUrl = model.pic else {return}
        iconImage.sd_setImage(with: NSURL(string: iconUrl)! as URL, completed: nil)
    }
}
