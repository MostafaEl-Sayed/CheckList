//
//  ItemTableViewController.swift
//  CheckLists
//
//  Created by Mostafa El_sayed on 4/22/17.
//  Copyright © 2017 Mostafa El_sayed. All rights reserved.
//

import UIKit



class ItemTableViewController: UITableViewController{

    
    weak var delegate:AddItemViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    
    @IBOutlet weak var itemNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit {
            title = "Edit Item"
            itemNameTextField.text = item.text
  
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


    
       @IBAction func donePressed(_ sender: Any) {
        if self.itemNameTextField.text! != "" {
            if let item = itemToEdit {
                
                item.text = itemNameTextField.text!
                delegate?.addItemCiewController(self, didFinishEditing: item)
            } else {
                
                let item = ChecklistItem()
                item.text = self.itemNameTextField.text!
                item.checked = false
                
                delegate?.addItemCiewController(self, didFinishAdding: item)
            }
            self.dismiss(animated: true, completion: nil)

        }else {
            let alert = UIAlertController(title: "Invalid Process", message: "Please Enter Empty Field", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func cancelPressed(_ sender: Any) {
        
        delegate?.addItemCiewControllerDidCancel(self)
    }
    

}


