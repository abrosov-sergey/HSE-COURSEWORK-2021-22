import Foundation

class ModelTasks {
    let defaults = UserDefaults.standard
    
    static let shared = ModelTasks()
    
    struct Task: Codable {
        var name: String
        var description: String?
        var sphere: String
        var status: String
        
        var nameOfCell: String {
            var type: String = ""
            
            switch (sphere) {
            case "1":
                type = "Карьера"
            case "2":
                type = "Здоровье"
            case "3":
                type = "Духовный рост"
            case "4":
                type = "Финансы"
            case "5":
                type = "Яркость жизни"
            case "6":
                type = "Отношения"
            case "7":
                type = "Личностный рост"
            default:
                type = ""
            }
            
            return "\(name), \(type)"
        }
    }
    
    var tasks: [Task] {
        get {
            if let data = defaults.value(forKey: "tasks1") as? Data {
                return try! PropertyListDecoder().decode([Task].self, from: data)
            } else {
                return [Task]()
            }
        }
        
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "tasks1")
            }
        }
    }
    
    func saveTask(name: String, description: String?, sphere: String, status: String) {
        let taskss = Task(name: name, description: description, sphere: sphere, status: status)
        tasks.insert(taskss, at: 0)
    }
    
    func saveChangeTask(name: String, description: String?, sphere: String, status: String, oldName: String) {
        let taskss = Task(name: name, description: description, sphere: sphere, status: status)
        
        for i in 0..<ModelTasks.shared.tasks.count {
            if ModelTasks.shared.tasks[i].name == oldName {
                ModelTasks.shared.tasks[i] = taskss
                break
            }
        }
    }
}
