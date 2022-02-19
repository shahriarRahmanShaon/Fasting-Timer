//
//  ContentView.swift
//  Fasting Timer
//
//  Created by sergio shaon on 19/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var fastingVm = FastingViewModel()
    var title: String{
        switch fastingVm.fastingState{
        case .notStarted:
            return "Lets get started"
        case .fasting:
            return "Yeah your are fasting"
        case .feeding:
            return "Yeah your are feeding"
        }
    }
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            content
        }
    }
    var content: some View{
        VStack(spacing: 45){
            Text(title)
                .foregroundColor(.blue)
                .font(.title3)
                .bold()
            Text(fastingVm.fastingPlan.rawValue)
                .padding(.horizontal, 25)
                .padding(.vertical, 15)
                .background(.thinMaterial)
                .cornerRadius(15)
                .foregroundColor(.white)
            ProgressRing()
            HStack{
                VStack(spacing: 10){
                    Text(fastingVm.fastingState == .notStarted ? "Start" : "Started")
                        .opacity(0.5)
                    Text(Date(), format: .dateTime.weekday().hour().minute().second())
                        .bold()
                }
                Spacer()
                VStack(spacing: 10){
                    Text(fastingVm.fastingState == .notStarted ? "End" : "Ends")
                        .opacity(0.5)
                    Text(Date(), format: .dateTime.weekday().hour().minute().second())
                        .bold()
                }

            }.foregroundColor(.white)
            Button {
                withAnimation {
                    fastingVm.fastingToggle()
                }
            } label: {
                Text(fastingVm.fastingState == .fasting ? "End Fast" : "Start Fasting")
                    .padding(.horizontal, 25)
                    .padding(.vertical, 15)
                    .background(.thinMaterial)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .font(.title2)
            }

        }.padding(25)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

