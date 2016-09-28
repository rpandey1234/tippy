//
//  ViewController.swift
//  tippy
//
//  Created by Rahul Pandey on 9/26/16.
//  Copyright © 2016 Rahul Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        people2Label.text = String(format: "$%.2f", total / 2)
        people3Label.text = String(format: "$%.2f", total / 3)
        people4Label.text = String(format: "$%.2f", total / 4)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultIndex = defaults.objectForKey("index_selected") as? Int ?? 0
        print("default index: ", defaultIndex)
        tipAmountSegmentedControl.selectedSegmentIndex = defaultIndex
        calculateTip(totalLabel)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        billField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
}

