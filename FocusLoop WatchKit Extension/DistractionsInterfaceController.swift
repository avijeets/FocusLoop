//
//  DistractionsInterfaceController.swift
//  FocusLoop WatchKit Extension
//
//  Created by Avijeet Sachdev on 9/29/18.
//  Copyright © 2018 Avijeet Sachdev. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class DistractionsInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var distractionTable: WKInterfaceTable!
    
    // Coordinate with your distractions
    var distractions = ["Reddit", "Twitter", "YouTube", "Netflix", "PS4"]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        distractionTable.setNumberOfRows(distractions.count, withRowType: "distractionRow")
        for index in 0..<distractions.count {
            if let row = distractionTable.rowController(at: index) as? DistractionRowController {
                row.distractionLabel.setText(distractions[index])
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let distraction = distractions[rowIndex]
        let date = Date()
        WCSession.default.transferUserInfo(["date": date, "name": distraction])
    }

}
