//
//  AuthManager.swift
//  InstagramClone
//
//  Created by ㅇ오ㅇ on 2020/11/18.
//

import FirebaseAuth

public class AuthManager {
    
    
    static let shared = AuthManager()
    
    // MARK: - Public
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
         - check if username is available
         - check if email is available
         */
        DataBaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                /*
                 - create account
                 - insert account to datebase
                 */
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if error == nil, result != nil {
                        completion(true)
                        return
                    }
                    
                    // Insert into database
                    DataBaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        } else {
                            // Failed to insert to database
                            completion(false)
                            return
                        }
                    }
                }
            } else {
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // email log in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(true)
                    return
                }
                completion(false)
            }
            
        } else {
            // username log in
            
        }
    }
    
    //// Attempt to logout  firebase user
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            print("error")
            completion(false)
            return
        }
    }
}
