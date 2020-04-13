//
//  DuringMeditationViewController.swift
//  Mini Challenge 1 - 11
//
//  Created by Vincentius Calvin on 08/04/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit

class DuringMeditationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var finishedLabel: UILabel!
    @IBOutlet weak var endSessionButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return durationPickerNumbers[component].count
    }
    
    
    var durationPickerNumbers: [[Int]] = [[],[]]
    var meditationDuration: [Int] = [0,0] {
        didSet {
            let totalDuration: String = String(format: "%02i:%02i", meditationDuration[0], meditationDuration[1])
            timerLabel.text = totalDuration
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return durationPickerNumbers.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%02i", durationPickerNumbers[component][row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        meditationDuration[component] = row
    }
    
    func durationPickerSetUp() {
        
        for i in 0...59 {
            durationPickerNumbers[0].append(i)
            durationPickerNumbers[1].append(i)
        }
    }
    
    func durationPickerDefaults() {
        for durations in 1..<meditationDuration.count {
            durationPicker.selectRow(meditationDuration[durations], inComponent: durations, animated: false)
        }
    }

    let shapeLayer = CAShapeLayer()
    
    //let timerLabel = UILabel()
    let timerLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 67)
        label.textAlignment = .center
        //label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        //label.layer.cornerRadius = 17
        return label
    }()
    
    let durationPicker: UIPickerView = UIPickerView()
    
    var pulsatingLayer: CAShapeLayer!
    
    var timer = Timer()
    var counter = Double()
    
    @IBOutlet weak var centerView: UIView!
    
    
    fileprivate func timerCompleteSetup() {
        //let center = view.center
        
        
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 150, startAngle: 0, endAngle: 2 *
            CGFloat.pi, clockwise: true)
        
        pulsatingLayer = CAShapeLayer()
        pulsatingLayer.path = circularPath.cgPath
        //pulsatingLayer.strokeColor = CGColor(srgbRed: 173/255, green: 177/255, blue: 168/255, alpha: 1)
        
        pulsatingLayer.lineWidth = 30
        pulsatingLayer.fillColor = CGColor(srgbRed: 109/255, green: 150/255, blue: 119/255, alpha: 1)
        
        pulsatingLayer.lineCap = CAShapeLayerLineCap.round
        //trackLayer.strokeEnd = 0
        pulsatingLayer.position = centerView.center
        
        view.layer.addSublayer(pulsatingLayer)
        
        let trackLayer = CAShapeLayer()
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = CGColor(srgbRed: 173/255, green: 177/255, blue: 168/255, alpha: 1)
        
        trackLayer.lineWidth = 20
        trackLayer.fillColor = CGColor(srgbRed: 220/255, green: 223/255, blue: 211/255, alpha: 1)
        trackLayer.lineCap = CAShapeLayerLineCap.round
        //trackLayer.strokeEnd = 0
        trackLayer.position = centerView.center
        view.layer.addSublayer(trackLayer)
        
        
        
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = CGColor(srgbRed: 52/255, green: 93/255, blue: 67/255, alpha: 1)
        
        shapeLayer.lineWidth = 20
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeEnd = 0
        shapeLayer.position = centerView.center
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
        view.layer.addSublayer(shapeLayer)
        
        view.addSubview(timerLabel)
        timerLabel.frame = CGRect(x: 0, y: 140, width: 200, height: 200)
        timerLabel.center = centerView.center
        
        
        whenTapped()
        //view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(whenTapped)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopButton.isHidden = true
        endSessionButton.isHidden = true
        finishedLabel.isHidden = true
        endSessionButton.layer.cornerRadius = 20
        startButton.layer.cornerRadius = 20
        stopButton.layer.cornerRadius = 20
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 150, startAngle: 0, endAngle: 2 *
            CGFloat.pi, clockwise: true)
        let firstLayer = CAShapeLayer()
        firstLayer.path = circularPath.cgPath
        //pulsatingLayer.strokeColor = CGColor(srgbRed: 173/255, green: 177/255, blue: 168/255, alpha: 1)
        
        firstLayer.lineWidth = 20
        firstLayer.fillColor = UIColor.clear.cgColor
        firstLayer.strokeColor = CGColor(srgbRed: 173/255, green: 177/255, blue: 168/255, alpha: 1)
        firstLayer.lineCap = CAShapeLayerLineCap.round
        //trackLayer.strokeEnd = 0
        firstLayer.position = centerView.center
        view.layer.addSublayer(firstLayer)
        
        view.addSubview(durationPicker)
        //durationPicker.layer.borderWidth = 10
        durationPicker.delegate = self
        durationPicker.dataSource = self
        durationPickerSetUp()
        durationPickerDefaults()
        //durationPicker.layer.position = centerView.center
        durationPicker.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        durationPicker.center = centerView.center
        
    
        // Do any additional setup after loading the view.
    }
    
    //MARK: WHEN BUTTON IS PRESSED
    
    @IBAction func startPressed(_ sender: Any) {
        startButton.isHidden = true
        //startButton.isEnabled = false
        durationPicker.isHidden = true
        stopButton.isHidden = false
        timerCompleteSetup()
    }
    
    
    @IBAction func stopPressed(_ sender: Any) {
        timer.invalidate()
        shapeLayer.removeAllAnimations()
        pulsatingLayer.removeAllAnimations()
        //segue
    }
    
    func getDate() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "cccc"
        let date = dateFormatter.string(from: currentDate)
        
        return date
    }
    
    @IBAction func endSessionPressed(_ sender: Any) {
        //segue
        //pass the minutes data
        //self.navigationController!.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        
        sesi += 1
        min = meditationDuration[0]
        let day = getDate()
        switch day {
            case "Monday":
                minSum[0] += min
                break
            case "Tuesday":
                minSum[1] += min
                break
            case "Wednesday":
                minSum[2] += min
                break
            case "Thursday":
                minSum[3] += min
                break
            case "Friday":
                minSum[4] += min
                break
            case "Saturday":
                minSum[5] += min
                break
            case "Sunday":
                minSum[6] += min
                break
            default:
                break
        }
        defaults.set(sesi, forKey: "savedSessions")
        defaults.set(minSum, forKey: "savedMinutes")
        
    }
    
    //MARK: ANIMATION
    private func animatingPulsingLayer(){
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1.3
        animation.duration = 0.8
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        pulsatingLayer.add(animation, forKey: "pulse")
    }
    
    @objc private func whenTapped(){
        
        print("test")
        animatingPulsingLayer()
        startTimer()
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = Double(meditationDuration[0]*60 + meditationDuration[1])
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }

    //MARK: TIMER
    func startTimer() {
        counter = Double(meditationDuration[0]*60 + meditationDuration[1])
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        
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
        
        timerLabel.text = "\(minuteString):\(secondString)"
        
        if counter <= 0 {
            timer.invalidate()
            timerLabel.text = "00:00"
            stopButton.isHidden = true
            endSessionButton.isHidden = false
            finishedLabel.isHidden = false
            
        }
    }
    
}
