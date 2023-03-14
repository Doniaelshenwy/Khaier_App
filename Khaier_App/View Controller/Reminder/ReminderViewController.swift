//
//  ReminderViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 09/03/2023.
//

import UIKit

class ReminderViewController: UIViewController {

    @IBOutlet weak var reminderTableView: UITableView!
    
    var reminderArray: [Reminder] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        setReminderTableView()
        setDataOfReminderArray()
    }
    
    func setDataOfReminderArray() {
        reminderArray = [
        Reminder(address: "تبرع يوم الجمعة", date: "20 يناير 2023", time: "10:00 ص", reminderDay: "قبل 1 يوم ", repeatReminder: "كل اسبوع"),
        Reminder(address: "تبرع يوم الجمعة", date: "20 يناير 2023", time: "10:00 ص", reminderDay: "قبل 1 يوم ", repeatReminder: "كل اسبوع"),
        Reminder(address: "تبرع يوم الجمعة", date: "20 يناير 2023", time: "10:00 ص", reminderDay: "قبل 1 يوم ", repeatReminder: "كل اسبوع"),
        Reminder(address: "تبرع يوم الجمعة", date: "20 يناير 2023", time: "10:00 ص", reminderDay: "قبل 1 يوم ", repeatReminder: "كل اسبوع"),
        Reminder(address: "تبرع يوم الجمعة", date: "20 يناير 2023", time: "10:00 ص", reminderDay: "قبل 1 يوم ", repeatReminder: "كل اسبوع")
        ]
    }

    @IBAction func backToProfileVCButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
    
    @IBAction func addReminderButton(_ sender: Any) {
        print("sss")
        let vc = AddReminderViewController()
        push(vc: vc)
    }
    
}

extension ReminderViewController: TableViewConfig {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminderArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReminderTableViewCell.identifierCell) as! ReminderTableViewCell
        //cell.setDataOfReminder(reminder: reminderArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = EditReminderViewController()
        push(vc: vc)
    }

    func setReminderTableView() {
        reminderTableView.delegate = self
        reminderTableView.dataSource = self
        reminderTableView.registerCellNib(cellClass: ReminderTableViewCell.self)
    }

}
