//
//  SettingsViewController.swift
//  ParkourApp
//
//  Created by FOEIT on 30/07/2017.
//  Copyright © 2017 T. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var usernameProfile: UIButton!
    //Update Profile
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    @IBOutlet weak var currentLocationTextField: UITextField!
    @IBOutlet weak var aboutTextField: UITextField!
    //Account Settings
    @IBOutlet weak var newUsernameTextField: UITextField!
    @IBOutlet weak var currentPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var retypeNewPasswordTextField: UITextField!
    
    // retrieve data
    var username = String()
    var password = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        usernameProfile.setTitle(username, for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the uer canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        profilePic.image = selectedImage
        
        // Dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
    
        // Hide the keyboard
        nameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        genderTextField.resignFirstResponder()
        hometownTextField.resignFirstResponder()
        currentLocationTextField.resignFirstResponder()
        aboutTextField.resignFirstResponder()
        newUsernameTextField.resignFirstResponder()
        currentPasswordTextField.resignFirstResponder()
        newPasswordTextField.resignFirstResponder()
        retypeNewPasswordTextField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func usernameButtonTapped(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 1
    }
    
    @IBAction func saveChangesButtonTapped(_ sender: UIButton) {
        
        let name = nameTextField.text!
        let age = ageTextField.text!
        let gender = genderTextField.text!
        let hometown = hometownTextField.text!
        let currentLocation = currentLocationTextField.text!
        let about = aboutTextField.text!
        
        // Validation
        // Check for empty fields
        if (name.isEmpty || age.isEmpty || gender.isEmpty || hometown.isEmpty || currentLocation.isEmpty || about.isEmpty) {
            displayAlertMessage("Error", alertMessage: "Missing required field(s)\nAll fields are required")
        }
        
        // Check if age is number
        else if Int(age) == nil {
            displayAlertMessage("Error", alertMessage: "Age should be a number")
        }
        
        // Send user data to server side - Save Changes
        else {
            let url = URL(string: "http://pkunite.000webhostapp.com/updateprofile.php")
            var request = URLRequest(url: url!)
            request.httpMethod = "POST"
            
            let postString = "username=\(username)&name=\(name)&age=\(age)&gender=\(gender)&hometown=\(hometown)&currentLocation=\(currentLocation)&about=\(about)"
            
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
                            let status:String = parseJSON["status"] as! String
                            let message:String = parseJSON["message"] as! String
                            self.displayAlertMessage(status, alertMessage: message)
                        }
                    }
                }
            }
            loadDataTask.resume()
        }
    }
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        
        let newusername = newUsernameTextField.text!
        
        // Validation
        // Check for empty fields
        if newusername.isEmpty {
            displayAlertMessage("Error", alertMessage: "Missing required field(s)")
        }
        
        // Send user data to server side - Confirm to Change Username
        else {
            let url = URL(string: "http://pkunite.000webhostapp.com/changeusername.php")
            var request = URLRequest(url: url!)
            request.httpMethod = "POST"
            
            let postString = "username=\(username)&newusername=\(newusername)"
            
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
                            let status:String = parseJSON["status"] as! String
                            let message:String = parseJSON["message"] as! String
                            self.displayAlertMessage(status, alertMessage: message)
                        }
                    }
                }
            }
            loadDataTask.resume()
        }
    }
    
    @IBAction func changePasswordButtonTapped(_ sender: UIButton) {
        
        let currentpassword = currentPasswordTextField.text!
        let newpassword = newPasswordTextField.text!
        let confirmpassword = retypeNewPasswordTextField.text!
        
        // Validation
        // Check for empty fields
        if (currentpassword.isEmpty || newpassword.isEmpty || confirmpassword.isEmpty) {
            displayAlertMessage("Error", alertMessage: "Missing required field(s)\nAll fields are required")
        }
            
        // Check if passwords match
        else if (currentpassword != password) {
            displayAlertMessage("Current passwords do not match", alertMessage: "Please enter the correct password")
        }
            
        else if (newpassword != confirmpassword) {
            displayAlertMessage("New passwords do not match", alertMessage: "Please enter the correct password")
        }
        
        // Send user data to server side - Change Password
        else {
            let url = URL(string: "http://pkunite.000webhostapp.com/changepassword.php")
            var request = URLRequest(url: url!)
            request.httpMethod = "POST"
            
            let postString = "username=\(username)&newpassword=\(newpassword)"
            
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
                            let status:String = parseJSON["status"] as! String
                            let message:String = parseJSON["message"] as! String
                            self.displayAlertMessage(status, alertMessage: message)
                        }
                    }
                }
            }
            loadDataTask.resume()
        }
    }
    
    // Show Alert Message
    func displayAlertMessage (_ title:String, alertMessage:String) {
        
        let alert = UIAlertController(title: title, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        if title == "Password has been changed successfully" {
            let gotitAction = UIAlertAction(title: "Got it", style: UIAlertActionStyle.default, handler:  { action in self.currentPasswordTextField.text = ""; self.newPasswordTextField.text = ""; self.retypeNewPasswordTextField.text = "" } )
            
            alert.addAction(gotitAction)
        }
            
        else {
            let gotitAction = UIAlertAction(title: "Got it", style: UIAlertActionStyle.default, handler: nil)
            
            alert.addAction(gotitAction)
        }
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
