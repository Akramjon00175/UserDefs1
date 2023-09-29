//
//  SwiftUIView.swift
//  UserDefs
//
//  Created by Akramjon on 07/10/23.
//

import SwiftUI

struct SwiftUIView: View {
    
    @ObservedObject var defs = Defs()
    @ObservedObject var defPW = DefPW()
    
    init(defs: Defs = Defs(), defPW: DefPW = DefPW()) {
        self.defs = defs
        self.defPW = defPW
        //
        
        print(Defaults.loadUser())
        
        Defaults.storeUser(user: User(firstname: "true", lastname: "true", email: "true", phone: "true", address: "true"))
        
        print(Defaults.loadUser())
        //
        print(defs.loadUser())
        
        let account = Accounts(holderName: "true", cardNumber: "true", accountBalance: "true", spendingLimit: "true")
        
        defs.account = account
        
        print(defs.loadUser())
        
        //
        
        print(defPW.loadPW())
        
        let pw = Password(password: "Very Good")
        
        defPW.password = pw
        
        print(defPW.loadPW())
        
    }
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SwiftUIView()
}
