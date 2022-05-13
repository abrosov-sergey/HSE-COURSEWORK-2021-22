import Foundation

class ModelReport {
    let defaults = UserDefaults.standard
    
    static let shared = ModelReport()
    
    struct Report: Codable {
        var dataR: String
        var career: String
        var health: String
        var spiritualGrowth: String
        var finance: String
        var brightnessOfLife: String
        var relationship: String
        var personalGrowth: String
        
        var nameOfCell: String {
            return "\(dataR)"
        }
    }
    
    var reports: [Report] {
        get {
            if let data = defaults.value(forKey: "reports") as? Data {
                return try! PropertyListDecoder().decode([Report].self, from: data)
            } else {
                return [Report]()
            }
        }
        
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "reports")
            }
        }
    }
    
    func saveReport(dataR: String, career: String, health: String, spiritualGrowth: String, finance: String, brightnessOfLife: String, relationship: String, personalGrowth: String) {
        
        let reportss = Report(dataR: dataR, career: career, health: health, spiritualGrowth: spiritualGrowth, finance: finance, brightnessOfLife: brightnessOfLife, relationship: relationship, personalGrowth: personalGrowth)
        
        reports.insert(reportss, at: 0)
    }
    
    func saveChangeReport(dataR: String, career: String, health: String, spiritualGrowth: String, finance: String, brightnessOfLife: String, relationship: String, personalGrowth: String, oldDataR: String) {
        
        let reportss = Report(dataR: dataR, career: career, health: health, spiritualGrowth: spiritualGrowth, finance: finance, brightnessOfLife: brightnessOfLife, relationship: relationship, personalGrowth: personalGrowth)
        
        for i in 0..<ModelReport.shared.reports.count {
            if ModelReport.shared.reports[i].dataR == oldDataR {
                ModelReport.shared.reports[i] = reportss
                break
            }
        }
    }
}
