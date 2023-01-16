//
//  ViewController.swift
//  AlertProject
//
//  Created by Agah Özdemir on 15.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var password2Text: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupClicked(_ sender: Any) {
        
        //        let alert = UIAlertController(title: "Error!", message: "Some Errors", preferredStyle: UIAlertController.Style.alert)
        //
        //        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
        //
        //            print("Button Clicked")
        //
        //        }
        //
        //        if (usernameText.text == ""){
        //            alert.title = "Error"
        //            print("Username is nil")
        //            alert.message = "Username is nil"
        //        }
        //        else if (passwordText.text == ""){
        //            print("Password is nil")
        //            alert.title = "Error"
        //            alert.message = "Password is nil"
        //        }
        //        else if (password2Text.text == ""){
        //            print("Password2 is nil")
        //            alert.title = "Error"
        //            alert.message = "Password2 is nil"
        //        }
        //        else if (passwordText.text != password2Text.text){
        //            print("Password and password2 is not match")
        //            alert.title = "Error"
        //            alert.message = "Password2 does not match password, try again"
        //        }
        //        else{
        //            print("Success")
        //            alert.title = "Message"
        //            alert.message = "Sign Up is Success"
        //        }
        //
        //        alert.addAction(okButton)
        //        self.present(alert, animated: true)
        //    }
        
        
        
        if usernameText.text == "" {
            makeAlert(titleInput: "Error", messageInput: "Username not found")
        }
        else if passwordText.text == "" {
            makeAlert(titleInput: "Error", messageInput: "Password not found")
        }
        else if passwordText.text != password2Text.text {
            makeAlert(titleInput: "Error", messageInput: "Passwords do no match")
        }
        else{
            makeAlert(titleInput: "Success", messageInput: "User OK")
        }
    }
    
    
    func makeAlert(titleInput:String, messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.actionSheet)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
}



