//
//  StartReadView.swift
//  BookList
//
//  Created by student on 05/03/26.
//

import SwiftUI

struct StartReadView: View {
    @EnvironmentObject var dailyReadViewModel: DailyReadViewModel
    
    
    @State var isReading = false
    @State var isPausing = false
    @State var notes = "The resident was evil"
    @State var noteInput = ""
    @State var timeInSeconds: Int = 0
    @State var noteInputPresented: Bool = false
    
    @Binding var isReadyToRead: Bool
    @Binding var book: Book?
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common)
    
    
    var playpauseButton: String {
        if isPausing {
            return "playpause.fill"
        } else {
            return "pause.fill"
        }
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            BookCard(book: book!)
            
            VStack {
                Text("⏱ Time a Reading Sessions")
                    .font(.body)
                
                Text("\(dailyReadViewModel.getHours(seconds: timeinSecond)):\(dailyReadViewModel.getMinutes(seconds: timeInSeconds)):\(dailyReadViewModel.getSeconds(seconds: timeInSeconds))")
                    .font(.system(size: 65))
                    .fontWeight(.semibold)
            }
            
            
            
            if isReading {
                HStack(spacing: 30) {
                    
                    Button(action: {
                        isPausing.toggle()
                        if isPausing {
                            timer = Timer.publish(every: 1, on: .main, in: .common)
                        } else {
                            
                        }
                    }) {
                        Image(systemName: playpauseButton)
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                    Button(action: {
                        isReading = false
                        isPausing = false
                    }) {
                        Image(systemName: "stop.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                
            } else {
                
                Button(action: {
                    isReading.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            
            
            Button("Manage Notes") {
                noteInputPresented = true
            }
            .buttonStyle(.borderedProminent)
            
            TextEditor(text: $notes)
                .scrollContentBackground(.hidden)
                .background(.gray)
                .foregroundColor(.white)
                .frame(height: 100)
                .padding()
            
            HStack {
                
                Button("Cancel") {
                    isReadyToRead.toggle()
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                
                
                Button("Save") {
                    let newDailyRead = DailyRead(book: book!, readDate: Date(), readTimeInSeconds: timeInSeconds, note: noteInput)
                    
                    dailyReadViewModel
                        .addNewDailyRead(dailyRead: newDailyRead)
                    
                    isReading = false
                    isPausing = false
                    timeInSeconds = 0
                    noteInputPresented = false
                    noteInput = ""
                    
                }
                .buttonStyle(.borderedProminent)
            }
            
        }.onReceive(timer, perform: {_ in
        timeInSeconds += 1})
        .fullScreenCover(isPresented: $noteInputPresented){
            ReadNoteInput(note: $noteInput,
            noteInputPresented
                          : $noteInputPresented)
        }
        .padding()
    }
}

#Preview {
    StartReadView(isReadyToRead: .constant(true), )
}
