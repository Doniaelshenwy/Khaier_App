//
//  ReminderTableViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 14/03/2023.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {
    
    static let identifierCell = "ReminderTableViewCell"

    @IBOutlet weak var donateDayLabel: UILabel!
    @IBOutlet weak var donateDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setDataOfReminder(reminder: Reminder) {
        donateDayLabel.text = reminder.address
        donateDateLabel.text = "\(reminder.date), \(reminder.time)"
        }
    
}
