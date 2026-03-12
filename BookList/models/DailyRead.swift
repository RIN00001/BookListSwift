//
//  DailyRead.swift
//  BookList
//
//  Created by student on 12/03/26.
//

import Foundation

struct DailyRead: Identifiable, Hashable{
    let id = UUID()
    let book: Book
    let readDate: Date
    let readTimeInSeconds: Int
    let note: String?
}
