//
//  AddTaskViewController.swift
//  ToDo
//
//  Created by Александр Горелкин on 01.02.2023.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var taskName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveButton(_ sender: Any) {
        let task = Task(name: taskName.text ?? "Nothing", time: datePicker.date)
        let vm = ToDoViewModel.sharedInstance
        vm.addTask(task: task) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
