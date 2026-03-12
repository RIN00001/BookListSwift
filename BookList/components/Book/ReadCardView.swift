//
//  ReadCardView.swift
//  BookList
//
//  Created by student on 26/02/26.
//

import SwiftUI

struct ReadCardView: View {
    var body: some View {
        
        ZStack {
          
            Rectangle()
                .fill(Color(red: 0.973, green: 0.973, blue: 0.973))
                .frame(height: 370)
            
            VStack {
                
                HStack {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        
                        HStack {
                            Text("Title :")
                            Text("Iron Lung")
                            Spacer()
                        }
                        
                        HStack {
                            Text("Author :")
                            Text("Markiplier")
                            Spacer()
                        }
                        
                        HStack {
                            Text("Genre :")
                            Text("Cosmic Horror")
                            Spacer()
                        }
                    }
                    .padding()
                    
                    Image("IronLung")
                        .resizable()
                        .frame(width: 100, height: 160)
                        .padding(.trailing, 30)
                }
                
                // Duration Row
                HStack {
                    Text("Duration :")
                        .padding(.leading, 22)
                    
                    Text("00 Hours 24 Mins 10 Sec")
                    
                    Spacer()
                }
                .padding(.bottom, 15)
                
                
                // Comment Box
                ZStack {
                    Rectangle()
                        .fill(Color(hue: 1.0, saturation: 0.015, brightness: 0.894))
                        .frame(height: 70)

                    Text("So good, I hope I have more time to read the book")
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 10)
                }
                .padding([.leading, .bottom, .trailing], 10)
                
            }
        }
    }
}

#Preview {
    ReadCardView()
}
