//
//  SignInVC.swift
//  chatApp
//
//  Created by akash savediya on 01/05/17.
//  Copyright © 2017 akash savediya. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    private let CONTACT_SEGUE = "ContactsSegue"
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    
    @IBOutlet weak var passwordTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        if AuthProvider.Instance.isLoggedIn() {
            self.performSegue(withIdentifier: self.CONTACT_SEGUE, sender: nil)
        }
    }
    
    
    
    @IBAction func login(_ sender: Any) {
        
        //performSegue(withIdentifier: CONTACT_SEGUE, sender: nil)
        
        
        if emailTextfield.text != "" && passwordTextfield.text != "" {
            
            AuthProvider.Instance.login(withEmail: emailTextfield.text!, password: passwordTextfield.text!, loginHandler: {(message) in
                
                if message != nil {
                    self.alertTheUser(title: "Problem with Authentication", message: message!)
                } else {
                    //print("Login Completed")
                    self.emailTextfield.text = ""
                    self.passwordTextfield.text = ""
                    
                    self.performSegue(withIdentifier: self.CONTACT_SEGUE, sender: nil)
                }
                
            })
            
        } else {
            alertTheUser(title: "Email And The Password Are Required", message: "Please Enter Email and Password")
        }
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        
        if emailTextfield.text != "" && passwordTextfield.text != "" {
            
            AuthProvider.Instance.signUp(withEmail: emailTextfield.text!, password: passwordTextfield.text!, loginHandler: {(message) in
                
                if message != nil {
                    
                    self.alertTheUser(title: "Problem with Creating A New User", message: message!)
                    
                } else {
                    self.emailTextfield.text = ""
                    self.passwordTextfield.text = ""
                    
                    self.performSegue(withIdentifier: self.CONTACT_SEGUE, sender: nil)
                }
            })
            
        } else {
            alertTheUser(title: "Email And Password Are Required", message: "Please SignUp")
        }
        

    
    }
    
    private func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil);
        alert.addAction(ok);
        present(alert, animated: true, completion: nil);
    }
    


}











