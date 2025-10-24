//
//  CoffeeRow.swift
//  CoffeeApp
//
//  Created by Gabriela Sanchez on 11/06/25.
//

import SwiftUI

struct CoffeeRow: View {
    let coffee: Coffee

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: coffee.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 55, height: 55)
                .padding(10)
                .background(Color.tanAccent.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .foregroundColor(.coffeeBrown)

            VStack(alignment: .leading, spacing: 6) {
                Text(coffee.name)
                    .font(.headline)
                    .fontWeight(.semibold)

                HStack(spacing: 2) {
                    ForEach(0..<5) { i in
                        Image(systemName: i < coffee.rating ? "star.fill" : "star")
                            .font(.caption)
                            .foregroundColor(.yellow)
                    }
                }

                HStack(spacing: 8) {
                    Text("$\(String(format: "%.2f", coffee.price))")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.coffeeBrown)
                    
                    if let original = coffee.originalPrice, original != coffee.price {
                        Text("$\(String(format: "%.2f", original))")
                            .strikethrough()
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }

            Spacer()
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.04), radius: 4)
    }
}


#Preview {
    CoffeeRow(coffee: Coffee(name: "Latte", imageName: "cup.and.saucer.fill", price: 2.5, originalPrice: 4.0, rating: 4))
        .padding()
        .background(Color.cream)
}
