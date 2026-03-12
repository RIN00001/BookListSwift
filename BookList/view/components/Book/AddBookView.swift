//
//  Untitled.swift
//  BookList
//
//  Created by student on 19/02/26.
//

import SwiftUI

struct AddBookView: View {
    @EnvironmentObject private var bookViewModel: BookViewModel
    
    @State var title : String = ""
    @State var author : String = ""
    @State var genre : String = "Cosmic Horror"
    @State var saveButtonDisabled : Bool = true
    
    @Binding var isAddBook: Bool
    
    let genres : [String] = ["Fiction", "Non-Fiction", "Fantasy", "Horror", "Cosmic Horror"]
    @State var selectedGenre = 0
    
    
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Title: ")
                    TextField("Title", text: $title)
                        .onChange(of: title) {
                            if !title.isEmpty && !author.isEmpty && !genre.isEmpty {
                                saveButtonDisabled = false
                            } else {
                                saveButtonDisabled = true
                            }
                        }
                }
                .padding()
                
                HStack{
                    Text("Author :")
                    TextField("Author", text: $author)
                        .onChange(of: author) {
                            if !title.isEmpty && !author.isEmpty && !genre.isEmpty {
                                saveButtonDisabled = false
                            } else {
                                saveButtonDisabled = true
                            }
                        }
                }.padding()
                
                HStack{
                    Text("Genre: ")
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.wheel)
                        .onChange(of: genre) {
                            if !title.isEmpty && !author.isEmpty && !genre.isEmpty {
                                saveButtonDisabled = false
                            } else {
                                saveButtonDisabled = true
                            }
                        }
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
                    Button(action:{
                        bookViewModel.addNewBook(title: <#T##String#>, author: <#T##String#>, image: <#T##String#>, genre: <#T##String#>, description: <#T##String#>)
                        
                        title = ""
                        author = ""
                        genre = ""
                        isAddBook = false
                    }){
                        Text("Add Book")
                    }.buttonStyle(.bordered)
                        .disabled(saveButtonDisabled)
                    
                    Button(action:{isAddBook = false}){
                        Text("Cancel")
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
    AddBookView(isAddBook: .constant(true))
}
