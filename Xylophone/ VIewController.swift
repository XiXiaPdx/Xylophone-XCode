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
    
    // last button touched
    var lastButtonTouched: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // The following action is for dragging finger across keys
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        
        let point: CGPoint = recognizer.location(in: self.view)

        if let button: UIButton = self.view.hitTest(point, with: nil) as? UIButton {
            let buttonPressedTag: Int = button.tag
            
            //check that touch is dragged onto a different button to play sound.
            if lastButtonTouched != buttonPressedTag{
                fadeButton(ofThisButton: button)
            playSound(ofButtonTagNumber: buttonPressedTag)
                lastButtonTouched = buttonPressedTag
            } else {
                unFadeButton(ofThisButton: button)
            }
        }
    }
    
    @IBAction func notePressed(_ sender: UIButton) {

        let buttonPressedTag: Int = sender.tag

        //when finger is dragged on initial key, this prevents the note from being played twice
        lastButtonTouched = buttonPressedTag
        fadeButton(ofThisButton: sender)
        playSound(ofButtonTagNumber: buttonPressedTag)
    }
    
    //This action is to detect touch up so button opacity is restored to full
    @IBAction func touchEnd(_ sender: UIButton) {
        unFadeButton(ofThisButton: sender)
    }
    
    //This function plays the sound of the button
    func playSound(ofButtonTagNumber buttonTag: Int){
        if let soundURL = Bundle.main.url(forResource: "note\(buttonTag)", withExtension: "wav") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            // Play
            AudioServicesPlaySystemSound(mySound)
        }
    }
    
    //This fades the button
    func fadeButton(ofThisButton button: UIButton){
        button.alpha=0.5
    }
    
    //this unFades the button
    func unFadeButton(ofThisButton button: UIButton){
        button.alpha=1.0
    }
}

