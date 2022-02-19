//
//  ProgressRing.swift
//  Fasting Timer
//
//  Created by sergio shaon on 19/2/22.
//

import SwiftUI

struct ProgressRing: View {
    @State private var progress = 0.5
    let gradient = Gradient(colors: [
        Color.blue,
        Color.pink,
        Color.yellow,
        Color.green
        ])
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.3)
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(AngularGradient(gradient: gradient, center: .center), style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round) )
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 1), value: progress)
            VStack(spacing: 25){
                VStack{
                    Text("Elapsed time")
                        .opacity(0.5)
                    Text("0:00")
                        .font(.title)
                        .bold()
                }
                VStack{
                    Text("Remaining time")
                        .opacity(0.5)
                    Text("0:00")
                        .font(.title)
                        .bold()
                }
            }.foregroundColor(.white)
        }
        .frame(width: 250, height: 250)
        .padding()
        .onAppear {
            progress = 1
        }
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing()
    }
}
