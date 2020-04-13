//
//  ViewController.swift
//  Mini Challenge 1 - 11
//
//  Created by Vincentius Calvin on 02/04/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stressedButton: UIButton!
    @IBOutlet weak var anxiousButton: UIButton!
    @IBOutlet weak var tiredButton: UIButton!
    @IBOutlet weak var insomniaButton: UIButton!
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var boredButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //chooseLabel.font = UIFont(name: "guzuri_font_1nensei", size: 45)
        //stressedButton.titleLabel?.font = UIFont(name: "guzuri_font_1nensei", size: 30)
        stressedButton.layer.cornerRadius = 20
        //anxiousButton.titleLabel?.font = UIFont(name: "guzuri_font_1nensei", size: 30)
        anxiousButton.layer.cornerRadius = 20
        //tiredButton.titleLabel?.font = UIFont(name: "guzuri_font_1nensei", size: 30)
        tiredButton.layer.cornerRadius = 20
        //insomniaButton.titleLabel?.font = UIFont(name: "guzuri_font_1nensei", size: 30)
        insomniaButton.layer.cornerRadius = 20
        //boredButton.titleLabel?.font = UIFont(name: "guzuri_font_1nensei", size: 30)
        boredButton.layer.cornerRadius = 20
        //sadButton.titleLabel?.font = UIFont(name: "guzuri_font_1nensei", size: 30)
        sadButton.layer.cornerRadius = 20
    }


}

