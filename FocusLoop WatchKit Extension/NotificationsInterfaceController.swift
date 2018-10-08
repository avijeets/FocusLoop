//
//  NotificationsInterfaceController.swift
//  FocusLoop WatchKit Extension
//
//  Created by Avijeet Sachdev on 10/2/18.
//  Copyright © 2018 Avijeet Sachdev. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications

class NotificationsInterfaceController: WKInterfaceController {

    @IBOutlet weak var timePicker: WKInterfacePicker!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        var items : [WKPickerItem] = []
        for hour in 1...24 {
            let pickerItem = WKPickerItem()
            if hour == 1 {
                pickerItem.title = "\(hour) hours"
            }
            else {
                pickerItem.title = "\(hour) hours"
            }
            items.append(pickerItem)
        }
        timePicker.setItems(items)
        
        if let delegate = WKExtension.shared().delegate as? ExtensionDelegate {
            delegate.notificationPermissions()
        }
    }

    @IBAction func startNotif() {
        let content = UNMutableNotificationContent()
        content.body = "Are you still productive?"
        content.categoryIdentifier = "focusedCategory"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: NSUUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add( request) { (error) in
            if error != nil {
                print("Error caught")
            }
            else {
                print("No error found")
            }
        }
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    @IBAction func pickerChanged(_ value: Int) {
    }
}
