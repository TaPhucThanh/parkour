//
//  MainTimelineViewController.swift
//  ParkourApp
//
//  Created by FOEIT on 23/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit

class MainTimelineViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    //Post
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var uploadMedia: UIImageView!

    
    // retrieve data
    var username = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the uer canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        uploadMedia.image = selectedImage
        
        // Dismiss the picker
        dismiss(animated: true, completion: nil)
        
        let data = UIImagePNGRepresentation(selectedImage)
        var i = 0
        if (isKeyPresentInUserDefaults(key: "uploadMediaKey\(i)") == false) {
            UserDefaults.standard.set(data, forKey: "uploadMediaKey\(i)")
        }
        else {
            i+=1
            UserDefaults.standard.set(data, forKey: "uploadMediaKey\(i)")
        }
        UserDefaults.standard.synchronize()
        
    }
    
    //MARK: Actions
    @IBAction func uploadImageButtonTapped(_ sender: UITapGestureRecognizer) {
        
        // Hide the keyboard
        postTextView.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func postButtonTapped(_ sender: UIButton) {
        
        let postText = postTextView.text!
        
        // Validation
        // Check for empty fields
        if (postText.isEmpty) {
            displayAlertMessage("Invalid post", alertMessage: "Missing required field(s)\nCheck if text box is empty")
        }
        
        // Send user data to server side
        else {
            let url = URL(string: "http://pkunite2.000webhostapp.com/uploadpost.php")
            var request = URLRequest(url: url!)
            request.httpMethod = "POST"
            
            let postString = "username=\(username)&postText=\(postText)"
            
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
        
        uploadMedia.image = UIImage(named: "uploadimage")
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    // Show Alert Message
    func displayAlertMessage (_ title:String, alertMessage:String) {
        
        let alert = UIAlertController(title: title, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let gotitAction = UIAlertAction(title: "Got it", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(gotitAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
