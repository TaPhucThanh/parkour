//
//  EventsViewController.swift
//  ParkourApp
//
//  Created by FOEIT on 16/08/2017.
//  Copyright © 2017 T. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var eventTextField: UITextField!
    @IBOutlet weak var dateTimeTextField: UITextField!
    @IBOutlet weak var venueTextField: UITextField!
    
    
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
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    //MARK: Actions
    @IBAction func addEventButtonTapped(_ sender: UIButton) {
        
        let event = eventTextField.text!
        let dateTime = dateTimeTextField.text!
        let venue = venueTextField.text!
        
        // Validation
        // Check for empty fields
        if (event.isEmpty || dateTime.isEmpty || venue.isEmpty) {
            displayAlertMessage("Error", alertMessage: "Missing required field(s)\nAll fields are required")
        }
        
        // Send user data to server side
        else {
            let url = URL(string: "http://pkunite2.000webhostapp.com/addevent.php")
            var request = URLRequest(url: url!)
            request.httpMethod = "POST"
            
            let postString = "event=\(event)&dateTime=\(dateTime)&venue=\(venue)"
            
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
        
        let gotitAction = UIAlertAction(title: "Got it", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(gotitAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
