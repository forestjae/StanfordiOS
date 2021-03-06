//
//  ViewController.swift
//  Calculator3
//
//  Created by 이승재 on 2020/07/27.
//  Copyright © 2020 SJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleofTyping = false
    
    @IBAction private func touchdigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleofTyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleofTyping = true
        }
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
            
        }
    }
    private var brain = CalculatorBrain()
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleofTyping{
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleofTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
    
    
}


