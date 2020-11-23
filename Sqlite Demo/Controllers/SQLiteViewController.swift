//
//  SQLiteViewController.swift
//  Sqlite Demo
//
//  Created by Adwait Barkale on 23/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class SQLiteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func btnInsertDataTapped(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func btnDeleteDataTapped(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "DeleteDataViewController") as! DeleteDataViewController
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    @IBAction func btnUpdateDataTapped(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "UpdateDataViewController") as! UpdateDataViewController
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func btnFetchDataTapped(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "FetchDataViewController") as! FetchDataViewController
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
