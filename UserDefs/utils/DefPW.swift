//
//  DefPW.swift
//  UserDefs
//
//  Created by Akramjon on 29/09/23.
//

import Foundation
import SwiftKeychainWrapper

class DefPW: ObservableObject {
    
    @Published var password: Password? {
        didSet {
        
            storePW(password: password ?? Password(password: "No error"))
        }
    }
    
    init(){
        
        self.password = loadPW()
        
    }
    
    
    func storePW(password: Password) {
       
       let encoder = JSONEncoder()
       
       if let encodedPW = try? encoder.encode(password) {
           
           KeychainWrapper.standard.set(encodedPW, forKey: "password")
       }
       
   }
   
    func loadPW() -> Password! {
       
       if let savedPWData = KeychainWrapper.standard.object(forKey: "password") as? Data {
           
           let decoder = JSONDecoder()
           
           if let savedPW = try? decoder.decode(Password.self, from: savedPWData) {
               
               return savedPW
               
           }
           
       }
       
       return nil
       
   }
}
