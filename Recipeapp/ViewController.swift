//
//  ViewController.swift
//  Recipeapp
//
//  Created by DCS on 25/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Welcome In Dessert Diary ", for: .normal)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 6
        return button
    }()
    
    
    
    private let myPageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        //pageControl.backgroundColor = .white
        pageControl.addTarget(self, action: #selector(handlePageControl), for: .valueChanged)
        return pageControl
    }()
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(myButton)
        view.addSubview(myPageControl)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "oc.jpg")!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        myButton.frame = CGRect(x: 40, y:view.height/2+200, width: view.width - 80, height: 40)
        
        myPageControl.frame = CGRect(x: 20, y:view.height/2+230, width: view.width - 40, height: 40)
        
        
        
    }
    
    @objc func handleButtonClick() {
        print("Clicked!")
        
        let vc = Reg()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func handlePageControl() {
        print(myPageControl.currentPage)
    }
    
    
  
}



