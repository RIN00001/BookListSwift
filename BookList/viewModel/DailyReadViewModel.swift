//
//  DailyReadViewModel.swift
//  BookList
//
//  Created by student on 12/03/26.
//

import Foundation
import Combine

class DailyReadViewModel: ObservableObject {
    @Published var dailyReads: [DailyRead] = []
    
    init() {
            dailyReads.append(
                DailyRead(
                    book: Book(
                        title: "Atomic Habits",
                        author: "James Clear",
                        image: "atomic_habits",
                        genre: "Self-help",
                        description: "A book about building good habits and breaking bad ones."
                    ),
                    readDate: Date(),
                    readTimeInSeconds: 3600,
                    note: "Very motivating first chapter."
                )
            )
            
            dailyReads.append(
                DailyRead(
                    book: Book(
                        title: "The Hobbit",
                        author: "J.R.R. Tolkien",
                        image: "the_hobbit",
                        genre: "Fantasy",
                        description: "A fantasy adventure following Bilbo Baggins on an unexpected journey."
                    ),
                    readDate: Date().addingTimeInterval(-86400),
                    readTimeInSeconds: 2700,
                    note: "Loved the worldbuilding."
                )
            )
            
            dailyReads.append(
                DailyRead(
                    book: Book(
                        title: "1984",
                        author: "George Orwell",
                        image: "1984",
                        genre: "Dystopian",
                        description: "A novel about surveillance, control, and oppressive government."
                    ),
                    readDate: Date().addingTimeInterval(-172800),
                    readTimeInSeconds: 1800,
                    note: "A bit heavy, but interesting."
                )
            )
            
            dailyReads.append(
                DailyRead(
                    book: Book(
                        title: "The Alchemist",
                        author: "Paulo Coelho",
                        image: "the_alchemist",
                        genre: "Adventure",
                        description: "A philosophical novel about following your dreams."
                    ),
                    readDate: Date().addingTimeInterval(-259200),
                    readTimeInSeconds: 2400,
                    note: nil
                )
            )
            
            dailyReads.append(
                DailyRead(
                    book: Book(
                        title: "Clean Code",
                        author: "Robert C. Martin",
                        image: "clean_code",
                        genre: "Programming",
                        description: "A practical guide to writing readable and maintainable code."
                    ),
                    readDate: Date().addingTimeInterval(-345600),
                    readTimeInSeconds: 4200,
                    note: "Useful for coding habits."
                )
            )
        }
    
    
    func addNewDailyRead(dailyRead:DailyRead){
        dailyReads.append(dailyRead)
    }
    
    func getHours(seconds:Int) -> String {
        let hours = Int(seconds/3600)
        return hours > 9 ? String(hours) : "0\(hours)"
    }
    func getMinutes(seconds:Int) -> String {
        let minutes = Int((seconds % 3600 )/60)
        return minutes > 9 ? String(minutes) : "0\(minutes)"
    }
    func getSeconds(seconds:Int) -> String {
        let seconds = Int(seconds.remainderReportingOverflow(dividingBy: 60).partialValue)
        return seconds > 9 ? String(seconds) : "0\(seconds)"
    }
    func getTotalMinutesOnCurrentDate(currentDate date: Date) -> Int {
        let readsToday = dailyReads.filter {Calendar.current.isDate($0.readDate, inSameDayAs: date)}
        let result = readsToday.reduce(0) { $0 + $1.readTimeInSeconds / 60 }
        return Int(getMinutes(seconds: result)) ?? 0
    }
    
    func getWholeWeekReadStats(byDate date: Date) -> [Int] {
        let calendar = Calendar.current
        
        let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: date)?.start ?? date
        
        let daysOfWeek = (0..<7).compactMap {
            calendar.date(byAdding: .day, value: $0, to: startOfWeek)
        }
        
        return daysOfWeek.map { day in
            if day > Date.now {
                return 0
            } else {
                let totalMinutesOnCurrentDate = getTotalMinutesOnCurrentDate(currentDate: day)
                
                if totalMinutesOnCurrentDate == 0 {
                    return calendar.isDateInToday(day) ? 1 : 3
                } else if totalMinutesOnCurrentDate >= 30 {
                    return calendar.isDateInToday(day) ? 2 : 4
                } else {
                    return calendar.isDateInToday(day) ? 2 : 5
                }
            }
        }
    }
}
