//
//  SettingController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Amy Alsaydi on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class SettingController: UIViewController {
    
    @IBOutlet weak var sliderControl: UISlider!
    @IBOutlet weak var stepperControl: UIStepper!
    @IBOutlet weak var fontSize: UILabel!
    
    var font: Float = 20 { // how can i get it to remain the same font and not change back to 20
        didSet {
            fontSize.text = "Font Size: \(String(format: "%0.f", font))"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSlider()
        configuresStepper()
        fontSize.text = "Font Size: \(String(format: "%0.f", sliderControl.value))"
        
    }
    
    func configureSlider() {
           sliderControl.minimumValue = 5
           sliderControl.maximumValue = 35
        
        //default start value
           sliderControl.value = font
       }
    
    func configuresStepper() {
        stepperControl.minimumValue = 5
        stepperControl.maximumValue = 35
        stepperControl.stepValue = 1
        
        //default start value
        stepperControl.value = Double(font)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        font = sender.value
        stepperControl.value = Double(font)
        
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        let fontAsInt = sender.value
        font = Float(fontAsInt)
        sliderControl.value = font
        
    }
}
