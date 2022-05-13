import UIKit

class DescriptionTaskViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    var nowTask: ModelTasksByApp.Task?
    
    @IBOutlet weak var nameOfTask: UILabel!
    @IBOutlet weak var taskDescription: UILabel!
    @IBOutlet weak var sphereOfLife: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameOfTask.text = nowTask?.name
        taskDescription.text = nowTask?.description
        sphereOfLife.text = nowTask?.sphere
    }
    
    @IBAction func addTask(_ sender: Any) {
        let copyNameOfTask = nameOfTask.text!
        let copyTaskDescription = taskDescription.text!
        let copySphereOfLife = sphereOfLife.text!
        
        let element = ModelTasks.Task(name: copyNameOfTask, description: copyTaskDescription, sphere: copySphereOfLife, status: "3")
        
        ModelTasks.shared.tasks.insert(element, at: 0)
        
        self.navigationController?.popViewController(animated: true)
    }
}
