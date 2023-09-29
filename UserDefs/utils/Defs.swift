//
//  Defs.swift
//  UserDefs
//
//  Created by Akramjon on 29/09/23.
//

import Foundation

class Defs: ObservableObject {
    
    @Published var account: Accounts? {
        
        didSet {
            storeUser(accounts: account ?? Accounts(holderName: "no", cardNumber: "no", accountBalance: "no", spendingLimit: "no"))
        }
        
    }
    
    
    init() {
        self.account = loadUser()
    }
    
    
     func storeUser(accounts: Accounts) {
        
        let encoder = JSONEncoder()
        
        if let encodedUser = try? encoder.encode(accounts) {
            
            UserDefaults.standard.set(encodedUser, forKey: "accounts")
        }
        
    }
    
     func loadUser() -> Accounts! {
        
        if let savedUserData = UserDefaults.standard.object(forKey: "accounts") as? Data {
            
            let decoder = JSONDecoder()
            
            if let savedUser = try? decoder.decode(Accounts.self, from: savedUserData) {
                
                return savedUser
                
            }
            
        }
        
        return nil
        
    }
    
}
