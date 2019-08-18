//
//  HomeController.swift
//  desafio-swift
//
//  Created by Arthur Rocha on 17/08/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

protocol HomeView: AnyObject {
    func startLoading()
    func stopLoading()
    func reloadData()
    func showMessage(
        icon: Icon,
        text: String,
        sizeIcon: Int,
        backgroundColor: UIColor,
        isButton: Bool,
        titleButton: String)
    func hideMessage()
}

class HomeController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
    }
    
    var presenter: HomePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.present()
        title = "People"
    }
}

extension HomeController: HomeView {
    func startLoading() {
        view.displayLoadingIndicator(text: "Loading...", backgroundColor: .white)
    }
    
    func stopLoading() {
        view.dismissLoadingIndicator()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func showMessage(icon: Icon, text: String, sizeIcon: Int, backgroundColor: UIColor, isButton: Bool, titleButton: String) {
        view.displayMessageView(
            icon: icon,
            text: text,
            sizeIcon: sizeIcon,
            backgroundColor: backgroundColor,
            isButton: isButton,
            titleButton: titleButton,
            completion: nil)
    }
    
    func hideMessage() {
        view.dismissMessageView()
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = presenter.people[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
