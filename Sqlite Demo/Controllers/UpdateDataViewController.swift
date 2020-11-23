//
//  UpdateDataViewController.swift
//  Sqlite Demo
//
//  Created by Adwait Barkale on 23/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class UpdateDataViewController: UIViewController {
    
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func btnUpdateTapped(_ sender: UIButton) {
        var newName = ""
        var newEmail = ""
        var newMobile = ""
        
        var subQuery = ""
        
        if txtName.text != ""
        {
            newName = txtName.text!
            subQuery = "fname = '\(newName)' "
        }
        
        if txtEmail.text != ""
        {
            newEmail = txtEmail.text!
            if subQuery == ""{
                    subQuery.append("email = '\(newEmail)' ")
            }else{
                subQuery.append(",email = '\(newEmail)' ")
            }
            
        }
        
        if txtMobile.text != ""
        {
            newMobile = txtMobile.text!
             if subQuery == ""{
            subQuery.append("phone = \(newMobile) ")
             }else{
                 subQuery.append(",phone = '\(newMobile)' ")
            }
        }
        
        if subQuery != ""
        {
            let isUpdated = DatabaseManager.getInstance().updateData(id: txtID.text!, subQuery: subQuery)
            if isUpdated{
                print("Updated Successfully")
            }else{
                print("Syntax Error in Database Manager File")
            }
        }
        
    }
    
}
