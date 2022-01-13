//
//  SettingsViewController.swift
//  iOS-Tip-Calculator-App
//
//  Created by Bryan Santos on 1/12/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var background: UIView!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var lightSwitch: UISwitch!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var partySizeCounter: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        background.backgroundColor = .systemGray4
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let intValue = defaults.double(forKey: "myInt")
        let boolValue = defaults.bool(forKey: "myBool")
        let counterValue = defaults.integer(forKey: "myCounter")
        
        tipSlider.value = Float(intValue)
        tipPercentage.text = "\(Int(intValue))%"
        
        partySizeCounter.value = Double(counterValue)
        partySizeLabel.text = "\(counterValue)"
        
        
        
        
        if (boolValue) {
            lightSwitch.setOn(true, animated: true)
            overrideUserInterfaceStyle = .dark
        } else {
            lightSwitch.setOn(false, animated: false)
            overrideUserInterfaceStyle = .light
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        let defaults = UserDefaults.standard
        
        tipPercentage.text = "\(currentValue)%"
        defaults.set(Double(currentValue), forKey: "myInt")
        defaults.synchronize()
    }
    
    
    @IBAction func lightSwitchOn(_ sender: UISwitch) {
        let defaults = UserDefaults.standard
        
        if (sender.isOn) {
            overrideUserInterfaceStyle = .dark
            defaults.set(sender.isOn, forKey: "myBool")
        } else {
            overrideUserInterfaceStyle = .light
            defaults.set(sender.isOn, forKey: "myBool")
        }
        
        defaults.synchronize()
    }
    
    @IBAction func changeCounter(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        let defaults = UserDefaults.standard
        
        partySizeLabel.text = String(currentValue)
        
        defaults.set(currentValue, forKey: "myCounter")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
