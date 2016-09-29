//
//  ViewController.swift
//  tippy
//
//  Created by Rahul Pandey on 9/26/16.
//  Copyright © 2016 Rahul Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let SECONDS_THRESHOLD = Double(10 * 60)
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipAmountSegmentedControl: UISegmentedControl!
    @IBOutlet weak var people2Label: UILabel!
    @IBOutlet weak var people3Label: UILabel!
    @IBOutlet weak var people4Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        self.view.tintColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipAmountSegmentedControl.selectedSegmentIndex]
        let total = bill + tip
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
        people2Label.text = formatter.stringFromNumber(total / 2)
        people3Label.text = formatter.stringFromNumber(total / 3)
        people4Label.text = formatter.stringFromNumber(total / 4)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultIndex = defaults.objectForKey("index_selected") as? Int ?? 0
        print("default index: ", defaultIndex)
        
        let secondsPreviousEnd = defaults.objectForKey("seconds_app_end") as? Double ?? 0
        let currentSeconds = NSDate().timeIntervalSince1970
        
        print("time gap in seconds", currentSeconds - secondsPreviousEnd)
        if (currentSeconds - secondsPreviousEnd < SECONDS_THRESHOLD) {
            let savedBillAmount = defaults.objectForKey("bill_amount") as? Double ?? 0
            billField.text = String(savedBillAmount)
        }
        
        
        tipAmountSegmentedControl.selectedSegmentIndex = defaultIndex
        calculateTip(totalLabel)
        view.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 240/255, alpha: 0.99)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        billField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let bill = Double(billField.text!) ?? 0
        defaults.setDouble(bill, forKey: "bill_amount")
        
        let secondsAppEnd = NSDate().timeIntervalSince1970
        defaults.setDouble(secondsAppEnd, forKey: "seconds_app_end")
        
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
}

