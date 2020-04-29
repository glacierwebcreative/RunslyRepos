//
//  CategoriesViewController.swift
//  Runsly
//
//  Created by mr owner on 11/24/19.
//  Copyright © 2019 Glacier Web Creative. All rights reserved.
//


import UIKit

class CategoriesViewController: UIViewController {
    
    var raceCategory: Int? = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "RoadRaces") {
            let destinationViewController = segue.destination as! RacesListViewController
            destinationViewController.raceCategory = 1
        } else if (segue.identifier == "TrailRaces") {
            let destinationViewController = segue.destination as! RacesListViewController
            destinationViewController.raceCategory = 2
        } else {
            let destinationViewController = segue.destination as! RacesListViewController
            destinationViewController.raceCategory = 3
        }
    }
    

}
