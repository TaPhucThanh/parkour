//
//  TutorialTableViewCell.swift
//  ParkourApp
//
//  Created by FOEIT on 24/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit

class TutorialTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // get an instance of your cell
        let cell = tableView.dequeueReusableCellWithIdentifier("TutorialTableViewCell", forIndexPath: indexPath) as! TutorialTableViewCell
        
        // populate the data in your cell as desired
        cell.webViewGif.image = UIWebView(named: "precisionjumps.gif")
        
        return cell
    }*/

}
