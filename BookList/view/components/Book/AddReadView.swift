//
//  AddReadView.swift
//  BookList
//
//  Created by student on 26/02/26.
//

import SwiftUI

struct AddReadView: View {
    @EnvironmentObject var bookViewModel: BookViewModel
    
    @State var searchText: String = ""
    @State var showSuggestions: Bool = false
    @State var isResultEmpty: Bool = false
    @State var isReadyToRead: Bool = false
    @State var filteredBooks: [Book] = []
    @State var selectedBook: Book? = nil
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            TextField("Search for a book", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading, .bottom, .trailing])
                .onChange(of: searchText) {
                    filteredBooks = bookViewModel.filterBooks(byTitle: searchText)
                }
            
            HStack {
                Text("Book Info")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(searchText.isEmpty ? bookViewModel.books : filteredBooks, id: \.self) { book in
                        Button(action: {
                            isReadyToRead = true
                            selectedBook = book
                            filteredBooks = []
                            searchText = book.title
                        }) {
                            BookCard(book: book)
                        }
                    }
                }
            }
            
            Spacer()
        }
        .fullScreenCover(isPresented: $isReadyToRead) {
            StartReadView()
        }
    }
}

#Preview {
    AddReadView()
        .environmentObject(BookViewModel())
}
