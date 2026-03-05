//
//  DetailDailyReadView.swift
//  BookList
//
//  Created by student on 05/03/26.
//

import SwiftUI

struct DetailDailyReadView: View {
    var body: some View {
        ScrollView{
            ReadCardView()
            ReadCardView()
            ReadCardView()
        }
    }
}

#Preview {
    DetailDailyReadView()
}
