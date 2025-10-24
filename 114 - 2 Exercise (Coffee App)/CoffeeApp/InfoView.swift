//
//  InfoView.swift
//  CoffeeApp
//
//  Created by Gabriela Sanchez on 23/10/25.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.cream.edgesIgnoringSafeArea(.all)
                
                List {
                    Section(header: Text("About Us").font(.headline)) {
                        CardView {
                            Text("Welcome to The Daily Grind! We are passionate about sourcing the finest beans from around the world to brew you the perfect cup, every single time. Our mission is to be your favorite part of the day.")
                                .font(.body)
                                .padding(.vertical, 5)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                    
                    Section(header: Text("Visit Us").font(.headline)) {
                        CardView {
                            VStack(alignment: .leading, spacing: 12) {
                                Label("123 Coffee St, Brewtown, CA 90210", systemImage: "map.fill")
                                    .font(.headline)
                                    .foregroundColor(.coffeeBrown)
                                
                                Image(systemName: "map")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 150)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.tanAccent.opacity(0.2))
                                    .cornerRadius(10)
                                    .foregroundColor(.coffeeBrown)
                            }
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                    
                    Section(header: Text("Contact").font(.headline)) {
                        CardView {
                            VStack(alignment: .leading, spacing: 15) {
                                Label("(555) 123-4567", systemImage: "phone.fill")
                                    .font(.headline)
                                Label("hello@dailygrind.com", systemImage: "envelope.fill")
                                    .font(.headline)
                            }
                            .foregroundColor(.brown)
                            .padding(.vertical, 5)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.grouped)
                .scrollContentBackground(.hidden)
                .navigationTitle("Our Info")
            }
        }
    }
}

#Preview {
    InfoView()
}
