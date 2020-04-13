//
//  ViewController.swift
//  Mini Challenge 1
//
//  Created by Aldo Sugiarto on 09/04/20.
//  Copyright © 2020 Aldo Sugiarto. All rights reserved.
//

import UIKit
import AVFoundation


class SoundViewController: UIViewController{

    @IBOutlet weak var lblTimerMeditation: UILabel!
    @IBOutlet weak var btnStartTimer: UIButton!
    @IBOutlet weak var btnStopTimer: UIButton!
    @IBOutlet weak var txtFieldeditTimer: UITextField!
    
    
    var timer = Timer()
    var counter = 900.0
    var timeIsRunning = false
    var audio: AVAudioPlayer?
    let fileAudio = Bundle.main.path(forResource: "meditation-1", ofType: "mp3")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editTimer()
        dismiss()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnStartTimer(_ sender: Any) {
        switch timeIsRunning {
        case false:
            startTimer()
            timeIsRunning = true
            btnStartTimer.setBackgroundImage(UIImage(systemName: "pause.circle"), for: .normal)
        case true:
            pauseTimer()
            timeIsRunning = false
            btnStartTimer.setBackgroundImage(UIImage(systemName: "play.circle"), for: .normal)
        }
    }
    
    @IBAction func btnStopTimer(_ sender: Any) {
        stopTimer()
        stopMusic()
    }
    
    
    //  -------------------- FUNCTION FOR TIMER -----------------
    
    func startTimer() {
    timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        playMusic()
    }
    
    @objc func runTimer() {
        counter = counter - 0.1
        // MM:SS
        let flooredCounter = Int(floor(counter))

        let minute = (flooredCounter % 3600 ) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }

        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
        
        lblTimerMeditation.text = "\(minuteString):\(secondString)"
        
        if counter <= 0 {
            timer.invalidate()
        }
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        timer.invalidate()
        lblTimerMeditation.text = "00:00"
        btnStartTimer.isEnabled = false
        
    }
    
    // -------------------- FUNCTION PLAY AUDIO -----------------
    
    func playMusic() {
        if counter >= 0 {
            let url = URL(fileURLWithPath: fileAudio)
        
        do {
            audio = try AVAudioPlayer(contentsOf: url)
            audio!.play()
        }
        catch {
            print("error")
        }
    }
        else {
            audio?.stop()
        }
    }
    
    func stopMusic() {
        audio?.stop()
    }
    
    //  -------------------- FUNCTION TO EDIT TIMER -----------------

    func editTimer() {
        let editTimer = UITapGestureRecognizer(target: self, action: #selector(timerTapped))
        lblTimerMeditation.isUserInteractionEnabled = true
        lblTimerMeditation.addGestureRecognizer(editTimer)
    }
    
    @objc func timerTapped(_ sender: UITapGestureRecognizer) {
            timerFirstResponder()
        }
        
        func timerFirstResponder() {
            txtFieldeditTimer.becomeFirstResponder()
            txtFieldeditTimer.alpha = 1
            txtFieldeditTimer.text = ""
        }
    
    @IBAction func didEditTimer(_ sender: UITextField) {
        txtFieldeditTimer.alpha = 0
        let timerEdited = txtFieldeditTimer.text
        
        if timerEdited?.isEmpty == true {
            dismissKeyboard()
        }
        else {
            lblTimerMeditation.text = timerEdited
            counter = Double(timerEdited!)! * 60
            
            let flooredCounter = Int(floor(counter))

            let minute = (flooredCounter % 3600 ) / 60
            var minuteString = "\(minute)"
            if minute < 10 {
                minuteString = "0\(minute)"
            }

            let second = (flooredCounter % 3600) % 60
            var secondString = "\(second)"
            if second < 10 {
                secondString = "0\(second)"
            }
            
            lblTimerMeditation.text = "\(minuteString):\(secondString)"
        }
        
        
    }
    
    
    // -------------------- FUNCTION DISMISS KEYBOARD -----------------
    
    func dismiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    
}

