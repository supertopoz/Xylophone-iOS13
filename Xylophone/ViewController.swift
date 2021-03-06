//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        let key = sender.currentTitle!
        sender.alpha = 0.5
        playSound(key: key)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
           // Excecute after 3 seconds
            sender.alpha = 1
        }
    }
    
    func playSound(key: String? = "C") {
        let url = Bundle.main.url(forResource: key, withExtension: "wav")
   
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        } catch {
            print(error.localizedDescription)
            // couldn't load file :(
        }
        
    }
    
}
