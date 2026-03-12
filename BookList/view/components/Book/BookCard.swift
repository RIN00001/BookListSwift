//
//  BookCard.swift
//  BookList
//
//  Created by student on 19/02/26.
//
import SwiftUI

struct BookCard: View {
    var book: Book
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(red:0.973,green: 0.973,blue:0.973 ))
                .frame(height:250)
            HStack{
                
                VStack(spacing: 15){
                    HStack{
                        Text("Title: ")
                        Text(book.title)
                        Spacer()
                    }
                    HStack{
                        Text("Author: ")
                        Text(book.author)
                        Spacer()
                    }
                    HStack{
                        Text("Genre: ")
                        Text(book.genre)
                        Spacer()
                    }
                }.padding()
                Image(.ironLung)
                    .resizable()
                    .frame(width:125,height:175)
                    .padding()
            }
        }
    }
}

#Preview {
    BookCard(book: Book(title: "Test", author: "Test", image: "Test", genre: "Test", description: "Test"))
}
