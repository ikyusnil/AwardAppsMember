//
//  ViewController.swift
//  Award Apps
//
//  Created by Rizki Yusnil on 23/12/19.
//  Copyright © 2019 Rizki Yusnil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var textFieldEmail: UITextField!
    
    override func viewDidLoad() {
      super.viewDidLoad()
        settingTrans()
        setView()
        
    }
    
    @IBAction func toHome(_ sender: Any) {
        if isValidEmail(emailStr: textFieldEmail.text ?? ""){
            self.performSegue(withIdentifier: "toHome", sender: nil)
        } else {
            alertWithTitle(title: "Info", message: "Wrong email address", ViewController: self, toFocus: textFieldEmail)
        }
    }
    
}

extension ViewController {
    func setView() {
        textFieldEmail.delegate = self
        textFieldEmail.layer.borderColor = UIColor.black.cgColor
        btnLogin.layer.cornerRadius = 5
    }
    
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func alertWithTitle(title: String!, message: String, ViewController: UIViewController, toFocus:UITextField) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel,handler: {_ in
            toFocus.becomeFirstResponder()
        });
        alert.addAction(action)
        ViewController.present(alert, animated: true, completion:nil)
    }
    
    func settingTrans() {
        if #available(iOS 13.0, *) {
            if self.responds(to: #selector(getter: UIView.overrideUserInterfaceStyle)) {
                self.setValue(UIUserInterfaceStyle.light.rawValue, forKey: "overrideUserInterfaceStyle")
            }
        }
    }
}
