//
//  Util.swift
//  Sqlite Demo
//
//  Created by Adwait Barkale on 23/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import Foundation

class Util: NSObject{
    
    class func getPath(_ fileName: String) -> String{
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = documentDirectory.appendingPathComponent(fileName)
        print("Database Path = \(fileUrl.path)")
        return fileUrl.path
    }
    
    class func copyDatabase(_ fileName: String)
    {
        let dbPath = getPath("Signup.db")
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: dbPath){
            
            let bundle = Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(fileName)
            var error: NSError?
            do{
                try fileManager.copyItem(atPath: file!.path, toPath: dbPath)
            }catch let err as NSError{
                error = err
            }
            
            if error == nil
            {
                print("Error = nil")
            }else{
                print("Error != nil")
            }
            
        }
    }
    
}
