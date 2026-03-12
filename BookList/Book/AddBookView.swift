//
//  Untitled.swift
//  BookList
//
//  Created by student on 19/02/26.
//

import SwiftUI

struct AddBookView: View {
    @State var title : String = ""
    @State var author : String = ""
    @State var genre : String = ""
    
    let genres : [String] = ["Fiction", "Non-Fiction", "Fantasy", "Horror", "Cosmic Horror"]
    @State var selectedGenre = 0
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Title: ")
                    TextField("Title", text: $title)
                }.padding()
                
                HStack{
                    Text("Author :")
                    TextField("Author", text: $author)
                }.padding()
                
                HStack{
                    Text("Genre: ")
                    Picker("Genre", selection: $selectedGenre){
                        ForEach(genres, id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.wheel)
                    Spacer()
                }.padding()
                
                ZStack{
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 150,height: 150)
                        .cornerRadius(20)
                    Image(systemName: "square.and.arrow.up")
                        .imageScale(.large)
                        .foregroundColor(.white)
                }
                
                HStack{
                    Button(action:{}){
                        Text("Add Book")
                    }.buttonStyle(.bordered)
                    
                    Button(action:{}){
                        Text("Add Book")
                    }.tint(.red)
                        .buttonStyle(.bordered)
                }.padding()
                
                Spacer()
            }.navigationTitle("Add Book")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddBookView()
}
