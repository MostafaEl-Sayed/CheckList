//
//  ChooseIconViewController.swift
//  CheckLists
//
//  Created by Mostafa El_sayed on 4/29/17.
//  Copyright © 2017 Mostafa El_sayed. All rights reserved.
//

import UIKit


class ChooseIconsTableViewController: UITableViewController{

    weak var delegate: ChooseIconsTableViewControllerDelegate?
    
    let icons = [
        "No Icon","Appointments","Birthdays",
        "Chores","Drinks","Folder","Groceries",
        "Inbox","Photos","Trips"
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath)
        
        let iconName = icons[indexPath.row]
        cell.textLabel!.text = iconName
        cell.imageView!.image = UIImage(named: iconName)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            let iconName = icons[indexPath.row]
            navigationController?.popViewController(animated: true)
            delegate.chooseIcon(self, didGetIcon: iconName)
        }
    }

}
