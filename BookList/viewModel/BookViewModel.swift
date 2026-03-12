//
//  BookViewModel.swift
//  BookList
//
//  Created by student on 12/03/26.
//

import Foundation
import Combine

class BookViewModel: ObservableObject {
    
    @Published var books: [Book] = []

    init() {
        books = [
            Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", image: "gatsby.jpg", genre: "Fiction", description: "A novel set in the Jazz Age, exploring themes of love, ambition, and the American Dream."),
            Book(title: "1984", author: "George Orwell", image: "1984.jpg", genre: "Dystopian", description: "A dystopian novel set in a totalitarian society, exploring themes of surveillance, freedom, and the erosion of individual rights."),
            Book(title: "To Kill a Mockingbird", author: "Harper Lee", image: "mockingbird.jpg", genre: "Fiction", description: "A novel set in the American South during the Great Depression, following the trial of a black man accused of raping a white woman."),
        ]
    }
    
    func addNewBook(title: String, author: String, image: String, genre: String, description: String) {
        books.append(
            Book(
                title: title,
                author: author,
                image: image,
                genre: genre,
                description: description
            )
        )
    }
    
    func filterBooks(byTitle title: String) -> [Book] {
        if title.isEmpty {
            return books
        }
        
        let filteredBooks = books.filter {
            $0.title.lowercased().contains(title.lowercased())
        }
        
        return filteredBooks
    }
}

