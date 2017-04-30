//
//  ChecklistItem.swift
//  CheckLists
//
//  Created by Mostafa El_sayed on 4/19/17.
//  Copyright © 2017 Mostafa El_sayed. All rights reserved.
//

import Foundation

class ChecklistItem : NSObject, NSCoding  {
    var text = ""
    var checked = false
    
    override init() {
        
    }
    init(text: String, checked: Bool) {
        self.text = text
        self.checked = checked
    }
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "Text") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        super.init()
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
    }
    
    
    func toggleChecked() {
        checked = !checked
    }

    
}
