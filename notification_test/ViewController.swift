//
//  ViewController.swift
//  notification_test
//
//  Created by Chamaliun Corp on 08/01/2018.
//  Copyright © 2018 Chamaliun Corp. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){(sucess, error) in
            if error != nil{
                print("Authorization Unsuccessfull")
            }else{
                print("Authorization Successfull")
            }
        }
    }
    
    @IBAction func notifyPressed(_ sender: Any) {

        timedNotifications(inSeconds: 3){(success) in
            if success{
                print("Successfully Notified")
            }
        }

    }
    
    func timedNotifications(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()){
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = "Breaking News"
        content.subtitle = "Net Neutrality is not working"
        content.body = "aksjdfl;askj df;lasjkdfl;askdjfl;asdjkfal; sdk jfal;sdkjfal ;sdkfjals ;dkfjals;dfjk eiw;jfasdilfjas;dfji"
        
        let request = UNNotificationRequest(identifier: "customNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request){(error) in
            if error != nil{
                completion(false)
            }else{
                completion(true)
            }
        }
    }
    
}

