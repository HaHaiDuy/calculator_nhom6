//
//  ViewController.swift
//  calculator_nhom6
//
//  Created by duy on 4/19/18.
//  Copyright © 2018 duy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var check = false;
    var reset = false;
    var dem = 0
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if(reset == true)
        {
            label.text = ""
            reset = false
        }
        label.text = label.text! + String(sender.tag-1)
        // khi nhập số, thì sẽ nhập được kí tự biểu thức sau đó
        check = false
    }
    
    @IBAction func actions(_ sender: UIButton) {
        // label.text != "" -> khi mà màn hình chưa có gì, sẽ không đánh được các kí tự:
        // + - * / .
        if (label.text != "" && sender.tag != 15 && sender.tag != 16 && check == false)
        {
            if(sender.tag == 11) // +
            {
                label.text = label.text! + "+"
            }
            if(sender.tag == 12) // -
            {
                label.text = label.text! + "-"
            }
            if(sender.tag == 13) // *
            {
                label.text = label.text! + "*"
            }
            if(sender.tag == 14) // /
            {
                label.text = label.text! + "/"
            }
            if(sender.tag == 17) // .
            {
                label.text = label.text! + "."
            }
            // cứ mỗi 1 lần nhập dấu biểu thức, ta cho biến check = true
            check = true
            reset = false
        }
        if (sender.tag == 18) // (
        {
            label.text = label.text! + "("
            dem = dem + 1
        }
        if (sender.tag == 19) // )
        {
            label.text = label.text! + ")"
            dem = dem - 1
        }
        if(sender.tag == 15 && dem == 0 && reset == false) // =
        {
            let currentText = label.text
            let expression = NSExpression(format: currentText!)
            let mathValue = expression.expressionValue(with: nil, context: nil) as! NSNumber
            
            label.text = String(describing: mathValue)
            reset = true
        }
        if(sender.tag == 16) // C
        {
            label.text = ""
            check = false;
            reset = false;
            dem = 0
        }
        if(sender.tag == 20) // DEL
        {
            var chuoi: String = label.text!
            chuoi = String(chuoi.characters.dropLast())
            label.text = String(chuoi)
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
    
    
}

