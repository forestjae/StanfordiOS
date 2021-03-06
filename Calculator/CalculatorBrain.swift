//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 이승재 on 2020/07/26.
//  Copyright © 2020 SJ. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    private var accumulator  = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }

    func performOperation(symbol: String) {
        switch symbol {
        case "π": accumulator = M_PI
        case "√": accumulator = sqrt(accumulator)
        default: break
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }

}

