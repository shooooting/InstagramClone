//
//  DatabaseManager.swift
//  InstagramClone
//
//  Created by ㅇ오ㅇ on 2020/11/18.
//

import FirebaseDatabase

public class DataBaseManager {
    
    static let shared = DataBaseManager()
    
    private let database = Database.database().reference()
    
    // MARK: - Public
    
    
    // Check if username and email is available
    // - patameters
    // - email: String representing email
    // - username : String representing username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    // Inserts new data to database
    // - Parameters
    //   - email: String representing email
    //   - username : String representing username
    //   - completion : Async callback for result if database entry secceded
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        let key = email.safeDatabaseKey()
        database.child(key).setValue(["username": username]) { error, _ in
            if error == nil {
                // success
                completion(true)
                return
            } else {
                // failed
                completion(false)
                return
            }
        }
    }
    
    public func registerNewUser(username: String, email: String, password: String) {
        
    }
    
    public func loginUser(username: String, email: String, password: String) {
        
    }
}
