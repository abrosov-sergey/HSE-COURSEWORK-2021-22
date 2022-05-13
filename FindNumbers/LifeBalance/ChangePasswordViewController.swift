import UIKit

struct Keys {
    static let keyOldPassword = "oldPassword"
    static let keyNewPassword = "newPassword"
    static let keyCopyNewPassword = "copyNewPassword"
}

class ChangePasswordViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var copyNewPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        oldPassword.text = defaults.string(forKey: Keys.keyOldPassword)
        newPassword.text = defaults.string(forKey: Keys.keyNewPassword)
        copyNewPassword.text = defaults.string(forKey: Keys.keyCopyNewPassword)
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        let oldP = oldPassword.text!
        let newP = newPassword.text!
        let copyNewP = copyNewPassword.text!
        
        if !oldP.isEmpty && !newP.isEmpty && !copyNewP.isEmpty {
            defaults.set(oldP, forKey: Keys.keyOldPassword)
            defaults.set(newP, forKey: Keys.keyNewPassword)
            defaults.set(copyNewP, forKey: Keys.keyCopyNewPassword)
        }
    }
}
