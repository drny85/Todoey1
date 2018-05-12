//
//  ViewController.swift
//  Todoey
//
//  Created by Robert Melendez on 5/12/18.
//  Copyright © 2018 Robert Melendez. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    var defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let item1 = Item()
        item1.title = "Robert"
        itemArray.append(item1)
        
        let item2 = Item()
        item2.title = "Maria"
        itemArray.append(item2)
        
        let item3 = Item()
        item3.title = "Jose"
        itemArray.append(item3)
        
        
    }

   //MARK - Table View Datasource Methods
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark: .none
        
        
        return cell
    }
    
    //MARK - TAbleView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // add check mark when selected
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // add animation when selecting a row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    

    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // when user click the add item button
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            //reload the data
            self.tableView.reloadData()
            
        }
            
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Type new item"
            textField = alertTextField
            
            
        }
            
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
}

