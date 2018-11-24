//
//  ViewController.swift
//  Calculator
//
//  Created by Administrator on 24/11/2018.
//  Copyright © 2018 DoubleThunder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Display label to push key inputs
    @IBOutlet weak var display: UILabel!
    
    // to allow the player to keep typing
    var userIsInTheMiddleOftyping = false
    
    // digit buttons behaviour
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOftyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOftyping = true
        }
    }
    
    // getting text and converting to doubles and setting text from double input using displayValue
    var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    // call mathematical operations behaviour
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOftyping{
            brain.setOperand(displayValue)
            userIsInTheMiddleOftyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result{
        displayValue = result
        }
    }
}
