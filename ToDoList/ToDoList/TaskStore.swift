//
//  TaskStore.swift
//  ToDoList
//
//  Created by Samuel Arturo Garrido Sánchez on 29/07/20.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import Foundation

class TaskStore {
    var tasks: [[Task]] = [[Task]()]
    
    @discardableResult func removeTask(at index: Int, isDone: Bool)-> Task{
        let section = isDone ? 1 : 0
        return tasks[section].remove(at: index)
    }
    
    func add(_ task: Task, at index: Int, isDone: Bool = false) {
        let section = isDone ? 1 : 0
        
        tasks[section].insert(task, at: index)
    }
    
    
}
