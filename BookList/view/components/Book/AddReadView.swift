//
//  AddReadView.swift
//  BookList
//
//  Created by student on 26/02/26.
//

import SwiftUI

import SwiftUI

struct AddReadView: View {
    
    @State var searchText: String = ""
    @State var showSuggestions: Bool = false
    @State var isResultEmpty: Bool = false
    @State var isReadyToRead: Bool = false
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            
            TextField("Search for a book", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading, .bottom, .trailing])
                .onChange(of: searchText) {
                    showSuggestions = !searchText.isEmpty
                }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding([.leading, .bottom, .trailing])
            
            
            HStack {
                Text("Book Info")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.horizontal)
            
            
            if searchText.isEmpty || isResultEmpty {
                
                ZStack {
                    Rectangle()
                        .fill(Color(red: 0.973, green: 0.973, blue: 0.973))
                        .frame(width: 360, height: 222)
                    
                    Text("No Book Information")
                        .font(.body)
                }
            }
            
            
            else if showSuggestions {
                
                ScrollView {
                    VStack {
                        
                        Button(action: {
                            isReadyToRead = true
                            showSuggestions = false
                        }) {
                            BookCard()
                        }
                    }
                }
            }
            
            

            if isReadyToRead {
                StartReadView()
            }
            
            Spacer()
        }
    }
}

#Preview {
    AddReadView()
}
