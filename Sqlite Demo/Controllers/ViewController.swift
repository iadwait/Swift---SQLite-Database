//
//  ViewController.swift
//  Sqlite Demo
//
//  Created by Adwait Barkale on 23/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFName: UITextField!
    @IBOutlet weak var txtLName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSaveTapped(_ sender: UIButton) {
        
        let modelInfo = SignupModel(fname: txtFName.text!, lname: txtLName.text!, email: txtEmail.text!, phone: txtPhone.text!)
        let isSave = DatabaseManager.getInstance().saveData(modelInfo)
        print(isSave)
        
    }
    
}

