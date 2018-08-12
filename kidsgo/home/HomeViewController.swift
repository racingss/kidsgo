//
//  HomeViewController.swift
//  kidsgo
//
//  Created by XuYe on 2018/8/11.
//  Copyright © 2018年 Jeffery Xu. All rights reserved.
//

import UIKit

class HomeViewController : CommonViewController {
    
    //搜索框
    lazy var subSearchBar : UIView = {[unowned self] in
        let view = UISearchBar()
        view.frame = CGRect(x: 0, y: 0, width: screenW, height: 44)
        let textFieldInSearchBar = view.value(forKey: "searchField") as? UITextField
        textFieldInSearchBar?.font = UIFont.systemFont(ofSize: 14)
        view.placeholder = "卡片点点"
        view.backgroundColor = UIColor.blue
        view.keyboardType = UIKeyboardType.default
        view.showsCancelButton = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "卡片点点"
        view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        view.addSubview(subSearchBar)
    }
}

extension HomeViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("selected scope")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("text did change")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searching")
    }
}
