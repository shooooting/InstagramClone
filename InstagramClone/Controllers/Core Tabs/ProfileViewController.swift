//
//  ProfileViewController.swift
//  InstagramClone
//
//  Created by ㅇ오ㅇ on 2020/11/18.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        configureNavigationBar()
    }
    
    private func setUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSettingsButton))
    }
    
    @objc
    private func didTapSettingsButton() {
        let vc = SettingViewController()
        vc.title = "Settings"
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
