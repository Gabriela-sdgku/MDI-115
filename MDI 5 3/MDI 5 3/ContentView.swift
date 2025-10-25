//
//  ContentView.swift
//  MDI 5 3
//
//  Created by Gabriela Sanchez on 24/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isRTL: Bool = false
    
    let primaryAccent = Color.blue
    let secondaryAccent = Color.teal
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.white, Color(red: 0.95, green: 0.97, blue: 1.0)]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    private var simulatedLayoutDirection: LayoutDirection {
        isRTL ? .rightToLeft : .leftToRight
    }
    
    private var languageName: String {
        isRTL ? "Arabic (RTL Simulation)" : "English (LTR Simulation)"
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Label("Layout Direction", systemImage: "arrow.left.arrow.right.square")
                            .font(.title2.bold())
                            .foregroundColor(primaryAccent)
                        
                        Text("Toggle this switch to simulate how your UI adapts between Left-to-Right (e.g., English) and Right-to-Left (e.g., Arabic) languages. Observe automatic flipping of elements and text alignment.")
                            .font(.callout)
                            .foregroundColor(.secondary)
                        
                        Toggle(isOn: $isRTL) {
                            HStack {
                                Image(systemName: isRTL ? "text.alignright" : "text.alignleft")
                                    .font(.title2)
                                    .foregroundColor(secondaryAccent)
                                Text(languageName)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                        }
                        .toggleStyle(.switch)
                        .tint(primaryAccent)
                        .padding(.vertical, 8)
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0, y: 5)
                    )
                    .padding(.horizontal)
                    
                    Group {
                        LayoutDemoView(primaryAccent: primaryAccent, secondaryAccent: secondaryAccent)
                    }
                    .environment(\.layoutDirection, simulatedLayoutDirection)
                    .animation(.easeInOut(duration: 0.4), value: isRTL)
                    
                }
                .padding(.vertical, 30)
            }
            .background(backgroundGradient.ignoresSafeArea())
            .navigationTitle("RTL/LTR Layout Tester")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.white.opacity(0.8), for: .navigationBar)
            .toolbarColorScheme(.light, for: .navigationBar)
        }
    }
}

struct LayoutDemoView: View {
    @Environment(\.layoutDirection) var layoutDirection
    @State private var name: String = ""
    
    let primaryAccent: Color
    let secondaryAccent: Color

    var body: some View {
        VStack(spacing: 25) {
            Text(layoutDirection == .rightToLeft ? "مرحباً بالعالم!" : "Hello, World!")
                .font(.largeTitle.bold())
                .foregroundColor(.black.opacity(0.9))
            
            SectionCard(title: "HStack Adaptability", icon: "arrow.right.to.line.square.fill", accentColor: primaryAccent) {
                HStack(spacing: 15) {
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                        .font(.largeTitle)
                        .foregroundColor(secondaryAccent)
                    
                    Text("greeting", comment: "A welcome message")
                        .font(.body)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.forward")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 10)
            }
            
            SectionCard(title: "Semantic Padding", icon: "rectangle.inset.filled", accentColor: secondaryAccent) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("leading.padding.example", comment: "Text demonstrating leading padding")
                        .padding(.leading, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white.opacity(0.8))
                                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
                        )
                }
            }
            
            SectionCard(title: "Text Field Alignment", icon: "keyboard.fill", accentColor: primaryAccent) {
                VStack(alignment: .leading) {
                    TextField(
                        "enter.name.placeholder",
                        text: $name
                    )
                    .textFieldStyle(.plain)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white.opacity(0.8))
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                }
            }
            // TODO: the icons do dont move to the right when switching
            SectionCard(title: "List Item Flow", icon: "list.bullet.rectangle.portrait.fill", accentColor: secondaryAccent) {
                VStack(spacing: 8) {
                    FlowRow(textKey: "item.one", iconName: "star.fill", tint: .orange, isRTL: layoutDirection == .rightToLeft)
                    FlowRow(textKey: "item.two", iconName: "heart.fill", tint: .red, isRTL: layoutDirection == .rightToLeft)
                    FlowRow(textKey: "item.three", iconName: "tag.fill", tint: .purple, isRTL: layoutDirection == .rightToLeft)
                }
            }
            
        }
        .padding(.horizontal)
    }
}

struct SectionCard<Content: View>: View {
    let title: LocalizedStringKey
    let icon: String
    let accentColor: Color
    let content: Content

    init(title: LocalizedStringKey, icon: String, accentColor: Color, @ViewBuilder content: () -> Content) {
        self.title = title
        self.icon = icon
        self.accentColor = accentColor
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(accentColor)
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .padding(.bottom, 5)

            content
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal)
    }
}

struct FlowRow: View {
    let textKey: LocalizedStringKey
    let iconName: String
    let tint: Color
    let isRTL: Bool

    var body: some View {
        HStack(spacing: 10) {
            if !isRTL {
                Image(systemName: iconName)
                    .foregroundColor(tint)
            }
            
            Text(textKey, comment: "List item text")
            
            Spacer()
            
            if isRTL {
                Image(systemName: iconName)
                    .foregroundColor(tint)
            }
        }
        .font(.body)
        .padding(.vertical, 8)
        .padding(.horizontal, 15)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white.opacity(0.7))
        )
    }
}


#Preview("LTR Visually Appealing") {
    ContentView()
        .environment(\.layoutDirection, .leftToRight)
}

#Preview("RTL Visually Appealing") {
    ContentView()
        .environment(\.layoutDirection, .rightToLeft)
}
