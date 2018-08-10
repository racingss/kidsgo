//
//  ViewController.swift
//  kidsgo
//
//  Created by Jeffery Xu on 06/08/2018.
//  Copyright © 2018 Jeffery Xu. All rights reserved.
//

import UIKit

//tab button tag累积值
let tagplus:NSInteger = 100
//tab bar 高度
let tabbarH:CGFloat = 49

class MainViewController: UITabBarController {

    //tab bar 白色背景图片打底
    lazy var bgImageOfTabBar:UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 0, y: screenH - tabbarH, width: screenW, height: tabbarH)
        img.image = UIImage(named: "bgimg")
        img.isUserInteractionEnabled = false
        return img
    }()
    
    //tab button 正常图片
    lazy var normalIconArray:[UIImage] = {
        var tmpIconArray:[UIImage] = [UIImage]()
        tmpIconArray.append(UIImage(named: "homeicon")!)
        tmpIconArray.append(UIImage(named: "subicon")!)
        tmpIconArray.append(UIImage(named: "parenticon")!)
        return tmpIconArray
    }()
    
    //tab button 选中图片
    lazy var selectedIconArray:[UIImage] = {
        var tmpIconArray:[UIImage] = [UIImage]()
        tmpIconArray.append(UIImage(named: "selhomeicon")!)
        tmpIconArray.append(UIImage(named: "selsubicon")!)
        tmpIconArray.append(UIImage(named: "selparenticon")!)
        return tmpIconArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCustomTabbar()
        // Do any additional setup after loading the view, typically from a nib.
        createSubControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        <#code#>
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        <#code#>
    }
}

extension MainViewController {
    func createCustomTabbar() {
        tabBar.isHidden = true
        view.addSubview(bgImageOfTabBar)
        
        let buttonW:CGFloat = screenW / 3.0
        
        for index in 0..<3 {
            let btn = UIButton(type: .custom)
            btn.tag = tagplus + index
            btn.frame = CGRect(x: buttonW * CGFloat(index), y: 0, width: buttonW, height: tabbarH)
            btn.adjustsImageWhenHighlighted = false
            if index == 0 {
                btn.backgroundColor = UIColor.brown
            } else if index == 1 {
                btn.backgroundColor = UIColor.blue
            } else {
                btn.backgroundColor = UIColor.cyan
            }
            btn.setImage(normalIconArray[index], for: .normal)
            btn.setImage(selectedIconArray[index], for: .selected)
            btn.addTarget(self, action: #selector(tabBarItemSelected(_ :)), for: .touchUpInside)
            
            bgImageOfTabBar.addSubview(btn)
        }
    }
    
    func createSubControllers() {
        tabBar.isHidden = true
        
        var tempSubController:[CommonNavigationController] = [CommonNavigationController]()
        tempSubController.append(navigationControllerWith(HomeViewController()))
        tempSubController.append(navigationControllerWith(SubViewController()))
        tempSubController.append(navigationControllerWith(ParentViewController()))
        
        return tempSubController
    }
    
    func navigationControllerWith(_ vc:UIViewController) -> CommonNavigationController {
        let nav = CommonNavigationController(rootViewController: vc)
        nav.delegate = self
        return nav
    }
    
    @objc func tabBarItemSelected(_ btn: UIButton) {
       btn.isSelected = true
    }
}
