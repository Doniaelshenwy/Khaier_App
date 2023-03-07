//
//  NotificationViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 15/02/2023.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var notificationTableView: UITableView!
    
    var notificationArray: [Notification] = []
    let headerTitle = ["اليوم", "الاسبوع الماضي", "الاتنين 2 فبراير 2023"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        setDataOfNotificationArray()
        setNotificationTableView()
        isTabBarHidden(false)
    }
    
    func setDataOfNotificationArray() {
        
        notificationArray = [
        Notification(image: "alarm", time: "10", description: "نذكرك بموعد وصول المندوب غدا لاستلام تبرعك", title: "تنبيه"),
        Notification(image: "charityN", time: "3", description: " تم اضافة حالة جديدة ساهم بالتبرع لحالة عاجلة في جمعية الاحسان ", title: "جمعية الامل")

        ]
    }


}

extension NotificationViewController: TableViewConfig {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitle.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 21
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.identifierCell) as! NotificationTableViewCell
        cell.setNotificationData(notification: notificationArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitle[section]
    }
    
    func setNotificationTableView(){
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        notificationTableView.registerCellNib(cellClass: NotificationTableViewCell.self)
    }
    
    
}
