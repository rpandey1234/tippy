//
//  SettingsViewController.swift
//  tippy
//
//  Created by Rahul Pandey on 9/26/16.
//  Copyright © 2016 Rahul Pandey. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func defaultTipChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let indexSelected = defaultTipControl.selectedSegmentIndex
        print("index selected ", indexSelected)
        defaults.setInteger(indexSelected, forKey: "index_selected")
        defaults.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultIndex = defaults.objectForKey("index_selected") as? Int ?? 0
        defaultTipControl.selectedSegmentIndex = defaultIndex
    }
}
