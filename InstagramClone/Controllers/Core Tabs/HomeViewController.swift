//
//  ViewController.swift
//  InstagramClone
//
//  Created by ㅇ오ㅇ on 2020/11/18.
//
import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAuthenticated()
    }
    
    fileprivate func handleNotAuthenticated() {
        // check auth status
        if Auth.auth().currentUser == nil {
            // show log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
    
    fileprivate func setUI() {
        
    }
    
    fileprivate func setConstraints() {
        
    }


}

