//
//  ListaDePessoasTableViewController.swift
//  Desafio-lds
//
//  Created by Jaisson Monteiro on 18/08/19.
//  Copyright © 2019 Jaisson Monteiro. All rights reserved.
//

import UIKit

class PeopleListTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var peopleList = PeopleList()
    
    //MARK: - ViewLifeCycle
    
    override func viewDidLoad() {
        tableView.refreshControl = createRefreshControl()
        tableView.refreshControl?.beginRefreshing()
        updateTable()
    }
    
    //MARK: - Methods
    
    func createRefreshControl() -> UIRefreshControl {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(updateTable), for: .valueChanged)
        return refresh
    }
    
    @objc func updateTable() {
        PeopleList.fetchPeople(success: { (list) in
            self.peopleList = list
            DispatchQueue.main.async {
                self.tableView.refreshControl?.endRefreshing()
                self.tableView.reloadData()
            }
        }) { (error) in
            DispatchQueue.main.async {
                self.tableView.refreshControl?.endRefreshing()
                Alert.showErrorAlert(message: error, in: self, completionHundler: nil)
            }
        }
    }
    
    //MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = peopleList.results[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleListCell", for: indexPath) as! PeopleListCell
        cell.updateCell(with: person)
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: peopleList.results[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let person = sender as? Person
            let destination = segue.destination as! DetailPersonTableViewController
            destination.person = person
        }
        
    }
    
}
