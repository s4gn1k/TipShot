//
//  ViewController.swift
//  TipShot
//
//  Created by Sagnik Dhar on 2/27/16.
//  Copyright © 2016 sagnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageControl: UISegmentedControl!
    
    @IBOutlet weak var totalBy2Label: UILabel!
    @IBOutlet weak var totalBy3Label: UILabel!
    @IBOutlet weak var totalBy4Label: UILabel!
    @IBOutlet weak var totalBy5Label: UILabel!
    @IBOutlet weak var totalBy6Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$1.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBillChanged(sender: AnyObject) {
    
        if billField.text!.isEmpty
        {
            tipPercentageControl.hidden = true
            totalBy2Label.textColor = UIColor.grayColor()
            totalBy3Label.textColor = UIColor.grayColor()
            totalBy4Label.textColor = UIColor.grayColor()
            totalBy5Label.textColor = UIColor.grayColor()
            totalBy6Label.textColor = UIColor.grayColor()
        }
        else
        {
            tipPercentageControl.hidden = false
            totalBy2Label.textColor = UIColor.orangeColor()
            totalBy3Label.textColor = UIColor.orangeColor()
            totalBy4Label.textColor = UIColor.orangeColor()
            totalBy5Label.textColor = UIColor.orangeColor()
            totalBy6Label.textColor = UIColor.orangeColor()

        }
        
        var tipPercentages = [0.1,0.15,0.2]
        let tipPercentage = tipPercentages[tipPercentageControl.selectedSegmentIndex]
        
        tipLabel.text   = "$1.00"
        totalLabel.text = "$1.00"
        
        let bill : Double!    = Double(billField.text!)
        var tip = 0.0
        var total = 0.0
        
        if bill != nil
        {
            tip     = bill * tipPercentage
            total   = bill * (1.0+tipPercentage)
        }
        tipLabel.text       = String(format:"$%.2f",tip)
        totalLabel.text     = String(format:"$%.2f",total)
        totalBy2Label.text  = String(format:"$%.2f",total/2.0)
        totalBy3Label.text  = String(format:"$%.2f",total/3.0)
        totalBy4Label.text  = String(format:"$%.2f",total/4.0)
        totalBy5Label.text  = String(format:"$%.2f",total/5.0)
        totalBy6Label.text  = String(format:"$%.2f",total/6.0)
    }

    @IBAction func onControlChanged(sender: AnyObject) {
    
        onBillChanged(self)
    
    }
    @IBAction func onScreenTap(sender: AnyObject) {
        view.endEditing(true)
    }
}