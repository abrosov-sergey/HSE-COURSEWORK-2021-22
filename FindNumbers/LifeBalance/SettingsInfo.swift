import Foundation

struct User: Codable {
    var nameOfUser: String?
    var password: String?
    var copyPassword: String?
}

class SettingsInfo {
    static var shared = SettingsInfo()
    
    var currentSettings: User {
        get {
            return currentSettings
        }
        
        set (newSettings) {
            if (newSettings.password != newSettings.copyPassword) {
                print("Ошибка")
                // Добавить уведомление на экране о неправильно введенном повторно пароле.
            } else {
                currentSettings.nameOfUser = newSettings.nameOfUser
                currentSettings.password = newSettings.password
                currentSettings.copyPassword = newSettings.copyPassword
            }
        }
    }
}
