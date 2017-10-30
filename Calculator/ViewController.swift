
import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    var firstNumber:Double = 0
    var perfomingMath = false
    var operation = 0
    var previousNumber:Double = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberButton(_ sender: customButton)
    {
        if perfomingMath == true {
            resultLabel.text = String(sender.tag - 1)
            firstNumber = Double(resultLabel.text!)!
            if resultLabel.text == "0" + String(sender.tag - 1){
                resultLabel.text = String(sender.tag - 1)
            }
            perfomingMath = false
        }else{
            resultLabel.text = resultLabel.text! + String(sender.tag - 1)
            firstNumber = Double(resultLabel.text!)!
            if resultLabel.text == "0" + String(sender.tag - 1){
                resultLabel.text = String(sender.tag - 1)
            }
            
        }
    }
    @IBAction func operateButton(_ sender: customButton)
    {
        
        if sender.tag != 18 && sender.tag != 17 && resultLabel.text != ""
        {
            previousNumber = Double(resultLabel.text!)!
            switch (sender.tag) {
            case 11 :
                //sum
                firstNumberLabel.text = String(previousNumber) + "+"
                break
            case 12 :
                //substract
                firstNumberLabel.text = String(previousNumber) + "-"
                break
            case 13 :
                //multiply
                firstNumberLabel.text = String(previousNumber) + "x"
                break
            case 14 :
                //divide
                firstNumberLabel.text = String(previousNumber) + "÷"
                break
            case 15 :
                //reminder operator
                firstNumberLabel.text = String(previousNumber) + "%"
                break
                //wher back button
            default:
                //unary operater
                resultLabel.text = String(-previousNumber)
                firstNumber = Double(resultLabel.text!)!
                firstNumberLabel.text = resultLabel.text
                break
            }
           
            operation = sender.tag
            perfomingMath = true
        }
        else if sender.tag == 17
        {
            switch (operation)
            {
            case 11 :
                resultLabel.text = String(previousNumber + firstNumber)
                firstNumberLabel.text = String(previousNumber) + "+" + String(firstNumber)
                break
            case 12 :
                resultLabel.text = String(previousNumber - firstNumber)
                firstNumberLabel.text = String(previousNumber) + "-" + String(firstNumber)
                break
            case 13 :
                resultLabel.text = String(previousNumber * firstNumber)
                firstNumberLabel.text = String(previousNumber) + "x" + String(firstNumber)
                break
            case 14 :
                resultLabel.text = String(format: "%.2f",(previousNumber / firstNumber))
                firstNumberLabel.text = String(previousNumber) + "÷" + String(firstNumber)
                if resultLabel.text == "inf" {
                    
                    resultLabel.text = "∞"
                    if resultLabel.text == "∞" {
                        resultLabel.text = "0"
                        firstNumber = 0
                        previousNumber = 0
                        firstNumberLabel.text = ""
                        perfomingMath = false
                    }
               
                    
                    
                }else if resultLabel.text == "-inf"
                {
                    
                    resultLabel.text = "0"
                    firstNumber = 0
                    previousNumber = 0
                    firstNumberLabel.text = ""
                    perfomingMath = false
                        
                    
                }
                break
            default:
                resultLabel.text = String(previousNumber.truncatingRemainder(dividingBy: firstNumber))
                firstNumberLabel.text = String(previousNumber) + "%" + String(firstNumber)
                break
            }
      
        }
        else if sender.tag == 18
        {
            firstNumber = 0
            previousNumber = 0
            //firstNumberLabel.text = String(previousNumber)
            firstNumberLabel.text = ""
            resultLabel.text = "0"
            perfomingMath = false
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
