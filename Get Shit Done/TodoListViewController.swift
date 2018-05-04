//
//  ViewController.swift
//  Get Shit Done
//
//  Created by Madison Stanford-Geromel on 5/4/18.
//  Copyright © 2018 Madison Stanford-Geromel. All rights reserved.
//

import UIKit
import Foundation

class TodoListViewController: UITableViewController {

    var itemArray : [Item] = (([] as NSMutableArray) as! [Item])
    let defaults = UserDefaults.standard
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "macramatica"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "pimsleur"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "udemy"
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        return cell
    }
    
    //MARK = Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        

        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.deselectRow(at: indexPath, animated: true)
//
    }
    
    
    //MARK = Add New Items
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if textField.text != "" {
                print(textField.text!)
                let newItem = Item()
                newItem.title = textField.text!
                self.itemArray.append(newItem)
                self.defaults.set(self.itemArray as NSArray, forKey: "TodoListArray")
                
//                self.defaults.set([], forKey: "TodoListArray")
                //self.tableView.reloadData()
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "What do you need to do, stupidass?"
            textField = alertTextField
            
        }
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)



}









}

