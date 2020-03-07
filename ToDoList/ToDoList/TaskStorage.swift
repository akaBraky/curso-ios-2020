
//
//  TaskStorage.swift
//  ToDoList
//
//  Created by Proteco on 3/7/20.
//  Copyright © 2020 Proteco. All rights reserved.
//

import Foundation

class TaskStorage {
    private static let taskKey = "tasks"
    
    // Archive
    private static func archive(_ tasks: [[Task]]) -> NSData {
        return try! NSKeyedArchiver.archivedData(withRootObject: tasks, requiringSecureCoding: false) as NSData
    }
    
    // Fetch
    static func fetch()->[[Task]]?{
        guard let unachivedData =  UserDefaults.standard.object(forKey: taskKey) as? Data else {
            return nil
        }
        return try! NSKeyedUnarchiver.unarchivedObject(ofClasses: [NSArray.self, TaskStorage.self], from: unachivedData) as? [[Task]]
    }
    
    // Save
    static func save(_ tasks: [[Task]]){
        // archive
        let archiveTasks = archive(tasks)
        UserDefaults.standard.setValue(archiveTasks, forKey: taskKey)
        UserDefaults.standard.synchronize()
    }
}
