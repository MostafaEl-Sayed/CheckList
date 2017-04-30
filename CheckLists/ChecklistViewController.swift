//
//  ViewController.swift
//  CheckLists
//
//  Created by Mostafa El_sayed on 4/17/17.
//  Copyright © 2017 Mostafa El_sayed. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController,AddItemViewControllerDelegate{

    
    var indexOfSelectedChecklist: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // load saved lists from file.
        //RequestManager.defaultManager.loadChecklists()
    }

        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            
            
            return dataModel.lists[indexOfSelectedChecklist!].items.count
        }
    
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cellTest = self.tableView.dequeueReusableCell(withIdentifier: "CheckListsItem", for: indexPath) as! CheckListTableViewCell
           let itemName = dataModel.lists[indexOfSelectedChecklist!]
            
           cellTest.listLabel.text! = "\(itemName.items[indexPath.row].text)"
           cellTest.checkMarkLabel.text = itemName.items[indexPath.row].checked ? " ✔︎ " : "   "
            
            return cellTest
            
        }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let cell = tableView.cellForRow(at: indexPath)  {
            
            let checkListItem = dataModel.lists[indexOfSelectedChecklist!].items[indexPath.row]
            checkListItem.checked = !checkListItem.checked
            configureCheckmark(for: cell as! CheckListTableViewCell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func configureCheckmark(for cell:CheckListTableViewCell,at indexPath : IndexPath)   {
        //let item = dataModel.lists[indexOfSelectedChecklist!].items[indexPath.row]
        cell.checkMarkLabel.text! = dataModel.lists[indexOfSelectedChecklist!].items[indexPath.row].checked ? " ✔︎ " : "   "
    }
        
    @IBAction func addItem(_ sender: Any) {
        
        let newRowIndex = dataModel.lists[indexOfSelectedChecklist!].items.count
        let item = ChecklistItem()
        item.checked = false
        item.text = "Ana gdeed"
        dataModel.lists[indexOfSelectedChecklist!].items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        dataModel.lists[indexOfSelectedChecklist!].items.remove(at: indexPath.row)
        let indexPath = [indexPath]
        tableView.deleteRows(at: indexPath, with: UITableViewRowAnimation.automatic)
        dataModel.saveChecklists()
    }

    func addItemCiewControllerDidCancel(_ controller:ItemTableViewController) {
        controller.dismiss(animated: true, completion: nil)
        
    }
    
    func addItemCiewController(_ controller:ItemTableViewController,didFinishAdding item: ChecklistItem) {
        controller.dismiss(animated: true, completion: nil)
        let newRowIndex = dataModel.lists[indexOfSelectedChecklist!].items.count
     
        dataModel.lists[indexOfSelectedChecklist!].items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        dataModel.saveChecklists()
    }
    func addItemCiewController(_ controller:ItemTableViewController,didFinishEditing item: ChecklistItem){
        
        let newRowIndex = dataModel.lists[indexOfSelectedChecklist!].items.index(of: item)
        let indexPath = IndexPath(row: newRowIndex!, section: 0)
        let indexPaths = [indexPath]
        tableView.reloadRows(at: indexPaths, with: UITableViewRowAnimation.automatic)
        
        dataModel.saveChecklists()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemViewController" {
            if let navigationController = segue.destination as? UINavigationController{
                
                if let controller = navigationController.topViewController as? ItemTableViewController{
                    controller.delegate = self
                
            }
        }
        } else if segue.identifier == "EditViewController" {
            
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! ItemTableViewController
            
            controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.itemToEdit = dataModel.lists[indexOfSelectedChecklist!].items[indexPath.row]
            }

            
        }
    }
    

    

}



