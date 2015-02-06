//
//  ViewController.swift
//  Slider
//
//  Created by Kyle Samson on 2015-02-06.
//  Copyright (c) 2015 Kyle Samson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBAction func sliderChanged(sender: UISlider) {
        var sliderValue = lroundf(sender.value)
        sliderLabel.text = "\(sliderValue)"
    }
    @IBAction func toggle(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            sliderLabel.text = "On"
        }else{
            sliderLabel.text = "Off"
        }
    }
}

