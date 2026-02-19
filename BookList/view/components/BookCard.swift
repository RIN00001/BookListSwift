//
//  BookCard.swift
//  BookList
//
//  Created by student on 19/02/26.
//
import SwiftUI

struct BookCard: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(red:0.973,green: 0.973,blue:0.973 ))
                .frame(height:250)
            HStack{
                
                VStack(spacing: 15){
                    HStack{
                        Text("Title: ")
                        Text("Iron Lung ")
                        Spacer()
                    }
                    HStack{
                        Text("Author: ")
                        Text("Markplier")
                        Spacer()
                    }
                    HStack{
                        Text("Genre: ")
                        Text("Cosmic Horror ")
                        Spacer()
                    }
                }.padding()
                Image(.ironLungMoviePoster)
                    .resizable()
                    .frame(width:125,height:175)
                    .padding()
            }
            //book info
            
            //book img
        }
    }
}

#Preview {
    BookCard()
}
