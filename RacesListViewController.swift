//
//  RacesListViewController.swift
//  Runsly
//
//  Created by Steve on 12/4/19.
//  Copyright © 2019 Glacier Web Creative. All rights reserved.
//

import UIKit

class RacesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,
    DataDownloadModelProtocol {
    
    var feedItems: NSArray = NSArray()
    var selectedRace: Race = Race()
    
    @IBOutlet weak var tableView: UITableView!
    
    var races: [Race] = []
    
    @IBOutlet weak var categoryHeaderImage: UIImageView!
    
    var raceCategory: Int? 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // Set header image for race category
        //
        switch raceCategory! {
        case 1:
            categoryHeaderImage.image = #imageLiteral(resourceName: "road")
        case 2:
            categoryHeaderImage.image = #imageLiteral(resourceName: "trail")
        case 3:
            categoryHeaderImage.image = #imageLiteral(resourceName: "obstacle")
        default:
            print ("default case")
        }
        
        
        let dataDownloadModel = DataDownloadModel()
        dataDownloadModel.delegate = self
        dataDownloadModel.downloadRaces(category: raceCategory!)
        
        
    }
    
    
    func racesDownloaded(items: NSArray) {
        
        
        
        
        
        
        
        
        
        feedItems = items
        //print(items)
        self.tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RaceDetailSegue" {
            let destinationViewController = segue.destination as! RaceDetailViewController
            destinationViewController.race = sender as? Race
        }
    }
    


    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! RacesListCustomTableViewCell
        
        let item: Race = feedItems[indexPath.row] as! Race
        
        cell.raceName.text = item.raceName
        cell.raceCityState.text = item.raceCityState
        cell.availableRaces.text = item.availableRaces
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let race = feedItems[indexPath.row]
        performSegue(withIdentifier: "RaceDetailSegue", sender: race)
    }
    
}
