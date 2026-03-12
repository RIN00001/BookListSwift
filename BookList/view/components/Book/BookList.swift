//
//  BookList.swift
//  BookList
//
//  Created by student on 19/02/26.
//

import SwiftUI

struct BookList: View {
    @State var isAddingBook: Bool = false
    @State var searchText: String = ""
    
    @EnvironmentObject var bookViewModel: BookViewModel
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 10){
                    ForEach(bookViewModel.filterBooks(byTitle: searchText)){ _ in
                        BookCard(book: <#T##Book#>)
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationDestination(isPresented: $isAddingBook, destination: {AddBookView(isAddBook: $isAddingBook)})
            .navigationTitle("BookList")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    Button(action:{isAddingBook.toggle()}){
                        Text("Add Book")
                }
            }
        }
    }
}
#Preview {
    BookList()
        .environmentObject(BookViewModel())
}
