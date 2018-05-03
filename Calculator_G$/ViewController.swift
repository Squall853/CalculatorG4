//
//  ViewController.swift
//  Calculator_G$
//
//  Created by Boi on 4/25/18.
//  Copyright © 2018 Boi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var previousNumber2:Double = 0;
    var performinMath = false
    var operation = 0;
    var operation2 = 0;
    var newNumber = false
    var dock = false
    var result:Double = 0;
    /*var previousNumber1 = [Double]();
    var operation1 = [Int]();
    var i:Int = 0;
    var t = false*/
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label: UILabel!

    @IBAction func numbers(_ sender: UIButton)
    {
        if sender.tag == 10 && dock == false
        {
            if newNumber == false
            {
            label.text = label.text! + "."
            dock = true
            }
            else
            {
                label.text = "0."
                label1.text = "";
                dock = true
                newNumber = false
                operation = 0;
                previousNumber = 0;
                numberOnScreen = 0;
            }
            
        }
        else if sender.tag == 10 && dock == true
        {
            createAlert(title: "WARNING", message: "fail")
        }
        else
        {
            if performinMath == true || label.text == "0"
            {
                label.text = String(sender.tag)
                numberOnScreen = Double(label.text!)!
                performinMath = false
            }
            else
            {
                if newNumber == false
                {
                    label.text = label.text! + String(sender.tag)
                    numberOnScreen = Double(label.text!)!
                }
                else
                {
                    label.text = String(sender.tag)
                    numberOnScreen = Double(label.text!)!
                    newNumber = false
                }
            }
        }
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 17 && sender.tag != 20
        {
            newNumber = false
            previousNumber = Double(label.text!)!
            /*if sender.tag != 19
            {
                /*previousNumber1.append(Double(label.text!)!)
                operation1.append(sender.tag)
                t=true*/
                previousNumber2 = Double(label.text!)!;
                operation2 = sender.tag;
            }
            else
            {
                i+=1;
                label.text = "";
                if t == true
                {
                    i+=1;
                    t = false
                }
            }*/
            //sender.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1);
            if sender.tag == 12
            {
                label1.text = "+";
            }
            else if sender.tag == 13
            {
                label1.text = "-";
            }
            else if sender.tag == 14
            {
                label1.text = "x";
            }
            else if sender.tag == 15
            {
                label1.text = "/";
            }
            if sender.tag == 18
            {
                label.text = String(previousNumber / 100);
                dock = true
            }
            else
            {
                dock = false
                performinMath = true;
                operation = sender.tag
            }
        }
        else if sender.tag == 11 || sender.tag == 20
        {
            newNumber = true
            if operation == 12
            {
                result = (previousNumber + numberOnScreen);
            }
            else if operation == 13
            {
                result = (previousNumber - numberOnScreen);
            }
            else if operation == 14
            {
                result = (previousNumber * numberOnScreen);
            }
            else if operation == 15
            {
                result = (previousNumber / numberOnScreen);
            }
            
            if Double(Int(result)) == result
            {
                label.text = String(Int(result))
            }
            else
            {
            label.text = String(result)
            }
            previousNumber = Double(label.text!)!
            dock = false
            label1.text = ""
           // previousNumber1.remove(at: i)
            //operation1.remove(at: i)
            
            /*if sender.tag == 20
            {
                numberOnScreen = Double(label.text!)!
                i-=1;
                //previousNumber = previousNumber2
                //operation = operation2
            }*/
        }
        else if sender.tag == 16
        {
            operation = 0;
            previousNumber = 0;
            numberOnScreen = 0;
            label.text = "0";
            label1.text = "";
            dock = false
            result = 0;
        }
        else if sender.tag == 17
        {
            if label.text == "0"
            {
            createAlert(title: "WARNING", message: "fail")
            }
            else
            {
                newNumber = true
                dock = true
                label.text = String(Double(label.text!)! * -1);
                numberOnScreen = Double(label.text!)!
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createAlert (title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        //CREATING ON BUTTON
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print ("OK")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }


}

	
