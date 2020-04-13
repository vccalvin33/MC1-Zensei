//
//  ViewController.swift
//  MC1Draft
//
//  Created by Aghawidya Adipatria on 06/04/20.
//  Copyright © 2020 Aghawidya Adipatria. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: VIEW COMPONENTS
    let mediaHolder: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    let imageHolder: UIImageView = {
        let image = UIImageView()
        //image.image = UIImage(systemName: "camera.on.rectangle.fill")
        image.layer.cornerRadius = 10
        image.image = UIImage(named: "meditation-beach")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    let detailTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .gray
            //UIColor(red: 178, green: 205, blue: 207, alpha: 1)
        return table
    }()
    
    let musicField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 18)
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(red: 234/255, green: 236/255, blue: 231/255, alpha: 1)
        textField.layer.cornerRadius = 17
        return textField
    }()
    
    let musicPicker: UIPickerView = UIPickerView()
    
    let durationField: UITextField = {
        let textField = UITextField()
        textField.text = "05:00"
        textField.font = .boldSystemFont(ofSize: 20)
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(red: 234/255, green: 236/255, blue: 231/255, alpha: 1)
        textField.layer.cornerRadius = 17
        return textField
    }()
    
    let durationPicker: UIPickerView = UIPickerView()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("START MEDITATING", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 22)
        button.backgroundColor = UIColor(red: 52/255, green: 93/255, blue: 67/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(startMeditation), for: .touchUpInside)
        return button
    }()
    
    let pickerToolbar: UIToolbar = {
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(endEditing))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([space,button], animated: true)
        toolbar.isUserInteractionEnabled = true
        return toolbar
    }()
    
    var constraintLandscape: [NSLayoutConstraint] = []
    var constraintPortrait: [NSLayoutConstraint] = []
    
    // MARK: CONTENT PROPERTIES
    let elementsHeight: CGFloat = 40.0
    
    var dataDetail: Meditation? {
        didSet {
            meditationName = dataDetail?.title
            meditationImage = UIImage(named: dataDetail?.icon ?? "")
            
            let unparsedDetail = dataDetail?.detail
            if let numberOfDetail = unparsedDetail?.count, numberOfDetail > 0 {
                var transferredDetail = [DetailContent]()
                for index in 0..<numberOfDetail {
                    if unparsedDetail?[index].title == "Instruction" {
                        transferredDetail.append(DetailContent(title: unparsedDetail?[index].title ?? "Description", content: unparsedDetail?[index].desc ?? ["This is a meditation"], isNumbered: true))
                    } else {
                        transferredDetail.append(DetailContent(title: unparsedDetail?[index].title ?? "Description", content: unparsedDetail?[index].desc ?? ["This is a meditation"]))
                    }
                }
                detailContentList = transferredDetail
            }
        }
    }
    
    var detailList = [DetailContent]()
    var detailContentList = [
        DetailContent(title: "Description", content: ["This is just a regular description."]),
        DetailContent(title: "Preparation", content: ["This is step 1","This is step 2", "This is step 3", "This is a very long step 4, even longer than all the previous steps combined, not because it's important or anything, just long for the sake of being long."], isNumbered: true),
        DetailContent(title: "Another Preparation (but unnumbered)", content: ["This is step 1","This is step 2", "This is a very long step 4, even longer than all the previous steps combined, not because it's important or anything, just long for the sake of being long. Did you notice me skipping step 3? longgggggggggggggggggg This is a very long step 4, even longer than all the previous steps combined, not because it's important or anything, just long for the sake of being long. Did you notice me skipping step 3?"])
        ] {
        didSet {
            detailList = detailContentList
        }
    }
    
    let playlistList = ["Playlist 1", "Playlist 2", "Playlist 3", "Playlist 4", "Playlist 5"]
    var currentPlaylist: String = "" {
        didSet {
            musicField.text = currentPlaylist
        }
    }
    
    var meditationName: String? {
        didSet {
            self.title = meditationName
        }
    }
    
    var meditationImage: UIImage? {
        didSet {
            imageHolder.image = meditationImage
        }
    }
    
    var meditationVideo: URL? {
        didSet {
            imageHolder.image = nil
            //something to change to video
        }
    }
    
    var durationPickerNumbers: [[Int]] = [[],[],[]]
    var meditationDuration: [Int] = [0,5,0] {
        didSet {
            var totalDuration: String = ""
            if meditationDuration[0] > 0 {
                totalDuration = String(format: "%i:%02i:%02i", meditationDuration[0], meditationDuration[1], meditationDuration[2])
            } else {
                totalDuration = String(format: "%02i:%02i", meditationDuration[1], meditationDuration[2])
            }
            durationField.text = "\(totalDuration)"
        }
    }
    
    // MARK: INITIALISATION
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mediaHolder)
        mediaHolder.addSubview(imageHolder)
        view.addSubview(detailTable)
        //view.addSubview(musicField)
        //view.addSubview(durationField)
        view.addSubview(startButton)
        
        //view.sendSubviewToBack(mediaHolder)
        
        imageHolder.contentMode = .scaleToFill
        //imageHolder.contentMode = .scaleAspectFill
        
        detailTable.delegate = self
        detailTable.dataSource = self
        detailTable.register(DetailHeaderCell.self, forCellReuseIdentifier: "detailHeaderCell")
        detailTable.register(DetailCell.self, forCellReuseIdentifier: "detailCell")
        detailTable.register(DetailNumberedCell.self, forCellReuseIdentifier: "detailNumberedCell")
        detailTable.separatorStyle = .none

        //musicPicker.delegate = self
        //musicPicker.dataSource = self
        //musicField.inputView = musicPicker
        //musicField.inputAccessoryView = pickerToolbar
        
        //durationPicker.delegate = self
        //durationPicker.dataSource = self
        //durationPickerSetUp()
        //durationPickerDefaults()
        //durationField.inputView = durationPicker
        //durationField.inputAccessoryView = pickerToolbar
        
        //(De)Activate below for keyboard adjustments
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        detailTable.backgroundColor = .clear
        //tartButton.backgroundColor = UIColor(red: 220/255, green: 223/255, blue: 211/255, alpha: 1)
        imageHolder.layer.cornerRadius = 10
        
        detailList = detailContentList
        currentPlaylist = playlistList[0]
        //meditationVideo = URL(fileURLWithPath: Bundle.main.path(forResource: "Roundabout", ofType: "mp4") ?? "")
        
        setUpConstraints()
        
        // THE FOLLOWING ADDS BORDERS TO THE COMPONENTS TO SHOW THEIR BOUNDARIES, REMOVE AFTER DESIGNING THE COMPONENTS
        temporaryBorders()
    }
    
    
        
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if UIDevice.current.orientation.isLandscape {
            NSLayoutConstraint.deactivate(constraintPortrait)
            NSLayoutConstraint.activate(constraintLandscape)
        } else {
            NSLayoutConstraint.deactivate(constraintLandscape)
            NSLayoutConstraint.activate(constraintPortrait)
        }
    }
    
    // MARK: LAYOUT ARRANGEMENTS
    func setUpConstraints() {
        constraintPortrait = [
            mediaHolder.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            mediaHolder.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mediaHolder.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            mediaHolder.heightAnchor.constraint(equalToConstant: 200),
            
            detailTable.topAnchor.constraint(equalTo: mediaHolder.bottomAnchor, constant: 36),
            detailTable.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            detailTable.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            //detailTable.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ]
        
        constraintLandscape = [
            detailTable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            detailTable.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor, constant: 6),
            detailTable.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            mediaHolder.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            mediaHolder.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mediaHolder.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor, constant: -6),
            mediaHolder.heightAnchor.constraint(equalTo: detailTable.heightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraintPortrait)
        NSLayoutConstraint.activate([
            imageHolder.centerXAnchor.constraint(equalTo: mediaHolder.centerXAnchor),
            imageHolder.centerYAnchor.constraint(equalTo: mediaHolder.centerYAnchor),
            imageHolder.heightAnchor.constraint(lessThanOrEqualTo: imageHolder.superview?.heightAnchor ?? mediaHolder.heightAnchor),
            imageHolder.widthAnchor.constraint(lessThanOrEqualTo: imageHolder.superview?.widthAnchor ?? mediaHolder.widthAnchor),
            
            //musicField.topAnchor.constraint(equalTo: detailTable.bottomAnchor, constant: 36),
            //musicField.heightAnchor.constraint(equalToConstant: elementsHeight),
            //musicField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            //musicField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            //durationField.topAnchor.constraint(equalTo: musicField.bottomAnchor, constant: 12),
            //durationField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            //durationField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            //durationField.heightAnchor.constraint(equalToConstant: elementsHeight),
            
            detailTable.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -24),
            //startButton.topAnchor.constraint(equalTo: durationField.bottomAnchor, constant: 12),
            startButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            startButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            startButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func temporaryBorders() {
        //mediaHolder.layer.borderWidth = 0.5
        //imageHolder.layer.borderWidth = 0.5
        //detailTable.layer.borderWidth = 0.5
        //musicField.layer.borderWidth = 0.5
        //durationField.layer.borderWidth = 0.5
        startButton.layer.borderWidth = 0.5
    }

    // MARK: TABLEVIEW SETUP
    func numberOfSections(in tableView: UITableView) -> Int {
        return detailList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailList[section].content.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataForSection = detailList[indexPath.section]
        if indexPath.row == 0 {
            if let cell = detailTable.dequeueReusableCell(withIdentifier: "detailHeaderCell", for: indexPath) as? DetailHeaderCell {
                cell.title = dataForSection.title
                cell.expandDescription = {
                    if cell.isExpanded {
                        self.detailList[indexPath.section].content = []
                    } else {
                        self.detailList[indexPath.section].content = self.detailContentList[indexPath.section].content
                    }
                    self.detailTable.reloadData()
                }
                cell.backgroundColor = .clear
                return cell
            }
        } else {
            if dataForSection.isNumbered == true {
                if let cell = detailTable.dequeueReusableCell(withIdentifier: "detailNumberedCell", for: indexPath) as? DetailNumberedCell {
                    cell.content = dataForSection.content[indexPath.row - 1]
                    cell.number = indexPath.row
                    cell.backgroundColor = .clear
                    return cell
                }
            } else {
                if let cell = detailTable.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? DetailCell {
                    cell.content = dataForSection.content[indexPath.row - 1]
                    cell.backgroundColor = .clear
                    return cell
                }
            }
        }
        
        return DetailCell()
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerSpacing = UIView()
        footerSpacing.backgroundColor = .clear
        return footerSpacing
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section < detailList.count {
            return 16.0
        }
        return .leastNormalMagnitude
    }
    
    // MARK: PICKERVIEW SETUP
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == musicPicker {
            return 1
        } else if pickerView == durationPicker {
            return durationPickerNumbers.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == musicPicker {
            return playlistList.count
        } else if pickerView == durationPicker {
            return durationPickerNumbers[component].count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == musicPicker {
            return playlistList[row]
        } else if pickerView == durationPicker {
            return String(format: "%02i", durationPickerNumbers[component][row])
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == musicPicker {
            currentPlaylist = playlistList[row]
        } else if pickerView == durationPicker {
            meditationDuration[component] = row
        }
    }
    
    func durationPickerSetUp() {
        for i in 0...23 {
            durationPickerNumbers[0].append(i)
        }
        
        for i in 0...59 {
            durationPickerNumbers[1].append(i)
            durationPickerNumbers[2].append(i)
        }
    }
    
    func durationPickerDefaults() {
        for durations in 1..<meditationDuration.count {
            durationPicker.selectRow(meditationDuration[durations], inComponent: durations, animated: false)
        }
    }
    
    // MARK: TEMPORARY POPUP VIDEO PLAYER
    @IBAction func playVideo(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "Roundabout", ofType: "mp4") {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true) {
                video.play()
            }
        }
    }
    
    // MARK: METHODS
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        /*let screenMovement = durationPicker.bounds.height
        if self.view.frame.origin.y == 0 {
              self.view.frame.origin.y -= screenMovement
        }*/
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func startMeditation() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "duringMeditationViewController") as! DuringMeditationViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

