//
//  ViewController.swift
//  Calculator
//
//  Created by Shahad Nasser on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputLabel: UILabel!
    
    var newOperation = true
    var operation = "+"
    var firstOperator: Double?
    var secondOperator: Double?
    var result: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func numberPadPressed(_ sender: UIButton) {
        if(sender.tag <= 9){
            updateNumber (number: String(sender.tag))
        }else if(sender.tag == 10){
            updateNumber(number: "0")
        }
        
    }
    
    @IBAction func operationPadPressed(_ sender: UIButton) {
        switch sender.tag {
        case 13:
            operation = "+"
        case 14:
            operation = "-"
        case 15:
            operation = "*"
        case 16:
            operation = "/"
        default: print("no such operation")
        }
        firstOperator = Double(inputLabel.text!)
        newOperation = true
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        secondOperator = Double( inputLabel.text!)
        switch operation {
        case "*":
            result = firstOperator! * secondOperator!
        case "/":
            if(secondOperator == 0){
                result = 0
            }else{
                result = firstOperator! / secondOperator!
            }
        case "-":
            result = firstOperator! - secondOperator!
        case "+":
            result = firstOperator! + secondOperator!
        default:
            result = 0.0
        }
        inputLabel.text = String( result!)
        newOperation = true
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        inputLabel.text = "0"
        newOperation = true
    }
    
    @IBAction func negativePressed(_ sender: UIButton) {
        var stringInput = String(inputLabel.text!)
        if(Double(stringInput)! < 0){
            stringInput.removeFirst()
        }else if (Double(stringInput)! > 0){
            stringInput = "-" + stringInput
        }
        inputLabel.text = stringInput
    }
    
    @IBAction func percentagePressed(_ sender: UIButton) {
        firstOperator = Double( inputLabel.text!)
             
        firstOperator = firstOperator!/100.0
            inputLabel.text = String(firstOperator!)
              newOperation = true
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        updateNumber(number: ".")
    }
    
    
    func updateNumber(number: String){
      var stringInput = String(inputLabel.text!)
        if (newOperation) {
            stringInput = ""
            newOperation = false
        }
        stringInput += number
        inputLabel.text = stringInput
    }
    
}

