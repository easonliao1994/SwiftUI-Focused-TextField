//
//  ContentView.swift
//  SwiftUI-Focused-TextField
//
//  Created by Eason on 2023/4/30.
//

import SwiftUI

struct FocusedTextField: View {
    
    @FocusState private var isFocused: Bool
    @Binding var text: String
    let placeholder: String
    let title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
            }
            
            TextField(placeholder, text: $text)
                .focused($isFocused)
                .onChange(of: isFocused) { focused in
                    isFocused = focused
                }
                .frame(height: 30)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isFocused ? Color.yellow : Color.gray, lineWidth: 1)
                )
        }
    }
}

struct ContentView: View {
    @State var name: String = ""
    @State var description: String = ""
    
    var body: some View {
        VStack {
            FocusedTextField(text: $name, placeholder: "Input your name", title: "Name")
            FocusedTextField(text: $description, placeholder: "Input your description", title: "Description")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
