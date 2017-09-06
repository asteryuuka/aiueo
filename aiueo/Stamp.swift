//
//  Stamp.swift
//  aiueo
//
//  Created by 兼子友花 on 2017/09/06.
//  Copyright © 2017年 兼子友花. All rights reserved.
//

import UIKit

import RealmSwift

class Stamp: Object {
    dynamic var id: Int = 0
    dynamic var stampImageName: String = ""
    dynamic var categoryName: String = ""
    
    override static func primaryKey() -> String{
        
        return "id"
    }
    
    static func lastId() -> Int{
        let realm = try! Realm()
        if let todo = realm.objects(Stamp.self).sorted(byKeyPath: "id", ascending: false).first{
            return todo.id + 1
        }else{
            return 1
        }
    }
}
