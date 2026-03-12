//
//  BookListApp.swift
//  BookList
//
//  Created by student on 19/02/26.
//

import SwiftUI

@main
struct BookListApp: App {
    @StateObject var bookViewModel = BookViewModel()
    @StateObject var dailyReadViewModel = DailyReadViewModel()

    var body: some Scene {
        WindowGroup {
            mainView()
                .environmentObject(bookViewModel)
                .environmentObject(dailyReadViewModel)
        }
    }
}
