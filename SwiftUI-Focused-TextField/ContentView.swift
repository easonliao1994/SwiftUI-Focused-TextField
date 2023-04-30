//
//  ContentView.swift
//  SwiftUI-Focused-TextField
//
//  Created by Eason on 2023/4/30.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var isFocusedName
    @FocusState private var isFocusedDescription
    
    @State var name: String = ""
    @State var description: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Name")
                    .font(.headline)
                
                Spacer()
            }
            
            TextField("Input your name", text: $name)
                .focused($isFocusedName)
                .onChange(of: isFocusedName) { focused in
                    isFocusedName = focused
                }
                .frame(height: 30)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isFocusedName ? Color.yellow : Color.gray, lineWidth: 1)
                )
            HStack {
                Text("Description")
                    .font(.headline)
                
                Spacer()
            }
            
            TextField("Input your description", text: $description)
                .focused($isFocusedDescription)
                .onChange(of: isFocusedDescription) { focused in
                    isFocusedDescription = focused
                }
                .frame(height: 30)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isFocusedDescription ? Color.yellow : Color.gray, lineWidth: 1)
                )
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
