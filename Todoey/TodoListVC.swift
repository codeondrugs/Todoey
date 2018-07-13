//
//  ViewController.swift
//  Todoey
//
//  Created by EasyRider on 13.07.2018.
//  Copyright © 2018 Artem Yelizarov. All rights reserved.
//

import UIKit

class TodoListVC: UITableViewController {

    let itemArray = ["Find Mike", "Buy Eggos", "Destroy Deamgorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    //MARK: - TableView Datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    //MARK: - Tableview delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == .checkmark {
            
            cell?.accessoryType = .none
            
        } else {
            
            cell?.accessoryType = .checkmark
            
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
}

