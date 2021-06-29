//
//  SearchVC.swift
//  Recipeapp
//
//  Created by DCS on 24/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    private let stateArray = ["Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttarakhand", "Uttar Pradesh", "West Bengal", "Andaman and Nicobar Islands", "Chandigarh", "Dadra and Nagar Haveli", "Daman and Diu", "Delhi", "Lakshadweep", "Puducherry"]
    
    private let mySearchBar = UISearchBar()
    
    private let myTableView = UITableView()
    
    private var searchData = [String]()
    
    private var arrToUse = [String]()
    
    private var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mySearchBar)
        mySearchBar.delegate = self
        
        view.addSubview(myTableView)
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mySearchBar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 50)
        
        myTableView.frame = CGRect(x: 0, y: mySearchBar.bottom, width: view.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 50)
    }
    
}

extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "StateCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searching ? searchData.count : stateArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if searching {
            arrToUse = searchData
        }  else {
            arrToUse = stateArray
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)
        cell.textLabel?.text = arrToUse[indexPath.row]
        return cell
    }
    
}

extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count == 0 {
            searching = false
        } else {
            searching = true
            searchData = stateArray.filter( { $0.lowercased().hasPrefix(searchText.lowercased()) } )
        }
        
        myTableView.reloadData()
    }
}
