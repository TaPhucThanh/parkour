//
//  ProfileViewController.swift
//  ParkourApp
//
//  Created by FOEIT on 23/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import Applozic

class ProfileViewController: UIViewController {
    
    //MARK: Properties
    //Profile
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    //User's Posts
    
    // retrieve data
    var username = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        usernameLabel.text = "(\(username))"
        loadUserProfile()
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
        
        let registerUserClientService: ALRegisterUserClientService = ALRegisterUserClientService()
        registerUserClientService.logout {
            
        }
        
    }
    
    
    func loadUserProfile() {
        
        let url = URL(string: "http://pkunite2.000webhostapp.com/getprofile.php")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let postString = "username=\(username)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
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
                        let name:String = parseJSON["name"] as! String
                        let age:String = parseJSON["age"] as! String
                        let gender:String = parseJSON["gender"] as! String
                        let hometown:String = parseJSON["hometown"] as! String
                        let currentLocation:String = parseJSON["currentLocation"] as! String
                        let about:String = parseJSON["about"] as! String
                        
                        if let imageData = UserDefaults.standard.object(forKey: "profilePicKey") as? Data {
                            let retrievedImage = UIImage(data: imageData)
                            self.profilePic.image = retrievedImage
                        }
                        
                        //self.profilePic.image = UIImage(named: self.username)
                        self.nameLabel.text = "🙂  \(name)"
                        self.ageLabel.text = "👶🏼  \(age)"
                        self.genderLabel.text = " ⚤  \(gender)"
                        self.hometownLabel.text = "🏘 \(hometown)"
                        self.currentLocationLabel.text = "📍 \(currentLocation)"
                        self.aboutLabel.text = "  ℹ︎   \(about)"
                    }
                }
            }
        }
        loadDataTask.resume()
    }
    
    // Show Alert Message
    func displayAlertMessage (_ title:String, alertMessage:String) {
        
        let alert = UIAlertController(title: title, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let gotitAction = UIAlertAction(title: "Got it", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(gotitAction)
        
        self.present(alert, animated: true, completion: nil)
    }

}


