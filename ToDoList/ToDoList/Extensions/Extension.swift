//
//  Extension.swift
//  ToDoList

//  Created by Samuel Arturo Garrido Sánchez on 29/07/20.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

extension ToDoListTableViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil){ (action, sourceView, completionHandler) in
            let isDone = self.taskStore.tasks[indexPath.section][indexPath.row].isDone
            self.taskStore.removeTask(at: indexPath.row, isDone: isDone)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        // deleteAction.image =
        deleteAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
