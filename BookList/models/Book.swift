//
//  Book.swift
//  BookList
//
//  Created by student on 05/03/26.
//

import Foundation

struct Book: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let author: String
    let image: String
    let genre: String
    let description: String
}

var testBooks: [Book] = [
    Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", image: "gatsby.jpg", genre: "Fiction", description: "A novel set in the Jazz Age, exploring themes of love, ambition, and the American Dream.")]
    
