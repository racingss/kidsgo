//
//  CommonNavigationController.swift
//  kidsgo
//
//  Created by Jeffery Xu on 2018/8/8.
//  Copyright © 2018 Jeffery Xu. All rights reserved.
//

import UIKit

class CommonNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        print(navigationBar.alignmentRectInsets.bottom)
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-1000, 0), for: .default)
    }
}

