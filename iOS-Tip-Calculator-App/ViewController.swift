//
//  ViewController.swift
//  iOS-Tip-Calculator-App
//
//  Created by Bryan Santos on 12/22/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
//        Get bill amount from textfield input
        let bill = Double(billAmountTextField.text!) ?? 0
        
//        Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
//        Update Tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
//        Update Total amount label
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

