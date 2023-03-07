//
//  NotificationTableViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 02/03/2023.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    static let identifierCell = "NotificationTableViewCell"

    @IBOutlet weak var imageNotification: UIImageView!
    @IBOutlet weak var timeNotification: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setNotificationData(notification: Notification) {
        imageNotification.image = UIImage(named: notification.image)
        timeNotification.text = "منذ \(notification.time) دقيقة"
        title.text = notification.title
        descriptionLabel.text = notification.description
    }
    
}
