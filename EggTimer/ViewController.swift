//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    /*let softTime = 5;
    let mediummTime = 7;
    let hardTime = 12;*/
    
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var secondsRemaining = 10
    
    @IBOutlet weak var label: UILabel!
    
    var totalTime = 0
    var secondsPassed = 0
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    
    override func viewDidLoad() {
       super.viewDidLoad()
        progressBar.progress = 0.0
    }
    

    @IBAction func eggPressed(_ sender: UIButton) {
        
        progressBar.progress = 0.0
        
        secondsPassed = 0
        
        timer.invalidate()
        
        print(" a => ", sender.titleLabel?.text)
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        label.text = hardness
                
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            
            print("seconds -> ", self.secondsPassed)
            print("totalTime -> ", self.totalTime)
            
            if self.secondsPassed < self.totalTime {
                
                self.secondsPassed += 1

                print("seconds inside -> ", self.secondsPassed)
                print("totalTime inside -> ", self.totalTime)
                
                let percentage = Float(self.secondsPassed) / Float(self.totalTime)
                
                print(percentage)
                
                self.progressBar.progress = percentage
                
            } else {
                timer.invalidate()
                self.label.text = "Time's Up!"
                self.playSound(type: "alarm_sound")
            }
        }
    }
    
    func playSound(type: String?) {
        let url = Bundle.main.url(forResource: type, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}
