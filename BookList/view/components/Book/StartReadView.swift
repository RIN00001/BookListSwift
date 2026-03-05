//
//  StartReadView.swift
//  BookList
//
//  Created by student on 05/03/26.
//

import SwiftUI

struct StartReadView: View {
    
    @State var isReading = false
    @State var isPausing = false
    @State var notes = "The resident was evil"
    var playpauseButton: String {
        if isPausing {
            return "playpause.fill"
        } else {
            return "pause.fill"
        }
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            BookCard()
            
            VStack {
                Text("⏱ Time a Reading Sessions")
                    .font(.body)
                
                Text("00:00:00")
                    .font(.system(size: 65))
                    .fontWeight(.semibold)
            }
            
            
            
            if isReading {
                HStack(spacing: 30) {
                    
                    Button(action: {
                        isPausing.toggle()
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
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                
                
                Button("Save") {
                }
                .buttonStyle(.borderedProminent)
            }
            
        }
        .padding()
    }
}

#Preview {
    StartReadView()
}
