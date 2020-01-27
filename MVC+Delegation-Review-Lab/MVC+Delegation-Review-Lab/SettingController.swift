//
//  SettingController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Amy Alsaydi on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

protocol SettingsVCDelegate: AnyObject {
    func didChangeFont(font: CGFloat)
}

class SettingController: UIViewController {
    
    @IBOutlet weak var sliderControl: UISlider!
    @IBOutlet weak var stepperControl: UIStepper!
    @IBOutlet weak var fontSize: UILabel!
    
    var font: CGFloat = 20.0 { // how can i get it to remain the same font and not change back to 20 // this needs to probably be an optional that is populated from the prepare for segue
        
        didSet {
            fontSize.text = "Font Size: \(String(format: "%0.f", font))"
        }
    }
    
    weak var delegate: SettingsVCDelegate?
    
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
           sliderControl.value = Float(font)
       }
    
    func configuresStepper() {
        stepperControl.minimumValue = 5
        stepperControl.maximumValue = 35
        stepperControl.stepValue = 1
        
        //default start value
        stepperControl.value = Double(font)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        font = CGFloat(sender.value)
        stepperControl.value = Double(font)
        delegate?.didChangeFont(font: font)
        
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        font = CGFloat(sender.value)
        sliderControl.value = Float(font)
        delegate?.didChangeFont(font: font)
    }
    
}
