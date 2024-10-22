//
//  ContentView.swift
//  Todo App
//
//  Created by Ayaz on 22/10/2024.
//

import SwiftUI

struct AppetizerTabView: View {
    @State private var username: String = ""
    
    @FocusState private var emailFieldIsFocused : Bool

    var body: some View {
         TabView {
             AppetizerHomeView()
                 .tabItem {
                     Image(systemName: "house")
                     Text("Home")
                 }
            AccountView()
                 .tabItem {
                     Image(systemName: "person")
                     Text("Account")
                 }
             OrderVeiw()
                 .tabItem {
                     Image(systemName: "bag")
                     Text("Order")
                 }
         }.accentColor(.brandColor)
    }
}

#Preview {
    AppetizerTabView()
}
