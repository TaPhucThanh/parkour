//
//  TutorialsTableViewController.swift
//  ParkourApp
//
//  Created by FOEIT on 24/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit

class TutorialsTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var tutorials = [Tutorial]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.contentInset = UIEdgeInsets(top: 0,left: 0,bottom: 50,right: 0)
        
        // Load the set of tutorials list.
        loadTutorials() 

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        /*let filePath = NSBundle.mainBundle().pathForResource("precisionjumps", ofType: "gif")
        let gif = NSData(contentsOfFile: filePath!)
        
        let request = NSURLRequest(URL: filePath!);
        webView.loadRequest(request);*/
        
    }
    
    func loadTutorials() {
        let pkimage1 = UIImage(named: "360diveroll")!
        let tutorial1 = Tutorial(title: "360 Dive Roll", desc: "A dive roll by twisting your body 360 degree.", pkimage: pkimage1)!
        
        let pkimage2 = UIImage(named: "backflip")!
        let tutorial2 = Tutorial(title: "Backflip", desc: "A flip tucked rotating backward around the y-axis.", pkimage: pkimage2)!
        
        let pkimage3 = UIImage(named: "dashvault")!
        let tutorial3 = Tutorial(title: "Dash Vault", desc: "A vault where the practitioner jumps over the obstacle with both feet extended forward and pushes off with both hands as they travel over the obstacle.", pkimage: pkimage3)!
        
        let pkimage4 = UIImage.gifImageWithName("doublecorkscrew")!
        let imageView4 = UIImageView(image: pkimage4)
        imageView4.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
        let tutorial4 = Tutorial(title: "Double Corkscrew", desc: "A 360 degree corkscrew, similar to a b-twist, as the body rotates while staying horizontal, although the takeoff more closely resembles a J-step gainer.", pkimage: pkimage4)!
        
        let pkimage5 = UIImage(named: "doublekongvault")!
        let tutorial5 = Tutorial(title: "Double Kong Vault", desc: "A Kong Vault into a dive to a consecutive Kong.", pkimage: pkimage5)!
        
        let pkimage6 = UIImage.gifImageWithName("layoutbackflip")!
        let imageView6 = UIImageView(image: pkimage6)
        imageView6.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
        let tutorial6 = Tutorial(title: "Layout Backflip", desc: "Spreading the body (laying-it-out) while in the mid air doing a backflip.", pkimage: pkimage6)!
        
        let pkimage7 = UIImage(named: "lazyvault")!
        let tutorial7 = Tutorial(title: "Lazy Vault", desc: "A vault where the hand closest to the wall pushes off immediately followed by the leg on the same side. When both legs are over, the opposite hand helps push away.", pkimage: pkimage7)!
        
        let pkimage8 = UIImage.gifImageWithName("planche")!
        let imageView8 = UIImageView(image: pkimage8)
        imageView8.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
        let tutorial8 = Tutorial(title: "Planche", desc: "A position in which the entire body is supported on the arms and held horizontally.", pkimage: pkimage8)!
        
        let pkimage9 = UIImage.gifImageWithName("precisionjumps")!
        let imageView9 = UIImageView(image: pkimage9)
        imageView9.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
        let tutorial9 = Tutorial(title: "Precision Jumps", desc: "Accurately move from one obstacle to another.", pkimage: pkimage9)!
        
        let pkimage10 = UIImage.gifImageWithName("reversevault")!
        let imageView10 = UIImageView(image: pkimage10)
        imageView10.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
        let tutorial10 = Tutorial(title: "Reverse Vault", desc: "A Reverse Vault, 360º Vault or Barrel Vault, is a vault used in Parkour and freerunning in which the traceur/freerunner rotates 360º in mid air over an obstacle.", pkimage: pkimage10)!
        
        let pkimage11 = UIImage.gifImageWithName("sideflip")!
        let imageView11 = UIImageView(image: pkimage11)
        imageView11.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
        let tutorial11 = Tutorial(title: "Sideflip", desc: "A flip tucked sideways rotating around the z-axis.", pkimage: pkimage11)!
        
        let pkimage12 = UIImage(named: "speedvault")!
        let tutorial12 = Tutorial(title: "Speed Vault", desc: "A one-hand vault where the opposite-side leg rises so the other leg can quickly step over the obstacle.", pkimage: pkimage12)!
        
        let pkimage13 = UIImage.gifImageWithName("supermanflip")!
        let imageView13 = UIImageView(image: pkimage13)
        imageView13.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
        let tutorial13 = Tutorial(title: "Superman Flip", desc: "Performing a Superman pose while in the mid air of doing a frontflip.", pkimage: pkimage13)!
        
        let pkimage14 = UIImage.gifImageWithName("tictac")!
        let imageView14 = UIImageView(image: pkimage14)
        imageView14.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
        let tutorial14 = Tutorial(title: "Tic Tac", desc: "Step off a wall to get more height for a move, or travel further forward.", pkimage: pkimage14)!
        
        let pkimage15 = UIImage(named: "wallflip")!
        let tutorial15 = Tutorial(title: "Wallflip", desc: "One step off a wall into a Backflip.", pkimage: pkimage15)!
        
        let pkimage16 = UIImage.gifImageWithName("underbarvault")!
        let imageView16 = UIImageView(image: pkimage16)
        imageView16.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
        let tutorial16 = Tutorial(title: "Underbar Vault", desc: "Swinging the body under a bar in a fluid manner.", pkimage: pkimage16)!
        
        let pkimage17 = UIImage.gifImageWithName("wallscaling")!
        let imageView17 = UIImageView(image: pkimage17)
        imageView17.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
        let tutorial17 = Tutorial(title: "Wall Scaling", desc: "It is used to get over a wall too high for a vault. In a vertical wallrun, the traceur runs straight up the wall. Scaling is for even higher walls.", pkimage: pkimage17)!
        
        tutorials += [tutorial1, tutorial2, tutorial3, tutorial4, tutorial5, tutorial6, tutorial7, tutorial8, tutorial9, tutorial10, tutorial11, tutorial12, tutorial13, tutorial14, tutorial15, tutorial16, tutorial17]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tutorials.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "TutorialTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TutorialTableViewCell
        
        // Fetches the appropriate tutorial for the data source layout.
        let tutorial = tutorials[indexPath.row]

        cell.titleLabel.text = tutorial.title
        cell.descriptionLabel.text = tutorial.desc
        cell.pkImage.image = tutorial.pkimage

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
