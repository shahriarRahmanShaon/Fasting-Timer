//
//  FastingModel.swift
//  Fasting Timer
//
//  Created by sergio shaon on 19/2/22.
//

import Foundation

struct FastingModel {
    
    enum FastingState{
        case notStarted
        case fasting
        case feeding
    }
    enum FastingPlan: String{
        case beginner = "12:12"
        case intermediate = "16:8"
        case pro = "20:4"
        
        var fastingPeriod: Double{
            switch self {
            case .beginner:
                return 12
            case .intermediate:
                return 16
            case .pro:
                return 20
            }
        }
    }
}
