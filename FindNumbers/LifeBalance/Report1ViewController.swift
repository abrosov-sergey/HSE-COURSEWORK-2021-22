import UIKit

class Report1ViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    var nowReport: ModelReport.Report?

    @IBOutlet weak var dataR: UITextField!
    
    @IBOutlet weak var careerR: UITextField!
    @IBOutlet weak var healthR: UITextField!
    @IBOutlet weak var spiritualGrowthR: UITextField!
    @IBOutlet weak var financeR: UITextField!
    @IBOutlet weak var brightnessOfLifeR: UITextField!
    @IBOutlet weak var relationshipR: UITextField!
    @IBOutlet weak var personalGrowthR: UITextField!
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if nowReport != nil && nowReport?.dataR != "" {
            deleteButton.isEnabled = true
        } else {
            deleteButton.isEnabled = false
        }

        dataR.text = nowReport?.dataR
        
        careerR.text = nowReport?.career
        healthR.text = nowReport?.health
        spiritualGrowthR.text = nowReport?.spiritualGrowth
        financeR.text = nowReport?.finance
        brightnessOfLifeR.text = nowReport?.brightnessOfLife
        relationshipR.text = nowReport?.relationship
        personalGrowthR.text = nowReport?.personalGrowth
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        let copyDataR = dataR.text!

        let copyCareerR = careerR.text!
        let copyHealthR = healthR.text!
        let copySpiritualGrowthR = spiritualGrowthR.text!
        let copyFinanceR = financeR.text!
        let copyBrightnessOfLifeR = brightnessOfLifeR.text!
        let copyRelationshipR = relationshipR.text!
        let copyPersonalGrowthR = personalGrowthR.text!
        
        if !copyDataR.isEmpty && !copyCareerR.isEmpty && !copyHealthR.isEmpty && !copySpiritualGrowthR.isEmpty && !copyFinanceR.isEmpty && !copyBrightnessOfLifeR.isEmpty && !copyRelationshipR.isEmpty && !copyPersonalGrowthR.isEmpty {
        
            if nowReport != nil && nowReport?.dataR != "" {
                ModelReport.shared.saveChangeReport(dataR: copyDataR, career: copyCareerR, health: copyHealthR, spiritualGrowth: copySpiritualGrowthR, finance: copyFinanceR, brightnessOfLife: copyBrightnessOfLifeR, relationship: copyRelationshipR, personalGrowth: copyPersonalGrowthR, oldDataR: nowReport!.dataR)
            } else {
                ModelReport.shared.saveReport(dataR: copyDataR, career: copyCareerR, health: copyHealthR, spiritualGrowth: copySpiritualGrowthR, finance: copyFinanceR, brightnessOfLife: copyBrightnessOfLifeR, relationship: copyRelationshipR, personalGrowth: copyPersonalGrowthR)
            }
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        for i in 0..<ModelReport.shared.reports.count {
            if ModelReport.shared.reports[i].dataR == nowReport?.dataR {
                ModelReport.shared.reports.remove(at: i)
                
                self.navigationController?.popViewController(animated: true)
                
                return
            }
        }
    }
}
