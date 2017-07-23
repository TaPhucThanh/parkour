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
        
        let pkimage4 = UIImage(named: "doublekongvault")!
        let tutorial4 = Tutorial(title: "Double Kong Vault", desc: "A Kong Vault into a dive to a consecutive Kong.", pkimage: pkimage4)!
        
        let pkimage5 = UIImage(named: "lazyvault")!
        let tutorial5 = Tutorial(title: "Lazy Vault", desc: "A vault where the hand closest to the wall pushes off immediately followed by the leg on the same side. When both legs are over, the opposite hand helps push away.", pkimage: pkimage5)!
        
        let pkimage6 = UIImage(named: "precisionjump")!
        let tutorial6 = Tutorial(title: "Precision Jump", desc: "Any move that lands precisely on an object. Generally, Precision refers to a jump to precise landing.", pkimage: pkimage6)!
        
        let pkimage7 = UIImage(named: "sideflip")!
        let tutorial7 = Tutorial(title: "Sideflip", desc: "A flip tucked sideways rotating around the z-axis.", pkimage: pkimage7)!
        
        let pkimage8 = UIImage(named: "speedvault")!
        let tutorial8 = Tutorial(title: "Speed Vault", desc: "A one-hand vault where the opposite-side leg rises so the other leg can quickly step over the obstacle.", pkimage: pkimage8)!
        
        let pkimage9 = UIImage(named: "tictac")!
        let tutorial9 = Tutorial(title: "Tic Tac", desc: "Step off a wall to get more height for a move, or travel further forward.", pkimage: pkimage9)!
        
        let pkimage10 = UIImage(named: "wallflip")!
        let tutorial10 = Tutorial(title: "Wallflip", desc: "One step off a wall into a Backflip.", pkimage: pkimage10)!
        
        tutorials += [tutorial1, tutorial2, tutorial3, tutorial4, tutorial5, tutorial6, tutorial7, tutorial8, tutorial9, tutorial10]
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
