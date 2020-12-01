//
//  ViewController.swift
//  MyCalc
//
//  Created by User on 2020/11/30.
//

import UIKit

class ViewController: UIViewController {
    var sNumber:String = ""
    var cCal:String = ""
    var dNumber:Double = 0
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var lblNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btn7.titleLabel?.adjustsFontSizeToFitWidth = true
    }

    @IBAction func btnTapped(_ sender: Any) {
        if let btn = sender as? UIButton{
            if let d = Double(btn.currentTitle!){
                sNumber += btn.currentTitle!
                lblNumber.text = sNumber
            }else if let w = btn.currentTitle {
                switch w {
                case ".":
                    if !sNumber.contains(".") {
                        sNumber += w
                        lblNumber.text = sNumber
                    }
                case "+","-","x","/","=":
                    switch cCal {
                    case "+":
                        dNumber += Double(sNumber) ?? 0.0
                    case "-":
                        dNumber -= Double(sNumber) ?? 0.0
                    case "x":
                        dNumber *= Double(sNumber) ?? 0.0
                    case "/":
                        dNumber /= Double(sNumber) ?? 1.0
                    default:
                        dNumber = Double(sNumber) ?? 0.0
                    }
                    sNumber = String(dNumber)
                    lblNumber.text = sNumber
                    if w != "=" {
                        sNumber = ""
                        cCal = w
                    }else{
                        cCal = ""
                    }
                default:
                    NSLog(w)
                }
            }
        }
        
    }
}

