//
//  OrderView.swift
//  CoffeeApp
//
//  Created by Gabriela Sanchez on 11/06/25.
//

import SwiftUI

struct OrderView: View {
    @State private var searchText = ""
    @State private var coffees = sampleCoffees 

    var body: some View {
        NavigationStack {
            ZStack {
                Color.cream.edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Find your coffee...", text: $searchText)
                    }
                    .padding()
                    .cornerRadius(30)
                    .shadow(color: Color.black.opacity(0.05), radius: 5)
                    .padding(.horizontal)
                    .padding(.top, 10)

                    List(filteredCoffees) { coffee in
                        NavigationLink(destination: CoffeeDetailView(coffee: coffee)) {
                            CoffeeRow(coffee: coffee)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .padding(.vertical, 4)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
                .navigationTitle("Order")
                .navigationBarTitleDisplayMode(.large)
            }
        }
    }

    var filteredCoffees: [Coffee] {
        searchText.isEmpty ? coffees : coffees.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(CartManager())
    }
}
