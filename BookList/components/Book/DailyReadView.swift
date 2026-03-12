//
//  DailyReadView.swift
//  BookList
//
//  Created by student on 26/02/26.
//

import SwiftUI

struct DailyReadView: View {
    @State var showDatePicker = false
    @State var isAddAcvity = false
    @State var selectedDate: Date = Date()
    @State var dayIndicator = 0
    @State var dailyGoal: Double = 20.0
    var body: some View {
        NavigationStack{
            VStack{

                HStack{
                    selectDateButton
                    Spacer()
                    VStack{
                        Text("\(dateIndicator)").font(.system(size: 32)).fontWeight(.bold)
                        Text("\(dayname), \(dateOnly)").font(.system(size: 20))
                    }
                    Spacer()
                    viewDetailButton
                    Spacer()
                    
                    //Date Indicator
                    //Detailed Read View
                }.padding()
                dayNameLabel
                HStack {
                    Spacer()
                    dailyIndicatorItem(dayIndicator: 1); Spacer()
                    dailyIndicatorItem(dayIndicator: 2); Spacer()
                    dailyIndicatorItem(dayIndicator: 0); Spacer()
                    dailyIndicatorItem(dayIndicator: 3); Spacer()
                    dailyIndicatorItem(dayIndicator: 4); Spacer()
                    dailyIndicatorItem(dayIndicator: 2); Spacer()
                    dailyIndicatorItem(dayIndicator: 0); Spacer()
                }
                Spacer()
                goalProgressRing
                .padding()
                Button("Add Reading Activity"){
                    isAddAcvity = true
                }.buttonStyle(.borderedProminent)
                Spacer()
            }
            
            .navigationDestination(isPresented: $isAddAcvity, destination: {AddReadView()})
            .navigationTitle("Daily Read")
            .navigationBarHidden(true)
        }
    }
}


extension DailyReadView{
    var dayname: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: selectedDate)
    }
    var dateOnly: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: selectedDate)
    }
    var dateIndicator: String{
        let calendar = Calendar.current
        if calendar.isDateInToday(selectedDate){
            return "TODAY"
        } else {
            return "PAST"
        }
    }
    
    private var selectDateButton: some View {
        ZStack{
            Button(action:{showDatePicker.toggle()}){
                ZStack{
                    Rectangle()
                        .fill(Color(red: 0.974, green: 0.965, blue: 0.965))
                        .frame(width: 60,height: 60)
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 30,height: 30)
                }
            }
        }.sheet(isPresented:$showDatePicker){
            VStack{
                DatePicker("Select Date", selection: $selectedDate, in: ...Date(),displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                
                Button("Done"){
                    self.showDatePicker.toggle()
                }
                .padding()
            }
        }
        .padding()
    }
    
    
    private var viewDetailButton: some View {
        ZStack{
            Rectangle()
                .fill(Color(red: 0.974, green: 0.965, blue: 0.965))
                .frame(width: 60,height: 60)
            Image(systemName: "doc.richtext")
                .resizable()
                .frame(width: 30,height: 30)
        }.padding()
    }
    
    private var dayNameLabel: some View {
        HStack{
            Spacer()
            Text("S").font(.system(size:26)); Spacer()
            Text("M").font(.system(size:26)); Spacer()
            Text("T").font(.system(size:26)); Spacer()
            Text("W").font(.system(size:26)); Spacer()
            Text("Th").font(.system(size:26)); Spacer()
            Text("F").font(.system(size:26)); Spacer()
            Text("Sa").font(.system(size:26)); Spacer()
        }
    }
    
    
    @ViewBuilder
    private var goalProgressRing: some View {
        let progress = Double (dailyGoal / 30)
        ZStack{
            Circle()
                .stroke(lineWidth: 10)
                .opacity(0.3)
            Circle()
                .inset(by: 10)
                .trim(from: 0.0,  to: progress)
                .stroke(.blue, style: StrokeStyle(lineWidth: 30,lineCap: .round,lineJoin: .round))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.easeInOut(duration: 0.2),value: 1)
            
            VStack{
                Text("Daily Goal").font(.largeTitle).padding()
                Text("\(Int(dailyGoal)) / 30 mins").font(.title2).padding()
            }
        }.frame(width: 340,height: 340)
    }
}

#Preview {
    DailyReadView()
}
