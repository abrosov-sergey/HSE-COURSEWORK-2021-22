import UIKit

class MyTasksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndex = indexPath.row
        performSegue(withIdentifier: "showDetails2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditTaskViewController {
            if let check = tableView.indexPathForSelectedRow?.row {
                destination.nowTask = ModelTasks.shared.tasks[check]
            } else {
                destination.nowTask = ModelTasks.Task(name: "", description: "", sphere: "", status: "")
            }
        }
    }
}

extension MyTasksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelTasks.shared.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        if let dCell = tableView.dequeueReusableCell(withIdentifier: "dCell") {
            cell = dCell
        } else {
            cell = UITableViewCell()
        }
        
        cell.textLabel!.text = ModelTasks.shared.tasks[indexPath.row].nameOfCell
        
        switch (ModelTasks.shared.tasks[indexPath.row].status) {
        case "1":
            cell.contentView.backgroundColor = UIColor.green.withAlphaComponent(0.6)
        case "2":
            cell.contentView.backgroundColor = UIColor.yellow.withAlphaComponent(0.6)
        case "3":
            cell.contentView.backgroundColor = UIColor.red.withAlphaComponent(0.6)
        default:
            cell.contentView.backgroundColor = UIColor.clear
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
