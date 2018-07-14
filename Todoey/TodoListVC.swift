//
//  ViewController.swift
//  Todoey
//
//  Created by EasyRider on 13.07.2018.
//  Copyright © 2018 Artem Yelizarov. All rights reserved.
//

import UIKit

class TodoListVC: UITableViewController {

    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Deamgorgon"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        if let items = defaults.array(forKey: "items") as? [String] {
            
            itemArray = items
            
        }
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        print("didMove")
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
    
    //MARK: - Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var alertTextfield = UITextField()
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (textfield) in
            
            textfield.placeholder = "Enter you item here"
            alertTextfield = textfield
            
        })
        
        let action = UIAlertAction(title: "Add Item", style: .default, handler: {action in
            
            if let newItemText = alert.textFields?.first?.text {
                
                self.itemArray.append(newItemText)
                self.defaults.set(self.itemArray, forKey: "items")
                self.tableView.reloadData()
                
            }
            
        })
        
        alert.addAction(action)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: {(alert) in
            
            
            
            })
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
}

