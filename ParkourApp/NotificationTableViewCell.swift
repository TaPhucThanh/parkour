//
//  NotificationTableViewCell.swift
//  ParkourApp
//
//  Created by FOEIT on 29/07/2017.
//  Copyright © 2017 T. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var notificationLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
