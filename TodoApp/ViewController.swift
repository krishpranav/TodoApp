//
//  ViewController.swift
//  TodoApp
//
//  Created by Apple on 03/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    private let table: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todo List App"
        view.addSubview(table)
        table.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapAdd))
    }
    
    @objc private func didTapAdd() {
        /* new item */
        let alert = UIAlertController(title: "New Item", message: "Enter new todo work!!", preferredStyle: .alert)
        
        /* text field */
        alert.addTextField {
            field in field.placeholder = "Enter item..."
        }
        
        /* cancel */
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: nil))
        
        /* done */
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (_) in
            
        }))
        
        present(alert, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
}

