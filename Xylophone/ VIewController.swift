//
//  ViewController.swift
//  Xylophone
//
//  Skeleton Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//
//  Guts filled in by Xi Xia on January 2018

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    // Grab the path, make sure to add it to your project!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        var buttonPressedTag: Int = sender.tag
        let note1Url =  Bundle.main.url(forResource: "note\(buttonPressedTag)", withExtension: "wav")!
        
        do {
            player = try AVAudioPlayer(contentsOf: note1Url)
            guard let player = player else {return}
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
        
    }
    
}

