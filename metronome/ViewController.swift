//
//  ViewController.swift
//  metronome
//
//  Created by Brandon Li on 12/14/18.
//  Copyright © 2018 Brandon Li. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer = AVAudioPlayer()
    var timer = Timer()
    var state = "pause" {
        didSet {
            if state == "play" {
                playButton.setBackgroundImage(UIImage(named: "pauseButton.png"), for: UIControl.State.normal)
                timer.invalidate()
                timer = Timer.scheduledTimer(timeInterval: (pow((Double(bpm)/60.0), -1.0)), target: self, selector: #selector(playAudio), userInfo: nil, repeats: true)
            }
            else {
                playButton.setBackgroundImage(UIImage(named: "playButton.png"), for: UIControl.State.normal)
                timer.invalidate()

    
            }
           
        }
    }
    @IBOutlet weak var bpmLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    var bpm:Int {
        get {

            return Int(slider.value)
        }
        set{
            slider.value = Float(newValue)
            bpmLabel.text = "\(bpm)"

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sound = Bundle.main.path(forResource: "metronomeBeat", ofType: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch {
            print("error")
        }
    }
    @IBAction func changeBpm(_ sender: UISlider) {
        if state == "play" {
            state = "pause"
            state = "play"
        }
      
        bpmLabel.text = "\(bpm)"
      
    }
    @IBAction func addBpm(_ sender: UIButton) {
        if state == "play" {
            state = "pause"
            bpm += 1
            state = "play"
        }
        else {
            bpm += 1
        }
    }
    
    @IBAction func subtractBpm(_ sender: UIButton) {
        if state == "play" {
            state = "pause"
            bpm -= 1
            state = "play"
        }
        else {
            bpm -= 1
        }
    }
    @IBAction func play(_ sender: UIButton) {
        if state == "pause" {
            state = "play"
        }
        else {
            state = "pause"
        }

    }
    @objc func playAudio(){
        audioPlayer.play()
    }
}

