//
//  SettingViewController.swift
//  InstagramClone
//
//  Created by ㅇ오ㅇ on 2020/11/18.
//

import UIKit

struct SettingCellModel {
    let title: String
    let handler: (() -> Void)
}

//// View Controller to user setting
final class SettingViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var data = [[SettingCellModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureModels()
        setUI()
        setTableview()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.frame
    }
    
    fileprivate func setUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func setTableview() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureModels() {
        let section = [
            SettingCellModel(title: "Log Out") { [weak self] in
                self?.didTapLogOut()
            }
        ]
        data.append(section)
    }
    
    private func didTapLogOut() {
        let actionSheet = UIAlertController(title: "Log Out",
                                            message: "Are you sure you want to log out?",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
                AuthManager.shared.logOut { success in
                    DispatchQueue.main.async {
                        if success {
                            let loginVC = LoginViewController()
                            loginVC.modalPresentationStyle = .fullScreen
                            self.present(loginVC, animated: true) {
                                self.navigationController?.popViewController(animated: false)
                                self.tabBarController?.selectedIndex = 0
                            }
                        } else {
                            fatalError("Could not log out user")
                        }
                    }
                }
        }))
        
        actionSheet.popoverPresentationController?.sourceView = self.view
        actionSheet.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX,
                                                                       y: self.view.frame.midY / 4,
                                                                       width: 0,
                                                                       height: 0)
        
        present(actionSheet, animated: true)
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handler()
    }
}
