//
//  ContentView.swift
//  BookList
//
//  Created by student on 19/02/26.
//

import SwiftUI

struct ContentView: View {
    @State var isShown = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Hello, World!")
                Button(action:{isShown.toggle()}){
                    Text("Next")
                }.buttonStyle(.borderedProminent)
            }.navigationTitle("Wait View")
                .navigationDestination(isPresented: $isShown, destination: {SubView()})
                .padding()
        }
    }
}

struct SubView: View {
    var body: some View {
        Text("This is second view")
    }
}

#Preview {
    ContentView()
}
