//
//  HomeViewController.swift
//  kidsgo
//
//  Created by XuYe on 2018/8/11.
//  Copyright © 2018年 Jeffery Xu. All rights reserved.
//

import UIKit

class HomeViewController : CommonViewController {
    
    //tableview header整个视图
    let headerFrame = CGRect(x: 0, y: 0, width: screenW, height: 294)
    //搜索框
    lazy var subSearchBar : UIView = {[unowned self] in
        let view = UISearchBar()
        view.frame = CGRect(x: 0, y: 0, width: screenW, height: 44)
        let textFieldInSearchBar = view.value(forKey: "searchField") as? UITextField
        textFieldInSearchBar?.font = UIFont.systemFont(ofSize: 14)
        view.placeholder = APP_PLACEHOLDER
        view.backgroundColor = UIColor.blue
        view.keyboardType = UIKeyboardType.default
        view.showsCancelButton = false
        view.delegate = self
        return view
    }()
    
    //轮播图视图 + 分类视图 + 等级视图
    let adverHeaderFrame = CGRect(x: 0, y: 44, width: screenW, height: 250)
    lazy var adverHeaderView:AdverHeaderView = {
        let adverheader = AdverHeaderView.newInstance()
        adverheader?.frame = adverHeaderFrame
        adverheader?.layoutIfNeeded()
        return adverheader!
    }()
    
    //整个视图是tableview
    lazy var homeview: UITableView = {
        [unowned self] in
        let tableview = UITableView(frame: self.view.frame, style: .plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.tableHeaderView = UIView(frame: self.headerFrame)
        tableview.tableHeaderView?.addSubview(subSearchBar)
        tableview.tableHeaderView?.addSubview(self.adverHeaderView)
        
        self.view.addSubview(tableview)
        return tableview
    }()
    
    //viewModel
    lazy var viewModel:HomeViewModel = {
        return HomeViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = APP_PLACEHOLDER
        view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        self.homeview.reloadData()
        viewModel.updateBlock = {
            [unowned self] in
            self.adverHeaderView.imageAdver = self.viewModel.adverimageurlString
            self.adverHeaderView.categories = self.viewModel.categories
        }
        viewModel.refreshDataSource()
    }
}

//负责控制搜索框
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

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = CGRect(x: 0, y: 144, width: screenW, height: 250)
        return UITableViewCell(frame: cell1)
    }
    
    
}
