//
//  DisplayUserDataViewController.swift
//  Sqlite Demo
//
//  Created by Adwait Barkale on 23/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class DisplayUserDataViewController: UIViewController {

    @IBOutlet weak var lblUserID: UILabel!
    @IBOutlet weak var lblFName: UILabel!
    @IBOutlet weak var lblLName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblMobileNo: UILabel!
    
    var userData: SignupModel?
    var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUserID.text = id
        lblFName.text = userData?.fname
        lblLName.text = userData?.lname
        lblEmail.text = userData?.email
        lblMobileNo.text = userData?.phone
    }

    
    
}
