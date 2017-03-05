//
//  LoginController.swift
//  Instragem
//
//  Created by Student on 27/02/2017.
//  Copyright © 2017 LuisCorp. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class LoginController: UIViewController {
    
    //let usernameKey = "test"
    //let passwordKey = "passwort"
    
    let MyKeychainWrapper = KeychainWrapper()
    let createLoginButtonTag = 0
    let loginButtonTag = 1
    
    @IBOutlet weak var loginButton: UIButton!
    
    
 
    
    @IBOutlet weak var txtUsername: UITextField!
    
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    var isGrantedNotificationAccess:Bool = false
    
    let center = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a
                let hasLogin = UserDefaults.standard.bool(forKey: "hasLoginKey")
        
        if hasLogin {
            loginButton.setTitle("Login", for: UIControlState.normal)
            loginButton.tag = loginButtonTag
        } else {
            loginButton.setTitle("Create", for: UIControlState.normal)
            loginButton.tag = createLoginButtonTag
        }
        
        if let storedUsername = UserDefaults.standard.value(forKey: "username") as? String {
            txtUsername.text = storedUsername as String
        }
        
        
        // Swift
        let options: UNAuthorizationOptions = [.alert, .sound];
        
        // Swift
        center.requestAuthorization(options: options) {
            (granted, error) in
            if !granted {
                print("Something went wrong")
            }
        }
        
        
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                // Notifications not allowed
            }
        }
        
        
        
    }
    override func viewDidLayoutSubviews() {
        if txtPassword.hasText {
            txtPassword.text = ""
        }

    }

    
    @IBAction func btnLogin(_ sender: AnyObject) {
        sendNotification()
        //username or password empty, display alert
        if (txtUsername.text == "" || txtPassword.text == "") {
            let alertView = UIAlertController(title: "Login Problem",
                                              message: "Wrong username or password." as String, preferredStyle:.alert)
            let okAction = UIAlertAction(title: "Foiled Again!", style: .default, handler: nil)
            alertView.addAction(okAction)
            self.present(alertView, animated: true, completion: nil)
            return;
        }
        
        //dismiss keyboard if visible
        txtUsername.resignFirstResponder()
        txtPassword.resignFirstResponder()
        
        //create new login
        if sender.tag == createLoginButtonTag {
        
            //new user?
            let hasLoginKey = UserDefaults.standard.bool(forKey: "hasLoginKey")
            if hasLoginKey == false {
                UserDefaults.standard.setValue(self.txtUsername.text, forKey: "username")
            }
        
            MyKeychainWrapper.mySetObject(txtPassword.text, forKey:kSecValueData)
            MyKeychainWrapper.writeToKeychain()
            UserDefaults.standard.set(true, forKey: "hasLoginKey")
            UserDefaults.standard.synchronize()
            loginButton.tag = loginButtonTag
            
            self.performSegue(withIdentifier: "showMainMenu", sender: self)
        }
            
        
        else if sender.tag == loginButtonTag {
            if (checkLogin(username: self.txtUsername.text!, password: self.txtPassword.text!)) {
                self.performSegue(withIdentifier: "showMainMenu", sender: self)
            }
            else {
                let alertView = UIAlertController(title: "Login Problem",
                                                  message: "Wrong username or password." as String, preferredStyle:.alert)
                let okAction = UIAlertAction(title: "Foiled Again!", style: .default, handler: nil)
                alertView.addAction(okAction)
                self.present(alertView, animated: true, completion: nil)
            }
        }
        
        
    }
    
    func checkLogin(username: String, password: String ) -> Bool {
        if password == MyKeychainWrapper.myObject(forKey: "v_Data") as? String &&
            username == UserDefaults.standard.value(forKey: "username") as? String {
            return true
        } else {
            return false
        }
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendNotification() {
        if isGrantedNotificationAccess {
            let content = UNMutableNotificationContent()
            content.title = "Don't forget"
            content.body = "Use Instragem"
            content.sound = UNNotificationSound.default()
            
            //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15,
             //                                               repeats: true)
            let date = Date(timeIntervalSinceNow: 3600)
            
            let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)

            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
            
            // Swift
            let identifier = "UYLLocalNotification"
            let request = UNNotificationRequest(identifier: identifier,
                                                content: content, trigger: trigger)
            center.add(request, withCompletionHandler: { (error) in
                if let error = error {
                    // Something went wrong
                }
            })
            
            // Swift
            let category = UNNotificationCategory(identifier: "UYLReminderCategory",
                                                  actions: [],
                                                  intentIdentifiers: [], options: [])
            
            center.setNotificationCategories([category])
            content.categoryIdentifier = "UYLReminderCategory"
            
        }
        
    }
    
}
