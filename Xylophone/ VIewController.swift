//
//  ViewController.swift
//  Xylophone
//
//  Skeleton Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//
//  Guts filled in by Xi Xia on January 2018

import UIKit
import AudioToolbox.AudioServices
// import AVFoundation


class ViewController: UIViewController{
    
    // Grab the path, make sure to add it to your project!
 
    // this is for solution using note1Url
//    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func notePressed(_ sender: UIButton) {

        let buttonPressedTag: Int = sender.tag
        playSound(ofButtonTagNumber: buttonPressedTag)

    }
    
    func playSound(ofButtonTagNumber buttonTag: Int){
        if let soundURL = Bundle.main.url(forResource: "note\(buttonTag)", withExtension: "wav") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            // Play
            AudioServicesPlaySystemSound(mySound)
        }
    }
    
}

