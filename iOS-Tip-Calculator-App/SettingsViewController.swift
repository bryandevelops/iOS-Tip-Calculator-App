//
//  SettingsViewController.swift
//  iOS-Tip-Calculator-App
//
//  Created by Bryan Santos on 1/12/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
                
        tipPercentage.text = "\(currentValue)%"
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
