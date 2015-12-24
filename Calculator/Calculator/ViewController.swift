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
        case "+":performOperation(plus)
        case "−":performOperation(minus)
        case "×":performOperation(multiply)
        case "÷":performOperation(divide)
        default : break
        }
    }
    
    func performOperation(operation:(Double,Double) -> Double){
        if operandStack.count >= 2{
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
        }
    }
    
    func multiply(op1:Double,op2:Double) ->Double{
        return op1 * op2
    }
    
    func divide(op1:Double,op2:Double) ->Double{
        return op2 / op1
    }
    
    func plus(op1:Double,op2:Double) ->Double{
        return op1 + op2
    }
    
    func minus(op1:Double,op2:Double) ->Double{
        return op2 - op1
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

