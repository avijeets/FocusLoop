//
//  ViewController.swift
//  FocusLoop
//
//  Created by Avijeet Sachdev on 9/29/18.
//  Copyright © 2018 Avijeet Sachdev. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        distractionTable.dataSource = self
        distractionTable.delegate = self
        getDistractions()
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "FocusInfo"), object: nil, queue: nil) { (notification) in
            DispatchQueue.main.async {
                self.getDistractions()
            }
        }
    }
    
    @IBOutlet weak var distractionTable: UITableView!
    var distractionArr: [Distractions] = []
    
    func getDistractions() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchReq = Distractions.fetchRequest() as NSFetchRequest<Distractions>
        fetchReq.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        
        do {
            distractionArr = try context.fetch(fetchReq) as [Distractions]
            print(distractionArr)
        }
        catch {}
        distractionTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return distractionArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let formatter = DateFormatter()
        let distractionItem = distractionArr[indexPath.row]
        formatter.dateFormat = "MMM d h:mma"
        cell.textLabel?.text = "\(distractionItem.name!) - \(formatter.string(from: distractionItem.date as! Date))"
        return cell
    }

}
