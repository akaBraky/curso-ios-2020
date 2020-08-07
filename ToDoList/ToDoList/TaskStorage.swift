//
//  TaskStorage.swift
//  ToDoList
//
//  Created by Samuel Arturo Garrido Sánchez on 29/07/20.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import Foundation

class TaskStorage {
    private static let taskKey = "tasks"
    private static func archive(_ tasks: [[Task]]) -> NSData {
        return try! NSKeyedArchiver.archivedData(withRootObject: tasks, requiringSecureCoding: false) as NSData
    }
    
    static func fetch()->[[Task]]?{
        guard let unachivedData =  UserDefaults.standard.object(forKey: taskKey) as? Data else {
            return nil
        }
        return try! NSKeyedUnarchiver.unarchivedObject(ofClasses: [NSArray.self, TaskStorage.self], from: unachivedData) as? [[Task]]
    }

    static func save(_ tasks: [[Task]]){
        let archiveTasks = archive(tasks)
        UserDefaults.standard.setValue(archiveTasks, forKey: taskKey)
        UserDefaults.standard.synchronize()
    }
}
