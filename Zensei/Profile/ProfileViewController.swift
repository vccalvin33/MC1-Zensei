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
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var sessionsLabel: UILabel!
    
    let defaults = UserDefaults.standard
    var minutesSum = 0
    var sessionsSum = 0
    var minutes = 0
    
    let weeklyProgress = [
        WeeklyProgress(day: "Monday", time: 0),
        WeeklyProgress(day: "Tuesday", time: 0),
        WeeklyProgress(day: "Wednesday", time: 0),
        WeeklyProgress(day: "Thursday", time: 0),
        WeeklyProgress(day: "Friday", time: 0),
        WeeklyProgress(day: "Saturday", time: 0),
        WeeklyProgress(day: "Sunday", time: 0)
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
    
    func getDate() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "cccc"
        let date = dateFormatter.string(from: currentDate)
        
        return date
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath) as? ProgressCell {
        
            var progress = weeklyProgress[indexPath.row]

        // Configure the cell
            let day = getDate()
            //dateChecker
            switch (day, progress.day) {
                case ("Monday", "Monday"):
                    progress.time = minutes
                    minutesSum += progress.time
                    break
                case ("Tuesday", "Tuesday"):
                    progress.time = minutes
                    minutesSum += progress.time
                    break
                case ("Wednesday", "Wednesday"):
                    progress.time = 4
                    minutesSum += progress.time
                    break
                case ("Thursday", "Thursday"):
                    progress.time = 5
                    minutesSum += progress.time
                    break
                case ("Friday", "Friday"):
                    progress.time = 6
                    minutesSum += progress.time
                    break
                case ("Saturday", "Saturday"):
                    progress.time = 7
                    minutesSum += progress.time
                    break
                case ("Sunday","Sunday"):
                    progress.time = 1
                    minutesSum += progress.time
                    break
                default:
                    break
            }
            
            //edit cell & label
            cell.progressDay.text = progress.day
            cell.progressTime.text = String(progress.time) + " min"
            minutesLabel.text = String(minutesSum)
            sessionsLabel.text = String(sessionsSum)
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
        
//        let sesiValue = defaults.integer(forKey: "sessionsSum")
//        sessionsSum += sesiValue
//
//        let minValue = defaults.integer(forKey: "minutes")
//        minutes += minValue
//        print(minValue)
//        print(sesiValue)
    }
    
    @IBAction func closeProfile(_ sender: Any) {
        dismiss(animated: true, completion: nil)
//        sessionsSum = 1
//        minutes = 1
//        print (sessionsSum)
//        defaults.set(sessionsSum, forKey: "sessionsSum")
//        defaults.set(minutes, forKey: "minutes")
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

