//
//  TaskStore.swift
//  ToDoList
//
//  Created by Proteco on 3/7/20.
//  Copyright © 2020 Proteco. All rights reserved.
//

import Foundation

class TaskStore {
    var tasks: [[Task]] = [[Task]()]
    
    func add(_ task: Task, at index: Int, isDone: Bool = false) {
        let section = isDone ? 1 : 0
        
        tasks[section].insert(task, at: index)
    }
    
    @discardableResult func removeTask(at index: Int, isDone: Bool)-> Task{
        let section = isDone ? 1 : 0
        return tasks[section].remove(at: index)
    }
}
