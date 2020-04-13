//
//  ProfileViewController.swift
//  Mini Challenge 1 - 11
//
//  Created by Vincentius Calvin on 08/04/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var progressTableView: UITableView!
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var profileName: UILabel!
        
    let weeklyProgress = [
        WeeklyProgress(day: "Monday", time: "0"),
        WeeklyProgress(day: "Tuesday", time: "0"),
        WeeklyProgress(day: "Wednesday", time: "0"),
        WeeklyProgress(day: "Thursday", time: "0"),
        WeeklyProgress(day: "Friday", time: "0"),
        WeeklyProgress(day: "Saturday", time: "0"),
        WeeklyProgress(day: "Sunday", time: "0")
    ]
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Weekly Progress"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLabel = UILabel()
        myLabel.frame = CGRect(x:20, y:20, width: 320, height: 40)
        myLabel.font = UIFont.boldSystemFont(ofSize: 22.5)
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)

        let headerView = UIView()
        headerView.addSubview(myLabel)

        return headerView
    }
    
    
    func numberOfSections(in progressTableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ progressTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weeklyProgress.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath) as? ProgressCell {
        
            let progress = weeklyProgress[indexPath.row]

        // Configure the cell
            cell.progressDay.text = progress.day
            cell.progressTime.text = progress.time + " min"
            cell.backgroundColor = .clear
            return cell
        }
        return ProgressCell()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.profilePhoto.layer.borderWidth = 2
        //self.profilePhoto.layer.borderColor = CGColor(red: 52/255, green: 93/255, blue: 67/255, alpha: 1)
        self.profilePhoto.layer.borderColor = CGColor(srgbRed: 52/255, green: 93/255, blue: 67/255, alpha: 1)
        self.profilePhoto.layer.masksToBounds = false
        self.profilePhoto.layer.cornerRadius = self.profilePhoto.frame.size.width / 2
        self.profilePhoto.clipsToBounds = true
        //self.profilePhoto.layer.borderColor = UIColor.black.cgColor
//        progressTableView.isScrollEnabled = false
        //progressTableView.isUserInteractionEnabled = false
        
        progressTableView.delegate = self
        progressTableView.dataSource = self
        //progressTableView.backgroundColor = .clear
    }
    
    @IBAction func closeProfile(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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

