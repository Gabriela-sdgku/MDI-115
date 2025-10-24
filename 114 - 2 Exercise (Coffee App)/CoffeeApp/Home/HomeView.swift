//
//  HomeView.swift
//  CoffeeApp
//
//  Created by Gabriela Sanchez on 11/06/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.cream.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName: "bell.fill")
                            .font(.title2)
                            .foregroundColor(.coffeeBrown)
                    }

                    Text("Good afternoon,\nAlex")
                        .font(.system(size: 38, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Our Specials")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                SpecialCardView(imageName: "cup.and.saucer.fill", title: "Cappuccino")
                                SpecialCardView(imageName: "mug.fill", title: "Mocha Latte")
                                SpecialCardView(imageName: "takeoutbag.and.cup.and.straw.fill", title: "Iced Coffee")
                            }
                        }
                    }

                    CardView {
                        HStack {
                            Label("Rewards", systemImage: "star.fill")
                                .font(.headline)
                                .foregroundColor(.coffeeBrown)
                            Spacer()
                            Text("12 pts")
                                .fontWeight(.semibold)
                        }
                        .padding(.vertical, 8)
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Recent Orders")
                            .font(.title2)
                            .fontWeight(.bold)

                        ForEach([
                            ("Latte", "2 days ago"),
                            ("Cappuccino", "5 days ago")
                        ], id: \.0) { item in
                            CardView {
                                HStack {
                                    Image(systemName: "cup.and.saucer.fill")
                                        .foregroundColor(.coffeeBrown)
                                    Text(item.0)
                                        .font(.body)
                                        .fontWeight(.medium)
                                    Spacer()
                                    Text(item.1)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }

                    CardView {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Coffee Shop")
                                    .font(.headline)
                                Text("Open until 5:00 PM")
                                    .font(.subheadline)
                                    .foregroundColor(.green)
                                HStack {
                                    Image(systemName: "location.fill")
                                    Text("123 Coffee St, Brewtown")
                                        .font(.caption)
                                }
                                .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: "map.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.tanAccent)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Home")
        .navigationBarHidden(true)
    }
}

struct SpecialCardView: View {
    let imageName: String
    let title: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.coffeeBrown)
                .frame(width: 100, height: 80)
                .background(Color.tanAccent.opacity(0.3))
                .cornerRadius(15)
            
            Text(title)
                .font(.headline)
                .fontWeight(.medium)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}
