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

    @IBOutlet weak var launchChatButton: UIButton!
    
    let chatManager: ALChatManager = ALChatManager(applicationKey: ALChatManager.applicationId as NSString)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        launchChatButton.layer.borderColor = UIColor(50, green: 50, blue: 200).cgColor
        launchChatButton.layer.borderWidth = 1.0
        launchChatButton.layer.cornerRadius = 3.0
        
        let name = tempFuncToGetUserProfile().name
        let email = tempFuncToGetUserProfile().email
        
        let alUser : ALUser =  ALUser();
        alUser.applicationId = ALChatManager.applicationId
        alUser.userId = name       // NOTE : +,*,? are not allowed chars in userId.
        alUser.email = email
        alUser.imageLink = ""    // User's profile image link.
        alUser.displayName = username  // User's Display Name
        
        ALUserDefaultsHandler.setUserId(alUser.userId)
        ALUserDefaultsHandler.setEmailId(alUser.email)
        ALUserDefaultsHandler.setDisplayName(alUser.displayName)
        
//        chatManager.launchChat(self)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapLaunchChatButton(_ sender: Any) {
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
    
    func tempFuncToGetUserProfile() -> (name:String, email:String) {
        let url = URL(string: "http://pkunite2.000webhostapp.com/tempgetprofile.php")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let postString = "username=\(username)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        var name = String()
        var email = String()
        
        let loadDataTask = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    print("Error> \(error)")
                }
                else {
                    guard let responseData = data
                        else {
                            print("Error: did not receive data")
                            return
                    }
                    
                    guard let json = try? JSONSerialization.jsonObject(with: responseData, options: []) else {
                        print("Error trying to convert data to JSON")
                        print("Parse error: \(String(describing: data))")
                        return
                    }
                    
                    if let parseJSON = json as? [String: AnyObject] {
                        name = parseJSON["name"] as! String
                        email = parseJSON["email"] as! String
                    }
                }
            }
        }
        loadDataTask.resume()
        return (name, email)
    }

}
