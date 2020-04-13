//
//  SoundPlayerViewController.swift
//  Zensei
//
//  Mini Challenge 1
//
//  Created by Aldo Sugiarto on 09/04/20.
//  Copyright © 2020 Aldo Sugiarto. All rights reserved.
//

import UIKit
import AVFoundation

class SoundPlayerViewController: UIViewController {
    
    @IBOutlet weak var labelSongTitle: UILabel!
    @IBOutlet weak var imgVinyl: UIImageView!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var imgCover: UIImageView!
    
    
    var audio = AVAudioPlayer()
    var hasBeenPaused = false
   
    
    var dataSound : Meditation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSongAndSession()
        labelSongTitle.text = dataSound.title
        imgCover.image = UIImage(named: dataSound.icon)
        play()
        btnAction.setBackgroundImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "Sound Player"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2039215686, green: 0.3647058824, blue: 0.3058823529, alpha: 1)
        if #available(iOS 13, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = #colorLiteral(red: 0.8891196251, green: 0.8976630569, blue: 0.8601869941, alpha: 1)
            appearance.titleTextAttributes =  [.foregroundColor:#colorLiteral(red: 0.2039215686, green: 0.3647058824, blue: 0.3058823529, alpha: 1) ]
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2039215686, green: 0.3647058824, blue: 0.3058823529, alpha: 1)
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.2039215686, green: 0.3647058824, blue: 0.3058823529, alpha: 1)]
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        audio.stop()
    }
    
    //MARK:-------------------- FUNCTION PLAY AUDIO -----------------
    
    func prepareSongAndSession() {
        
        do {
            
            let fileAudio = Bundle.main.path(forResource: dataSound.icon, ofType: "mp3")!
            audio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileAudio))
            audio.prepareToPlay()
            audio.numberOfLoops = 10
            let audioSession = AVAudioSession.sharedInstance()
            do {
                
                try audioSession.setCategory(AVAudioSession.Category.playback)
                
            } catch let sessionError {
                
                print(sessionError)
            }
            
        } catch let songPlayerError {
            print(songPlayerError)
        }
    }
    
    
    func play() {
        hasBeenPaused = false
        audio.play()
        
        rotateImage()
    }
    
    func pause() {
        if audio.isPlaying {
            audio.pause()
            hasBeenPaused = true
            stopRotate()
        }
    }
    
    func rotateImage() {
        let rotationAnimation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(value: .pi * 2.0)
        rotationAnimation.duration = 5
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = .infinity
        self.imgVinyl?.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    func stopRotate() {
        self.imgVinyl?.layer.removeAnimation(forKey: "rotationAnimation")
    }
    
    @IBAction func didTapBtnAction(_ sender: Any) {
        if hasBeenPaused {
            play()
            btnAction.setBackgroundImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        }else{
            btnAction.setBackgroundImage(UIImage(systemName: "play.circle.fill"), for: .normal)
            pause()
        }
    }

}
