//
//  ViewController.swift
//  LoginPage
//
//  Created by Red Nguyen on 9/3/21.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    @IBOutlet weak var TextView1: UITextView!
    @IBOutlet weak var Register: UIButton!
    @IBOutlet weak var Login: UIButton!
    @IBOutlet weak var Google: UIButton!
    @IBOutlet weak var Facebook: UIButton!
    @IBOutlet weak var UsernameSignUp: UITextField!
    @IBOutlet weak var UsernameSignUpPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .lightGray
        Google.layer.cornerRadius = 10
        Google.clipsToBounds = true
        Register.layer.cornerRadius = 10
        Register.clipsToBounds = true
        Facebook.layer.cornerRadius = 10
        Facebook.clipsToBounds = true
        let attributedString = NSMutableAttributedString(string: "By signing up you accept the Term of service and Privacy policy")
        attributedString.addAttribute(.link, value: "https://www.google.com", range: NSRange(location: 29, length: 15))
        attributedString.addAttribute(.link, value: "https://facebook.com", range: NSRange(location: 49, length: 14))
        TextView1.attributedText = attributedString
        TextView1.font = .systemFont(ofSize: 15)
        
        
    }

    
    @IBAction func Register(_ sender: Any) {
        let user = PFUser()
        user.username = self.UsernameSignUp.text
        user.password = self.UsernameSignUpPassword.text
        
        user.signUpInBackground {(succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                self.displayAlert(withTitle: "Error", message: error.localizedDescription)
            } else {
                self.displayAlert(withTitle: "Success", message: "Account has been successfully created")
            }
        }
    }
    
    func displayAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}

