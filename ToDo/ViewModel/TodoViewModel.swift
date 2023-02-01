//
//  TodoViewModel.swift
//  ToDo
//
//  Created by Александр Горелкин on 01.02.2023.
//

import Foundation
import RealmSwift

class ToDoViewModel: NSObject {
    
    static var sharedInstance = ToDoViewModel()
    
    var tasks = [Task]()
    
    let realm = try! Realm()
    
    func addTask(task: Task, completion: () -> (Void)) {
        
        self.realm.beginWrite()
        
        
        self.realm.add(task)
        
        try! self.realm.commitWrite()
        
        completion()
    }
    
    func loadTasks(completion: () -> (Void)) {
        
        self.realm.beginWrite()
        
        
        let savedTasks = self.realm.objects(Task.self)
        self.tasks.removeAll()
        self.tasks.append(contentsOf: savedTasks)
        
        try! self.realm.commitWrite()
        completion()
        
    }
    
    func deleteTask(task: Task, taskIndex: Int, completion: () -> (Void)) {
        
        self.realm.beginWrite()
        
        
        self.realm.delete(task)
        
        
        try! self.realm.commitWrite()
        tasks.remove(at: taskIndex)
        
        completion()
    
        
    }
    
    func editTask(task: Task, updatedTask: Task, completion: () -> (Void)) {
        
        self.realm.beginWrite()
        
        
        self.realm.delete(task)
        self.realm.add(updatedTask)
        
        try! self.realm.commitWrite()
        completion()
        
        
        
    }
    
}
