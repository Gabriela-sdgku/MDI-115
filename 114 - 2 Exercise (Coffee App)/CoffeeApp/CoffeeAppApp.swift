//
//  CoffeeAppApp.swift
//  CoffeeApp
//
//  Created by Gabriela Sanchez on 11/06/25.
//

import SwiftUI

@main
struct CoffeeApp: App {
    @StateObject var cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
            TabView {
                // --- I recommend adding HomeView as your first tab ---
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                
                OrderView()
                    .tabItem {
                        Label("Order", systemImage: "cup.and.saucer.fill")
                    }
                
                // --- HERE IS THE NEW INFO TAB ---
                InfoView()
                    .tabItem {
                        Label("Info", systemImage: "info.circle.fill")
                    }
            }
            .environmentObject(cartManager)
            .tint(.coffeeBrown) // This tints the active tab icon
        }
    }
}
