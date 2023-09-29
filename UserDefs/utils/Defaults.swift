//
//  Defaults.swift
//  UserDefs
//
//  Created by Akramjon on 29/09/23.
//

import Foundation

struct Defaults {
    
    static func storeUser(user: User) {
        
        let encoder = JSONEncoder()
        
        if let encodedUser = try? encoder.encode(user) {
            
            UserDefaults.standard.set(encodedUser, forKey: "user")
        }
        
    }
    
    static func loadUser() -> User! {
        
        if let savedUserData = UserDefaults.standard.object(forKey: "user") as? Data {
            
            let decoder = JSONDecoder()
            
            if let savedUser = try? decoder.decode(User.self, from: savedUserData) {
                
                return savedUser
                
            }
            
        }
        
        return nil
        
    }
    
}
