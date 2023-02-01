//
//  EditTaskViewController.swift
//  ToDo
//
//  Created by Александр Горелкин on 01.02.2023.
//

import UIKit

class EditTaskViewController: UIViewController {

    
    @IBOutlet weak var textName: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let vm = ToDoViewModel.sharedInstance
    var task: Task?
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        guard let task = task else { return }
        textName.text = task.name
        datePicker.date = task.time
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let newTask = Task(name: textName.text ?? "", time: datePicker.date)
        
        vm.editTask(task: self.task!, updatedTask: newTask) {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
        vm.deleteTask(task: self.task!, taskIndex: self.index!) {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
