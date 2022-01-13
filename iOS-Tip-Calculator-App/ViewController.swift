//
//  ViewController.swift
//  iOS-Tip-Calculator-App
//
//  Created by Bryan Santos on 12/22/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var background: UIView!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        
        self.title = "Tip Calculator"
        background.backgroundColor = .systemGray4
    
        billAmountTextField.keyboardType = .numberPad
        billAmountTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let intValue = defaults.double(forKey: "myInt")
        let boolValue = defaults.bool(forKey: "myBool")
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = bill * (intValue / 100)
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        if (intValue == 15) {
            tipControl.selectedSegmentIndex = 0
        } else if (intValue == 18) {
            tipControl.selectedSegmentIndex = 1
        } else if (intValue == 20) {
            tipControl.selectedSegmentIndex = 2
        } else {
            tipControl.selectedSegmentIndex = UISegmentedControl.noSegment
        }
        
        
        if (boolValue) {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
        print("\(intValue)")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }

    @IBAction func calculateTip(_ sender: Any) {
//        Get bill amount from textfield input
        let bill = Double(billAmountTextField.text!) ?? 0
        
//        Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let defaults = UserDefaults.standard
        
//        Update Tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
//        Update Total amount label
        totalLabel.text = String(format: "$%.2f", total)
        
        defaults.set(tip, forKey: "myInt")
        defaults.synchronize()
        
    }
    
}

