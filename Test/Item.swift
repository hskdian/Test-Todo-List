//
//  Item.swift
//  Test
//
//  Created by Shift Health on 2016-11-06.
//
//

import Foundation
class Item: NSObject, NSCoding {
    
    let name: String
    static let Dir = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = Dir.appendingPathComponent("items")
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
    required convenience init? (coder aDecoder:NSCoder){
        let name = aDecoder.decodeObject(forKey: "name") as! String
        self.init(name: name)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
    }

   /* var name: String
    
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encode(name,forKey:"name")
    }
    
    required convenience init? (coder aDecoder:NSCoder){
        _ = aDecoder.decodeObject(forKey: "name")as!String
        self.init(name:name)
    }
    
    init?(name: String) {
        self.name = name
        super.init()
    }*/
    
}
