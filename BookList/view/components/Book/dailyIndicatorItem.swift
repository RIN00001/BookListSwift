//
//  dailyIndicatorItem.swift
//  BookList
//
//  Created by student on 26/02/26.
//

import SwiftUI

struct dailyIndicatorItem: View {
    
    var dayIndicator: Int
    
    var body: some View {
        ZStack {
            
            if dayIndicator == 0 {
                Circle()
                    .stroke(.gray, lineWidth: 3)
                    .frame(width: 28, height: 28)
                
            } else if dayIndicator == 1 {
                Circle()
                    .stroke(.blue, lineWidth: 3)
                    .frame(width: 28, height: 28)
                
                Image(systemName: "checkmark")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.blue)
                
            } else if dayIndicator == 2 {
                Circle()
                    .stroke(.blue, lineWidth: 3)
                    .frame(width: 28, height: 28)
                
                Image(systemName: "checkmark")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.blue)
                
            } else if dayIndicator == 3 {
                Circle()
                    .stroke(.red, lineWidth: 3)
                    .frame(width: 28, height: 28)
                
                Image(systemName: "checkmark")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.red)
                
            } else if dayIndicator == 4 {
                Circle()
                    .stroke(.yellow, lineWidth: 3)
                    .frame(width: 28, height: 28)
                
            } else {
                Circle()
                    .fill(.gray)
                    .frame(width: 28, height: 28)
            }
        }
    }
}

