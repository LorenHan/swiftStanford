//
//  ViewController.swift
//  Calculator
//
//  Created by 韩 晓剑 on 15/12/18.
//  Copyright © 2015年 韩 晓剑. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var usrIsIntheMiddleOfTypingANumber:Bool = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if usrIsIntheMiddleOfTypingANumber{
            display.text = display.text! + digit
        }else{
            display.text = digit
            usrIsIntheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if usrIsIntheMiddleOfTypingANumber{
            enter()
        }
        switch operation {
        case "+":
            if operandStack.count >= 2{
                displayValue = operandStack.removeLast() + operandStack.removeLast()
                enter()
            }
        case "−":
            if operandStack.count >= 2{
                displayValue = operandStack.removeLast() - operandStack.removeLast()
                enter()
            }
        case "×":
            if operandStack.count >= 2{
                displayValue = operandStack.removeLast() * operandStack.removeLast()
                enter()
            }
        case "÷":
            if operandStack.count >= 2{
                displayValue = operandStack.removeLast() / operandStack.removeLast()
                enter()
            }
        default: break
        }
    }
    
    //var operandStack:Array<Double> = Array<Double>()可以简写为下面
    var operandStack = Array<Double>()
    @IBAction func enter() {
        usrIsIntheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            usrIsIntheMiddleOfTypingANumber = false
        }
    }
}

