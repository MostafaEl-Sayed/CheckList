//
//  RequestManager.swift
//  Future Center
//
//  Created by MsZ on 8/23/16.
//  Copyright © 2016 MsZ. All rights reserved.
//

import Foundation


class RequestManager{
    
    
    var lists = [Checklist]()
    
    static let defaultManager = RequestManager()
    private init (){}
    

    func saveChecklists() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(lists, forKey: "Checklists")
        archiver.finishEncoding()
        data.write(toFile: dataFilePath(), atomically: true)
        print("try to save")
        print(self.lists)
    }
    
    func loadChecklists() {
        print("Loading file \(dataFilePath())")
        let path = dataFilePath()
        if FileManager.default.fileExists(atPath: path) {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
                lists = unarchiver.decodeObject(forKey: "Checklists")
                    as! [Checklist]
                unarchiver.finishDecoding()
            }
        }
        print("try to load")
        print(self.lists)
    }
    func documentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return paths[0] as NSString
    }
    
    func dataFilePath() -> String {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    
    
}

