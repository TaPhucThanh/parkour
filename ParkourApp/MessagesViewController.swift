 //
//  MessagesViewController.swift
//  ParkourApp
//
//  Created by FOEIT on 23/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import Applozic

class MessagesViewController: UIViewController {
    
    // retrieve data
    var username = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*let alUser : ALUser =  ALUser();
        alUser.applicationId = ALChatManager.applicationId
        alUser.userId = "demoUserId"       // NOTE : +,*,? are not allowed chars in userId.
        alUser.email = "github@applozic.om"
        alUser.imageLink = ""    // User's profile image link.
        alUser.displayName = "DemoUserName"  // User's Display Name
        
        ALUserDefaultsHandler.setUserId(alUser.userId)
        ALUserDefaultsHandler.setEmailId(alUser.email)
        ALUserDefaultsHandler.setDisplayName(alUser.displayName)*/

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let chatManager: ALChatManager = ALChatManager(applicationKey: ALChatManager.applicationId as NSString)
        
        chatManager.launchChat(self)
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

}
