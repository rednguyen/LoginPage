//
//  LoginViewController.swift
//  LoginPage
//
//  Created by Red Nguyen on 9/6/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var UserNameLogin: UITextField!
    @IBOutlet weak var UsernameLoginPassword: UITextField!
    @IBOutlet weak var Login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        // Do any additional setup after loading the view.
        Login.layer.cornerRadius = 10
        Login.clipsToBounds = true
    }
    
    
    @IBAction func login(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: self.UserNameLogin.text!, password: self.UsernameLoginPassword.text!) {
                  (user: PFUser?, error: Error?) -> Void in
                  if user != nil {
                    self.displayAlert(withTitle: "Login Successful", message: "")
                  } else {
                    self.displayAlert(withTitle: "Error", message: error!.localizedDescription)
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
