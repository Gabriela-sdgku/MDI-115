//
//  CoffeeDetailView.swift
//  CoffeeApp
//
//  Created by Gabriela Sanchez on 11/06/25.
//

import SwiftUI

struct CoffeeDetailView: View {
    let coffee: Coffee
    @State private var quantity = 1
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ZStack {
            Color.cream.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 24) {
                Spacer()
                
                Image(systemName: coffee.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .foregroundColor(.coffeeBrown)
                    .padding(30)
                    .background(Color.tanAccent.opacity(0.2))
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 10, y: 5)

                Text(coffee.name)
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.coffeeBrown)

                HStack {
                    Text("Price:")
                        .font(.title2)
                        .foregroundColor(.secondary)
                    Text("$\(String(format: "%.2f", coffee.price))")
                        .font(.title2)
                        .fontWeight(.bold)
                }

                Stepper("Quantity: \(quantity)", value: $quantity, in: 1...10)
                    .font(.headline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding(.horizontal)

                Spacer()
                
                // --- Themed Add to Cart Button ---
                Button(action: {
                    cartManager.addToCart(coffee: coffee, quantity: quantity)
                }) {
                    Text("Add to Cart")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.coffeeBrown) // Key color change
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(color: Color.coffeeBrown.opacity(0.4), radius: 10, y: 5)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .padding()
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    // I updated the preview to use a real SF Symbol
    NavigationView {
        CoffeeDetailView(coffee: Coffee(name: "Latte", imageName: "cup.and.saucer.fill", price: 2.5, originalPrice: 4.0, rating: 4))
            .environmentObject(CartManager())
    }
}
