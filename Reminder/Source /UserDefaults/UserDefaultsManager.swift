//
//  UserDefaultsmanager.swift
//  Reminder
//
//  Created by Josymarss on 19/12/24.
//

import Foundation
import UIKit

class UserDefaultsManager {
    
    private static var userKey = "userKey"
    private static var userName = "userName"
    private static let imageKey = "imageKey"

    static func saveUser(user: User) {
        let enconder = JSONEncoder()
        if let encoded = try? enconder.encode(user){
            UserDefaults.standard.set(encoded, forKey: userKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func loadUser() -> User? {
        let decoder = JSONDecoder()
        
        if let data = UserDefaults.standard.data(forKey: userKey){
            if let user = try? decoder.decode(User.self, from: data){
                return user
            }
        }
        return nil
    }
    
    static func saveUserName(name: String){
        UserDefaults.standard.setValue(name, forKey: userName)
        UserDefaults.standard.synchronize()
    }
    
    static func removeUser() {
        UserDefaults.standard.removeObject(forKey: userKey)
        UserDefaults.standard.synchronize()
        
        // Username and profile image
        UserDefaults.standard.removeObject(forKey: userName)
        UserDefaults.standard.removeObject(forKey: imageKey)
    }
    
    static func loadUserName() -> String? {
        return UserDefaults.standard.string(forKey: userName)
    }
    
    static func removeUserName() {
        UserDefaults.standard.removeObject(forKey: userName)
        UserDefaults.standard.synchronize()
    }
    
    static func saveProfileImage(from image: UIImage){
        
        if let jpgDataImage = image.jpegData(compressionQuality: 1.0) {
                UserDefaults.standard.set(jpgDataImage, forKey: imageKey)
        }
        
    }
    
    static func loadProfileImage() -> UIImage? {
        if let imageData = UserDefaults.standard.data(forKey: imageKey){
            return UIImage(data: imageData)
        }
        return UIImage(named: "user")
    }
    
}
