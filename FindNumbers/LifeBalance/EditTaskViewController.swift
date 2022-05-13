import UIKit

class EditTaskViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    var nowTask: ModelTasks.Task?
    
    @IBOutlet weak var nameOfTask: UITextField!
    @IBOutlet weak var taskDescription: UITextView!
    @IBOutlet weak var sphereOfLife: UITextField!
    @IBOutlet weak var taskStatus: UITextField!
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if nowTask != nil && nowTask?.name != "" {
            deleteButton.isEnabled = true
        } else {
            deleteButton.isEnabled = false
        }
        
        nameOfTask.text = nowTask?.name
        taskDescription.text = nowTask?.description
        sphereOfLife.text = nowTask?.sphere
        taskStatus.text = nowTask?.status
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        let copyNameOfTask = nameOfTask.text!
        let copyTaskDescription = taskDescription.text!
        let copySphereOfLife = sphereOfLife.text!
        let copyTaskStatus = taskStatus.text!
        
        if !copyNameOfTask.isEmpty && !copySphereOfLife.isEmpty && !copyTaskStatus.isEmpty {
            if nowTask != nil && nowTask?.name != "" {
                ModelTasks.shared.saveChangeTask(name: copyNameOfTask, description: copyTaskDescription, sphere: copySphereOfLife, status: copyTaskStatus, oldName: nowTask!.name)
            } else {
                ModelTasks.shared.saveTask(name: copyNameOfTask, description: copyTaskDescription, sphere: copySphereOfLife, status: copyTaskStatus)
            }
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func DeleteTask(_ sender: Any) {
        for i in 0..<ModelTasks.shared.tasks.count {
            if ModelTasks.shared.tasks[i].name == nowTask?.name {
                ModelTasks.shared.tasks.remove(at: i)
                
                self.navigationController?.popViewController(animated: true)
                
                return
            }
        }
    }
}
