//
//  ViewController.swift
//  Calculator
//
//  Created by 이승재 on 2020/07/22.
//  Copyright © 2020 SJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    

    @IBAction private func touchdigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDispaly = display.text!
            display.text = textCurrentlyInDispaly + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    
    }
    
    private var displayValue: Double {
        get{
            return Double(display.text!)!
            
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
}



