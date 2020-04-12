//
//  stoppedMeditationViewController.swift
//  Mini Challenge 1 - 11
//
//  Created by Vincentius Calvin on 07/04/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit

class StoppedMeditationViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var stopinfoLabel: UILabel!
    @IBOutlet weak var restartSessionButton: UIButton!
    @IBOutlet weak var backToHomeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //stopinfoLabel.font = UIFont(name: "guzuri_font_1nensei", size: 40 )
        //timerLabel.font = UIFont(name: "guzuri_font_1nensei", size: 100)
        backToHomeButton.layer.cornerRadius = 20
        restartSessionButton.layer.cornerRadius = 20
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
