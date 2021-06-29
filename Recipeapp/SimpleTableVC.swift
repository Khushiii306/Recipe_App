//
//  SimpleTableVC.swift
//  Recipeapp
//
//  Created by DCS on 24/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class SimpleTableVC: UIViewController {
    
    private let myTableView = UITableView()
    
    private var cityArray = ["", "Moscow", "Rio", "Tokyo", "Denver", "Helsinki", "Oslo", "Nairobi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Simple Table View"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(shuffleTableViewData))
        
        view.addSubview(myTableView)
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myTableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}

extension SimpleTableVC: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CityCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        cell.textLabel?.text = cityArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(cityArray[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myTableView.beginUpdates()
            cityArray.remove(at: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: .fade)
            myTableView.endUpdates()
        }
    }
    
    @objc private func shuffleTableViewData() {
        cityArray.shuffle()
        myTableView.reloadData()
    }
}
