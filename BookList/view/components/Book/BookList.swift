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
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 10){
                    ForEach(1..<10){ _ in
                        BookCard()
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationDestination(isPresented: $isAddingBook, destination: {AddBookView()})
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
}
