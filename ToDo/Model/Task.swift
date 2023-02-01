//
//  Task.swift
//  ToDo
//
//  Created by Александр Горелкин on 01.02.2023.
//

import Foundation
import RealmSwift


class Task: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var time: Date = Date()
    
    override init() {
        super.init()
    }
    
    init(name: String, time: Date) {
        self.name = name
        self.time = time
    }
    
}
