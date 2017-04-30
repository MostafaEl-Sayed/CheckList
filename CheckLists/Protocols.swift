//
//  Extentions.swift
//  CheckLists
//
//  Created by Mostafa El_sayed on 4/29/17.
//  Copyright © 2017 Mostafa El_sayed. All rights reserved.
//




protocol AddItemViewControllerDelegate:class {
    
    func addItemCiewControllerDidCancel(_ controller:ItemTableViewController)
    func addItemCiewController(_ controller:ItemTableViewController,didFinishAdding item: ChecklistItem)
    func addItemCiewController(_ controller:ItemTableViewController,didFinishEditing item: ChecklistItem)
    
}
protocol AddNewCheckListTableViewControllerDelegate: class {
    
    func addNewCheckListTableViewControllerDidCancel(_ controller: AddNewCheckListTableViewController)
    func addNewCheckListTableViewController(_ controller: AddNewCheckListTableViewController, didFinishAdding checklist: Checklist)
    
    func addNewCheckListTableViewController(_ controller: AddNewCheckListTableViewController, didFinishEditing checklist: Checklist)
}

protocol ChooseIconsTableViewControllerDelegate: class {
    func chooseIcon(_ controller: ChooseIconsTableViewController, didGetIcon Name: String)
}
