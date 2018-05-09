//
//  ViewController.swift
//  Get Shit Done
//
//  Created by Madison Stanford-Geromel on 5/4/18.
//  Copyright © 2018 Madison Stanford-Geromel. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray : [Item] = []
    //let defaults = UserDefaults.standard
    
     let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist") //first because it's an array. declare it up here so that we can access it in all the methods. global constant.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//       if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
//           itemArray = items
//        }
        
        loadItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        return cell
    }
    
    //MARK = Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
        
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
                
                //self.defaults.set(self.itemArray, forKey: "TodoListArray")  ...don't use defaults except for simple data types like strings, booleans, etc. not custom objects. stuff like volume.
                
                self.saveItems()
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "What do you need to do, stupidass?"
            textField = alertTextField
            
        }
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }


    func saveItems() {
        let encoder = PropertyListEncoder()
    
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadItems() {
        
        do {
            let data = try Data(contentsOf: dataFilePath!)
            let decoder = PropertyListDecoder()
            itemArray = try decoder.decode([Item].self, from: data)
        } catch {
            print("Error decoding item array, \(error)")
        }
    }







}

