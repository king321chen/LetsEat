//
//  LocationViewController.swift
//  LetsEat
//
//  Created by cobi321 on 2022/4/10.
//

import UIKit

class LocationViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    let manager = LocationDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.fetch()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.numberOfLocationItems()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        cell.textLabel?.text = manager.locationItem(at: indexPath.row)
        return cell
    }
}
 
