import UIKit

class FindTasksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let element = ModelTasksByApp.Task(name: "Системное задание №1", description: "Первое системное задание доступное для добавления в собственнй список", sphere: "0")

        ModelTasksByApp.shared.tasks.insert(element, at: 0)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = indexPath.row
        performSegue(withIdentifier: "showDetails3", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DescriptionTaskViewController {
            if let check = tableView.indexPathForSelectedRow?.row {
                destination.nowTask = ModelTasksByApp.shared.tasks[check]
            } else {
                destination.nowTask = ModelTasksByApp.Task(name: "", description: "", sphere: "")
            }
        }
    }
}

extension FindTasksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelTasksByApp.shared.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!

        if let dCell = tableView.dequeueReusableCell(withIdentifier: "dCell") {
            cell = dCell
        } else {
            cell = UITableViewCell()
        }

        cell.textLabel!.text = ModelTasksByApp.shared.tasks[indexPath.row].nameOfCell

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
