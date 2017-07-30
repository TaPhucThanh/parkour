//
//  ProfileViewController.swift
//  ParkourApp
//
//  Created by FOEIT on 23/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var profilePic: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Actions
    
    @IBAction func logout(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Logging out", message: "You're logged out successfully", preferredStyle: UIAlertControllerStyle.alert)
        
        let gotitAction = UIAlertAction(title: "Got it", style: UIAlertActionStyle.default, handler:  { action in self.performSegue(withIdentifier: "userLoggedOut", sender: self) } )
        
        alert.addAction(gotitAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }

}
