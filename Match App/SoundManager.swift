//
//  SoundManager.swift
//  Match App
//
//  Created by Bhavika Patel on 8/23/19.
//  Copyright © 2019 Bhavika Patel. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        case flip
        case shuffle
        case match
        case nomatch
    }
    
    static func playSound(_ effect: SoundEffect) {
        // Determine which sound effect we want to play
        // And set the appropriate filename
        var soundFilename = ""
        
        switch effect {
        case .flip:
            soundFilename = "cardflip"
        case .shuffle:
            soundFilename = "shuffle"
        case .match:
            soundFilename = "dingcorrect"
        case .nomatch:
           soundFilename = "dingwrong"
        }
        
        // Get the path to the sound file inside the bundle
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Couldn't find sound file \(soundFilename)")
            return
        }
        
        // Create a URL object from this string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        // Create audio player object
       do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        
            // Play the sound
            audioPlayer?.play()
        
        } catch {
            // Couldn't create audio player object, log the error
            print("Couldn't create the audio player for the sound file \(soundFilename)")
        }
    }
    
}
