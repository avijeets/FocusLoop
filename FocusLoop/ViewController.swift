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
    }
    
    @IBOutlet weak var distractionTable: UITableView!
    var distractionArr: [Distractions] = []
    
    func getDistractions() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchReq = Distractions.fetchRequest() as NSFetchRequest<Distractions>
        
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
        cell.textLabel?.text = distractionArr[indexPath.row].name
        return cell
    }

}
