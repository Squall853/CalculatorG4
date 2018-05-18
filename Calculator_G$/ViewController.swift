

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label: UILabel!
    
    var stringWithMathematicalOperation: String = ""
    var strNum: String = ""
    var result  :Double  = 0.0
    var pheptoan = 1
    var phepdem = 0
    
    
    @IBAction func button(_ sender: UIButton) {
        if sender.tag == 11 && phepdem == 0 && pheptoan == 1 && label.text != ""
        {
                let exp: NSExpression = NSExpression(format: stringWithMathematicalOperation + strNum + ".0")
                result = exp.expressionValue(with: nil, context: nil) as! Double
                label.text = String(result)
        }
        else if phepdem != 0 && sender.tag == 11
        {
            createAlert(title: "WARNING", message: "Thieu " + String(phepdem) + " )")
        }
        else if pheptoan == 0 && sender.tag == 11
        {
            createAlert(title: "WARNING", message: "Khong hop le!!!")
        }
        else if sender.tag == 16
        {
            result = 0
            stringWithMathematicalOperation = ""
            label.text = ""
            pheptoan = 1
            phepdem = 0
        }
        strNum = ""
    }
    

    @IBAction func numbers(_ sender: UIButton) {
        if  sender.tag != 11 && sender.tag != 12 && sender.tag != 13 && sender.tag != 14 &&
            sender.tag != 15 && sender.tag != 16 && sender.tag != 18 && sender.tag != 20 &&
            sender.tag != 21 && sender.tag != 22 && sender.tag != 23 && sender.tag != 24 &&
            sender.tag != 25 && sender.tag != 26 && sender.tag != 27 && sender.tag != 19 && sender.tag != 17
            
        {
            strNum = strNum + String(sender.tag)
            //stringWithMathematicalOperation = stringWithMathematicalOperation + String(sender.tag)
            label.text = label.text! + String(sender.tag)
            pheptoan = 1
        }
            
            //+/-
        else if label.text != "" && sender.tag == 17 && pheptoan == 1
        {
            
            label.text = String(Double(stringWithMathematicalOperation)!*(-1.0))
            pheptoan = 0
        }
            
            //tinh tan
        else if label.text != "" && sender.tag == 26 && pheptoan == 1
        {
            if ((Double(stringWithMathematicalOperation)!) == 90 )
            {
                label.text = "Error"
            }
                
            else
            {
                label.text = String(tan((Double.pi*(Double(stringWithMathematicalOperation)!))/180))
                pheptoan = 0
            }
        }
            
            //tinh cos
        else if label.text != "" && sender.tag == 22 && pheptoan == 1
        {
            if ((Double(stringWithMathematicalOperation)!) == 90 )
            {
                label.text = String(0)
                pheptoan = 0
                
            }
                
            else
            {
                label.text = String(cos((Double.pi*(Double(stringWithMathematicalOperation)!))/180))
                pheptoan = 0
                
            }
        }
            
            //tinh sin
        else if label.text != "" && sender.tag == 21 && pheptoan == 1
        {
            
            label.text = String(sin((Double.pi*(Double(stringWithMathematicalOperation)!))/180))
            
            pheptoan = 0
        }
            
            //tinh luy thua 2
        else if label.text != "" && sender.tag == 18 && pheptoan == 1
        {
            label.text = String(pow((Double(stringWithMathematicalOperation)!), 2.0))
            pheptoan = 0
        }
            //ham log10
        else if label.text != "" && sender.tag == 24 && pheptoan == 1
        {
            label.text = String(log10(Double(stringWithMathematicalOperation)!))
            pheptoan = 0
        }
            
            //can bac 2
        else if label.text != "" && sender.tag == 23 && pheptoan == 1
        {
            label.text = String(sqrt(Double(stringWithMathematicalOperation)!))
            pheptoan = 0
        }
            
            //pi
        else if label.text != "" && sender.tag == 25 && pheptoan == 1
        {
            label.text = String(Double.pi)
            pheptoan = 0
        }
            
            //cong
        else if label.text != "" && sender.tag == 12 && pheptoan == 1
        {
            stringWithMathematicalOperation = stringWithMathematicalOperation + strNum + ".0" + "+"
            label.text = stringWithMathematicalOperation
            pheptoan = 0
            strNum = ""
        }
            
            //tru
        else if label.text != "" && sender.tag == 13 && pheptoan == 1
        {
            stringWithMathematicalOperation = stringWithMathematicalOperation + strNum + ".0" + "-"
            label.text = stringWithMathematicalOperation
            pheptoan = 0
            strNum = ""
        }
            
            //nhan
        else if label.text != "" && sender.tag == 14 && pheptoan == 1
        {
            stringWithMathematicalOperation = stringWithMathematicalOperation + strNum + ".0" + "*"
            label.text = stringWithMathematicalOperation
            pheptoan = 0
            strNum = ""
        }
            
            //chia
        else if label.text != "" && sender.tag == 15 && pheptoan == 1
        {
            stringWithMathematicalOperation = stringWithMathematicalOperation + strNum + ".0" + "/"
            label.text = stringWithMathematicalOperation
            pheptoan = 0
            strNum = ""
        }
            
            //dau cham
        else if label.text != "" && sender.tag == 10 && pheptoan == 1
        {
            stringWithMathematicalOperation = label.text! + "."
            label.text = stringWithMathematicalOperation
            pheptoan = 0
        }
            
            //dau (
        else if sender.tag == 19
        {
            stringWithMathematicalOperation = label.text! + "("
            label.text = stringWithMathematicalOperation
            pheptoan = 0
            phepdem = phepdem  + 1
        }
            
            //dau )
        else if label.text != "" && sender.tag == 20
        {
            stringWithMathematicalOperation = label.text! + ")"
            label.text = stringWithMathematicalOperation
            pheptoan = 1
            phepdem = phepdem  - 1
        }
    }

    
    
    
    // tao thong bao
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


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

	
