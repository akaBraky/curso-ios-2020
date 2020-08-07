//
//  ViewController.swift
//  ToDoList
//
//  Created by Proteco on 2/22/20.
//  Copyright © 2020 Proteco. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    // MARK: - Properties
    var taskStore : TaskStore! {
        didSet{
            taskStore.tasks = TaskStorage.fetch() ?? [[Task]()]
            tableView.reloadData()
        }
    }
    
    //MARK:- Outlet
    @IBOutlet weak var addTaskButton: UIBarButtonItem!
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        taskStore = TaskStore()
        tableView.tableFooterView = UIView()
    }
    
    // MARK:- Actions
    @IBAction func addTaskButtonAction(_ sender: Any) {
        let alertController: UIAlertController = UIAlertController(title:"Add Task", message:nil, preferredStyle: .alert)
        
        let addAction: UIAlertAction = UIAlertAction(title: "Add", style: .default){
            [weak self] _ in
            guard let name =  alertController.textFields?.first?.text else { return }
            let newTask = Task(name: name, isDone: false)
            
            self?.taskStore.add(newTask, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            self?.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        addAction.isEnabled = false
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addTextField{ [weak self] textField in
            textField.placeholder = "Ingresa tu tarea"
            textField.addTarget(self, action: #selector(self?.handleTextChanged), for: .editingChanged)
        }
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    @objc private func handleTextChanged (_ sender: UITextField){
        guard let alertController  = presentedViewController as? UIAlertController, let addAction = alertController.actions.first,
        let text = sender.text
        else { return }
        
        addAction.isEnabled = !text.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
}

// Mark: - DataSource
extension ToDoListTableViewController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "TO-DO" : "DONE"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return taskStore.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStore.tasks[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = taskStore.tasks[indexPath.section][indexPath.row].name
        return cell
    }
}

// Mark :- Table View Delegate


