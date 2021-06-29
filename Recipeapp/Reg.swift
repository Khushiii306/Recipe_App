//
//  Reg.swift
//  Recipeapp
//
//  Created by DCS on 30/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Reg: UIViewController {
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "You Like Classic Dessert!"
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        label.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        label.textColor = .white
        return label
    }()
    
    
    private let myTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please Enter Dessert Name"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return textField
    }()
    
    
    
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Click Here", for: .normal)
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
        
        view.addSubview(myLabel)
        view.addSubview(myTextField)
        
        view.addSubview(myButton)
        view.addSubview(myPageControl)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "cake4.jpg")!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myLabel.frame = CGRect(x: 20, y: view.height/2-10, width :view.width - 40, height: 40)
        myTextField.frame = CGRect(x: 20, y:view.height/2+50, width: view.width - 40, height: 60)
        myButton.frame = CGRect(x: 20, y:view.height/2+170, width: view.width - 40, height: 40)
        myPageControl.frame = CGRect(x: 20, y:view.height/2+230, width: view.width - 40, height: 40)
        
        
        
    }
    
    @objc func handleButtonClick() {
        print("Clicked!")
        
        let vc = menuVC()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func handlePageControl() {
        print(myPageControl.currentPage)
    }
    
    
}

