//
//  SignupViewController.swift
//  ParkourApp
//
//  Created by FOEIT on 19/09/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmpasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func createButtonTapped(_ sender: AnyObject) {
        
        let username = usernameTextField.text!
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let confirmpassword = confirmpasswordTextField.text!
        
        // Validation
        // Check for empty fields
        if (username.isEmpty || email.isEmpty || password.isEmpty || confirmpassword.isEmpty) {
            displayAlertMessage("Error", alertMessage: "Missing required field(s)")
        }
            
            // Check if passwords match
        else if (password != confirmpassword) {
            displayAlertMessage("Passwords do not match", alertMessage: "Please enter the correct password")
        }
            
        else {
            // Send user data to server side
            let url = URL(string: "http://pkunite.000webhostapp.com/signup.php")
            var request = URLRequest(url: url!)
            request.httpMethod = "POST"
            
            let postString = "username=\(username)&email=\(email)&password=\(password)&confirmpassword=\(confirmpassword)"
            
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
                            let status:String! = parseJSON["status"] as! String
                            let message:String! = parseJSON["message"] as! String
                            self.displayAlertMessage(status, alertMessage: message)
                        }
                    }
                }
            }
            loadDataTask.resume()
        }
    }
    
    func displayAlertMessage(_ title:String, alertMessage:String) {
        
        let alert = UIAlertController(title: title, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        if title == "Welcome" {
            let gotitAction = UIAlertAction(title: "Got it", style: UIAlertActionStyle.default, handler:  { action in self.performSegue(withIdentifier: "segueToLogin", sender: self) } )
            
            alert.addAction(gotitAction)
        }
            
        else {
            let gotitAction = UIAlertAction(title: "Got it", style: UIAlertActionStyle.default, handler: nil)
            
            alert.addAction(gotitAction)
        }
        
        self.present(alert, animated: true, completion: nil)
        
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
