//
//  ViewController.swift
//  metronome
//
//  Created by Brandon Li on 12/14/18.
//  Copyright © 2018 Brandon Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bpmLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    var metronome = Metronome()
    var bpm:Int {
        get {
            return Int(slider.value)
        }
        set{
            slider.value = Float(newValue)
            bpmLabel.text = "\(bpm)"
            metronome.bpm = bpm
        }
    }
    @IBAction func changeBpm(_ sender: UISlider) {
        bpmLabel.text = "\(bpm)"
    }
    @IBAction func addBpm(_ sender: UIButton) {
        bpm += 1
    }
    
    @IBAction func subtractBpm(_ sender: UIButton) {
        bpm -= 1
    }
}

