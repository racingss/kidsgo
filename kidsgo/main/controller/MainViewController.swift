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
        img.isUserInteractionEnabled = true
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
        if viewController.hidesBottomBarWhenPushed {
            bgImageOfTabBar.isHidden = true
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        tabBar.isHidden = true
        if !viewController.hidesBottomBarWhenPushed {
            bgImageOfTabBar.isHidden = false
        }
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
        
        viewControllers = tempSubController
    }
    
    func navigationControllerWith(_ vc:UIViewController) -> CommonNavigationController {
        let nav = CommonNavigationController(rootViewController: vc)
        nav.delegate = self
        return nav
    }
}

extension MainViewController {
    @objc func tabBarItemSelected(_ btn: UIButton) {
        btn.isSelected = true
        btn.isUserInteractionEnabled = false
        for sbtn in bgImageOfTabBar.subviews {
            guard let xbtn = sbtn as? UIButton else {
                continue
            }
            if xbtn.tag == btn.tag {
                continue
            }
            
            xbtn.isSelected = false
            xbtn.isUserInteractionEnabled = true
        }
        let btntag = btn.tag - tagplus
        print(btn.tag)
        selectedIndex = btntag
    }
}
