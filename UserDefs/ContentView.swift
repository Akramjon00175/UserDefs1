//
//  ContentView.swift
//  UserDefs
//
//  Created by Akramjon on 29/09/23.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        
        print(Defaults.loadUser()!)
        Defaults.storeUser(user: User(firstname: "true", lastname: "true", email: "true", phone: "true", address: "true"))
        print(Defaults.loadUser()!)
        
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
