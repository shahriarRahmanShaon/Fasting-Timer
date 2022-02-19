//
//  FastingViewModel.swift
//  Fasting Timer
//
//  Created by sergio shaon on 19/2/22.
//

import SwiftUI

class FastingViewModel: ObservableObject{
    
    @Published private(set) var fastingState: FastingModel.FastingState = .notStarted
    @Published private(set) var fastingPlan: FastingModel.FastingPlan = .beginner
    @Published private(set) var startTime: Date
    @Published private(set) var endTime: Date
    
    var fastingTime: Double{
        fastingPlan.fastingPeriod
    }
    var feedingTime: Double{
        24 - fastingPlan.fastingPeriod
    }
    
    func fastingToggle(){
        fastingState = fastingState == .fasting ? .feeding : .fasting
    }
}
