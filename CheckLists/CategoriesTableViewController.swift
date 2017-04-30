//
//  CategoriesTableViewController.swift
//  CheckLists
//
//  Created by Mostafa El_sayed on 4/29/17.
//  Copyright © 2017 Mostafa El_sayed. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController , AddNewCheckListTableViewControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RequestManager.defaultManager.loadChecklists()
        print("categories\(dataModel.lists)")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("load table view funs")
        return dataModel.lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellForTableView(tableView)
        
        let checklist = dataModel.lists[indexPath.row]
        cell.textLabel!.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        
        if checklist.items.count == 0 {
            cell.detailTextLabel!.text = "No Items"
        }else {
            cell.detailTextLabel!.text = "\(checklist.items.count)"
        }
        
        cell.imageView!.image = UIImage(named: checklist.iconName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "checkListItems", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "checkListItems" {
            let controller = segue.destination as! ChecklistViewController
            controller.indexOfSelectedChecklist = sender as? Int
            print(sender as? Int)
        } else if segue.identifier == "newCategory" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! AddNewCheckListTableViewController
            
            controller.delegate = self
            controller.checklistToEdit = nil
        }
    }
    
    func cellForTableView(_ tableView: UITableView) -> UITableViewCell {
        let cellIdentifier = "Cell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            return cell
        } else {
            return UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
    }
    
    func addNewCheckListTableViewControllerDidCancel(_ controller: AddNewCheckListTableViewController){
        // already canceld
    }
    func addNewCheckListTableViewController(_ controller: AddNewCheckListTableViewController, didFinishAdding checklist: Checklist){
        dataModel.lists.append(checklist)
        tableView.reloadData()
        
        
        RequestManager.defaultManager.saveChecklists()
    }
    
    func addNewCheckListTableViewController(_ controller: AddNewCheckListTableViewController, didFinishEditing checklist: Checklist){
        tableView.reloadData()
        
        RequestManager.defaultManager.saveChecklists()
    }
    

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        dataModel.lists.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        RequestManager.defaultManager.saveChecklists()
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let navigationController = storyboard!.instantiateViewController(withIdentifier: "AddNewCheckListNavigationController") as! UINavigationController
        let controller = navigationController.topViewController as! AddNewCheckListTableViewController
        
        controller.delegate = self
        
        let checklist = dataModel.lists[indexPath.row]
        controller.checklistToEdit = checklist
        
        present(navigationController, animated: true, completion: nil)
    }
    
    
    
}
