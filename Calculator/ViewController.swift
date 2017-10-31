
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var equalButton: customButton!
    @IBOutlet weak var currentNumberLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var currentNumber:Double = 0
    var perfomingMath = false
    var operation = 0
    var previousNumber:Double = 0
    var result: Double = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        equalButton.isEnabled = false
    }
    
    @IBAction func numberButton(_ sender: customButton)
    {
        if perfomingMath == true {
            resultLabel.text = String(sender.tag - 1)
            currentNumber = Double(resultLabel.text!)!
            if resultLabel.text == "0" + String(sender.tag - 1){
                resultLabel.text = String(sender.tag - 1)
            }
            perfomingMath = false
        }else{
            resultLabel.text = resultLabel.text! + String(sender.tag - 1)
            currentNumber = Double(resultLabel.text!)!
            if resultLabel.text == "0" + String(sender.tag - 1){
                resultLabel.text = String(sender.tag - 1)
            }
            
        }
    }
    @IBAction func operateButton(_ sender: customButton)
    {
        print(sender.tag)
        equalButton.isEnabled = false
        if sender.tag != 18 && sender.tag != 17 && resultLabel.text != ""
        {
            previousNumber = Double(resultLabel.text!)!
            currentNumber = Double(resultLabel.text!)!
            
            switch (sender.tag) {
            case 11 :
                //sum
                result += currentNumber
                currentNumberLabel.text = String(format: "%g", result) + "+"
                resultLabel.text = "0"
                currentNumber = 0
                break
            case 12 :
                //substract
                if result == 0 {
                    result = currentNumber
                } else {
                    result -= currentNumber
                }
                
                currentNumberLabel.text = String(format: "%g", result) + "-"
                resultLabel.text = "0"
                currentNumber = 0
                break
            case 13 :
                //multiply
                if result == 0 {
                    result = 1
                }
                result *= currentNumber
                currentNumberLabel.text = String(format: "%g", result) + "x"
                resultLabel.text = "0"
                currentNumber = 0
                break
            case 14 :
                //divide
                result /= currentNumber
                if currentNumber == 0 {
                    resultLabel.text = "∞"
                    currentNumberLabel.text = "∞"
                    return
                }
                currentNumberLabel.text = String(format: "%g", result) + "÷"
                resultLabel.text = "0"
                currentNumber = 0
                break
            case 15 :
                //reminder operator
                currentNumberLabel.text = String(format: "%g", result) + "%"
                resultLabel.text = "0"
                currentNumber = 0
                break
            //wher back button
            default:
                //unary operater
                resultLabel.text = String(format: "%g", -previousNumber)
                currentNumber = Double(resultLabel.text!)!
                currentNumberLabel.text = resultLabel.text
                result = currentNumber
                break
            }
            
            operation = sender.tag
            perfomingMath = true
            equalButton.isEnabled = true
        }
            
        else if sender.tag == 17
        {
            
            
            let tempResult = result
            
            if result == 0 {
                result = previousNumber
            }
            switch (operation)
            {
            case 11 :
                result += currentNumber
                print("result \(result)")
                resultLabel.text = String(format: "%g", result)
                currentNumberLabel.text = String(format: "%g", tempResult) + "+" + String(format: "%g", currentNumber) + " = " + String(format: "%g", result)
                break
            case 12 :
                result -= currentNumber
                resultLabel.text = String(format: "%g", result)
                currentNumberLabel.text = String(format: "%g", tempResult) + "-" + String(format: "%g", currentNumber) + " = " + String(format: "%g", result)
                break
            case 13 :
                result *= currentNumber
                resultLabel.text = String(format: "%g", result)
                currentNumberLabel.text = String(format: "%g", tempResult) + "x" + String(format: "%g", currentNumber) + " = " + String(format: "%g", result)
                break
            case 14 :
                result /= currentNumber
                resultLabel.text = String(format: "%g", result)
                currentNumberLabel.text = String(format: "%g", tempResult) + "÷" + String(format: "%g", currentNumber) + " = " + String(format: "%g", result)
                if resultLabel.text == "inf" {
                    
                    resultLabel.text = "∞"
                    if resultLabel.text == "∞" {
                        resultLabel.text = "0"
                        currentNumber = 0
                        previousNumber = 0
                        currentNumberLabel.text = ""
                        perfomingMath = false
                    }
                    
                }else if resultLabel.text == "-inf"
                {
                    
                    resultLabel.text = "0"
                    currentNumber = 0
                    previousNumber = 0
                    currentNumberLabel.text = ""
                    perfomingMath = false
                    
                    
                }
                break
            case 15 :
                if previousNumber < currentNumber {
                    resultLabel.text = "0"
                    currentNumberLabel.text = "0"
                    return
                }
                resultLabel.text = String(format: "%2g", previousNumber.truncatingRemainder(dividingBy: currentNumber))
                currentNumberLabel.text = String(format: "%2g",  previousNumber) + "%" + String(format: "%2g", currentNumber)
                break
            default :
                equalButton.isEnabled = false
                currentNumberLabel.text = ""
                break
            }
            
        }
        else if sender.tag == 18
        {
            currentNumber = 0
            previousNumber = 0
            //firstNumberLabel.text = String(previousNumber)
            currentNumberLabel.text = ""
            resultLabel.text = "0"
            perfomingMath = false
            result = 0
        }
    }
    @IBAction func dotButton(_ sender: customButton)
    {
        if(resultLabel.text!.characters.count == 0)
        {
            resultLabel.text = "0."
        }
        else
        {
            if((resultLabel.text!.lowercased().characters.contains(".")) == false)
            {
                resultLabel.text = resultLabel.text! + "."
            }
        }
        resultLabel.text = resultLabel.text
    }
}

@IBDesignable class customButton: UIButton {
    @IBInspectable
    public var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
}
