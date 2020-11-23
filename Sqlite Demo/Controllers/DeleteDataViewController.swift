//
//  DeleteDataViewController.swift
//  Sqlite Demo
//
//  Created by Adwait Barkale on 23/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class DeleteDataViewController: UIViewController {
    
    @IBOutlet weak var txtID: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnDeleteTapped(_ sender: UIButton) {
       let isDeleted = DatabaseManager.getInstance().deleteData(txtID.text!)
        if isDeleted{
            print("Deleted Successfully")
        }else{
            print("Error Deleting Data")
        }
    }
}
