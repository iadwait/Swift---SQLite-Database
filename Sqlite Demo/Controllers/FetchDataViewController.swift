//
//  FetchDataViewController.swift
//  Sqlite Demo
//
//  Created by Adwait Barkale on 23/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class FetchDataViewController: UIViewController {

    
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnFetchDataTapped(_ sender: UIButton) {
        //DatabaseManager.getInstance().fetchData(condition: "") //Fetch All users Data
         let userDetailVC = storyboard?.instantiateViewController(withIdentifier: "DisplayUserDataViewController") as! DisplayUserDataViewController
        
        if let userData = DatabaseManager.getInstance().fetchData(condition: "id = \(txtID.text!)"){
            
            userDetailVC.id = txtID.text! // Pass ID
            userDetailVC.userData = userData // Pass Data
            
        }
        
       
        self.addChild(userDetailVC)
        userDetailVC.view.frame = .init(x: 0, y: 0, width: containerView.frame.size.width, height: containerView.frame.size.height)
        containerView.addSubview(userDetailVC.view)
        userDetailVC.didMove(toParent: self)
    }
    

}
