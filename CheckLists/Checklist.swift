import UIKit

class Checklist: NSObject ,NSCoding{
    
  var name: String
  var items: [ChecklistItem]
  var iconName: String
  
  override init() {
    self.name = ""
    self.items = [ChecklistItem]()
    self.iconName = ""
   
  }
   
  required init?(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObject(forKey: "Name") as! String
    items = aDecoder.decodeObject(forKey: "Items") as! [ChecklistItem]
    iconName = aDecoder.decodeObject(forKey: "IconName") as! String
    super.init()
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "Name")
    aCoder.encode(items, forKey: "Items")
    aCoder.encode(iconName, forKey: "IconName")
  }
    
}
