//
//  AddNewCheckListTableViewController.swift
//  CheckLists
//
//  Created by Mostafa El_sayed on 4/29/17.
//  Copyright © 2017 Mostafa El_sayed. All rights reserved.
//

import UIKit

class AddNewCheckListTableViewController: UITableViewController,ChooseIconsTableViewControllerDelegate {

    var delegate : AddNewCheckListTableViewControllerDelegate?
    @IBOutlet weak var nameListTextField: UITextField!

    @IBOutlet weak var iconImageView: UIImageView!
    
//    weak var delegate: ListDetailViewControllerDelegate?
//    
    var checklistToEdit: Checklist?
    var iconName = "Folder"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       if let checklist = checklistToEdit {
            title = "Edit Checklist"
            nameListTextField.text = checklist.name
            iconName = checklist.iconName
        }
        iconImageView.image = UIImage(named: iconName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //textField.becomeFirstResponder()
    }
    
    
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
       delegate?.addNewCheckListTableViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        
        if self.nameListTextField.text! == "" {
            let alert = UIAlertController(title: "Invalid Process", message: "Please Enter Empty Field", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else {
            if let checklist = checklistToEdit {
                checklist.name = nameListTextField.text!
                checklist.iconName = iconName
                delegate?.addNewCheckListTableViewController(self, didFinishEditing: checklist)
            }else {
            
            let checklist = Checklist()
            checklist.name = self.nameListTextField.text!
            checklist.iconName = self.iconName
            
            delegate?.addNewCheckListTableViewController(self, didFinishAdding: checklist)
            }
            self.dismiss(animated: true, completion: nil)
        }
        
     
    }

    
     func chooseIcon(_ controller: ChooseIconsTableViewController, didGetIcon Name: String) {
        self.iconName = Name
        iconImageView.image = UIImage(named: iconName)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PickIcon" {
            let controller = segue.destination as! ChooseIconsTableViewController
            controller.delegate = self
        }
    }

}
