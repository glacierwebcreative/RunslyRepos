//
//  LoginViewController.swift
//  Runsly
//
//  Created by mr owner on 1/18/20.
//  Copyright © 2020 Glacier Web Creative. All rights reserved.
//
import UIKit
import Foundation

class LoginViewController: UIViewController {
    

    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func submit(_ sender: UIButton) {
        
        if (userName.text == "" || password.text == "") {
            let alertController = UIAlertController (title: "Oooops", message: "You must complete all fields",
                preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
    
    
        
        let url = URL(string: "https://runsly.pettee.net/members_db_activity.php")
        let session = URLSession.shared
        
        var request = URLRequest(url: url! )
        request.httpMethod = "POST"
        
        let postString = "user=\(userName.text!)&password=\(password.text!)"
        print ("postString", postString)
        
        let paramStringutf8 = postString.data(using: .utf8)
        
        let task = session.uploadTask(with: request, from: paramStringutf8)  {
            data, response, error in
            
            if error != nil {
                print (error.debugDescription)
            } else {
                //print("response = \(response)")                
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("responseString = \(responseString)")
                let string = responseString
                let hasSubstring = string?.contains("User found")
                
                if (hasSubstring == true) {
                    DispatchQueue.main.async {
                        let alertController = UIAlertController (title: "Found You!", message: "You are logged in", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default)
                        alertController.addAction(okAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                    
                }  //  "if (hasSubstring == true)
            }  //  "if error != nil"
            
        }  // "let task"
        
        task.resume()
        
        
        userName.text = ""
        password.text = ""
        
    }  //  "submit" button
    
    
}  //  class

    
    
    
    
    
    
    
    
    
    

