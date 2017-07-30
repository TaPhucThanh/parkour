//
//  SettingsViewController.swift
//  ParkourApp
//
//  Created by FOEIT on 30/07/2017.
//  Copyright © 2017 T. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
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
    
    @IBAction func saveChangesButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
    }

    @IBAction func changePasswordButtonTapped(_ sender: UIButton) {
    }
}
