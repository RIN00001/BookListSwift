//
//  mainView.swift
//  BookList
//
//  Created by student on 26/02/26.
//

import SwiftUI

struct mainView: View {
    var body: some View {
        TabView{
            Tab("Book", systemImage: "books.vertical"){
                BookList()
            }.badge(2)
            Tab("Read", systemImage: "book"){
                DailyReadView()
            }.badge("!")
            Tab("Profile", systemImage: "person"){
                    
            }.badge("!")
        }
    }
}

#Preview {
    mainView()
}
