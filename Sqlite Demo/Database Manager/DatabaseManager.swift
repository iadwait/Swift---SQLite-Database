//
//  DatabaseManager.swift
//  Sqlite Demo
//
//  Created by Adwait Barkale on 23/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import Foundation

var sharedInstance = DatabaseManager()
class DatabaseManager: NSObject{
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> DatabaseManager{
        if sharedInstance.database == nil{
            sharedInstance.database = FMDatabase(path: Util.getPath("Signup.db"))
        }
         
        return sharedInstance
    }
    
    func saveData(_ modelInfo: SignupModel) -> Bool
    {
        sharedInstance.database?.open()
        let isSave = sharedInstance.database?.executeUpdate("INSERT INTO Signup(fname,lname,email,phone) VALUES (?,?,?,?)", withArgumentsIn: [modelInfo.fname,modelInfo.lname,modelInfo.email,modelInfo.phone])
        sharedInstance.database?.close()
        return isSave!
    }
    
    func deleteData(_ id: String) -> Bool
    {
        sharedInstance.database?.open()
        //Note - isDeleted is true only if syntax is correct no matter id present or not
//        let isPresent = sharedInstance.database?.executeStatements("SELECT * FROM Signup WHERE id = \(id)")
//        print("isPresent = \(isPresent)")
        let isDeleted = sharedInstance.database?.executeStatements("DELETE FROM Signup WHERE id = \(id)")
        sharedInstance.database?.close()
        return isDeleted!
    }
    
    func updateData(id: String,subQuery: String) -> Bool
    {
        sharedInstance.database?.open()
        let isUpdated = sharedInstance.database?.executeStatements("UPDATE Signup SET \(subQuery) WHERE id = \(id)")
        sharedInstance.database?.close()
        return isUpdated!
    }
    
//    func fetchData(id: String)
//    {
//        sharedInstance.database?.open()
//        do{
//            let results = try sharedInstance.database?.executeQuery("SELECT * FROM Signup WHERE id = \(id)", values: nil)
//            print("Query = SELECT * FROM Signup WHERE id = \(id)")
//            let fname = results?.string(forColumn: "fname")
//            print("First Name = \(fname)")
//        }catch let err{
//            print("Error Fetching Data :- \(err.localizedDescription)")
//        }
//        sharedInstance.database?.close()
//    }
    
    func fetchData(condition: String?) -> SignupModel?
    {
        let userDB = FMDatabase(path: Util.getPath("Signup.db") as String)
        var query = "SELECT * FROM Signup"
        var userData: SignupModel
        
        if condition!.count > 0 {
            query.append(" WHERE \(condition!)")
        }
        
        if (userDB.open()) {
            do{
                let results:FMResultSet? = try userDB.executeQuery(query, values: nil)
                while results?.next() == true {
                    let first_name = results?.string(forColumn: "fname")
                    let last_name = results?.string(forColumn: "lname")
                    let email = results?.string(forColumn: "email")
                    let mobile = results?.string(forColumn: "phone")
                     
                    print("User Details")
                    print("First Name - \(first_name ?? "")")
                    print("Last Name - \(last_name ?? "")")
                    print("Email - \(email ?? "")")
                    print("Mobile No. - \(mobile ?? "")")
                     // Get All Your Data Here
                    userData = SignupModel(fname: first_name!, lname: last_name!, email: email!, phone: mobile!)
                    userDB.close()
                    return userData
                }
            }catch{
                
            }
            userDB.close()
        } else {
            print("Error: \(userDB.lastErrorMessage())")
        }
        
        return nil
    }
    
}
