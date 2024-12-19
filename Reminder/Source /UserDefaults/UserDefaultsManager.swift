//
//  UserDefaultsmanager.swift
//  Reminder
//
//  Created by Josymarss on 19/12/24.
//

import Foundation

class UserDefaultsManager {
    
    static var userKey = "userKey"
    
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
    
}
