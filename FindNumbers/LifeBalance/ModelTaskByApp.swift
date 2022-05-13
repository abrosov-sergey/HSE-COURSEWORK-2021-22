import Foundation

class ModelTasksByApp {
    let defaults = UserDefaults.standard
    
    static let shared = ModelTasksByApp()
    
    struct Task: Codable {
        var name: String
        var description: String?
        var sphere: String
        
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
            if let data = defaults.value(forKey: "tasksApp") as? Data {
                return try! PropertyListDecoder().decode([Task].self, from: data)
            } else {
                return [Task]()
            }
        }
        
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "tasksApp")
            }
        }
    }
    
    func saveTask(name: String, description: String?, sphere: String) {
        let taskss = Task(name: name, description: description, sphere: sphere)
        tasks.insert(taskss, at: 0)
    }
    
    func saveChangeTask(name: String, description: String?, sphere: String, oldName: String) {
        let taskss = Task(name: name, description: description, sphere: sphere)
        
        for i in 0..<ModelTasksByApp.shared.tasks.count {
            if ModelTasksByApp.shared.tasks[i].name == oldName {
                ModelTasksByApp.shared.tasks[i] = taskss
                break
            }
        }
    }
}
