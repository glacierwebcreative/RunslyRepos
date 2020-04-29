//
//  RaceDetailViewController.swift
//  Runsly
//
//  Created by mr owner on 12/13/19.
//  Copyright © 2019 Glacier Web Creative. All rights reserved.
//

import UIKit

class RaceDetailViewController: UIViewController {

    @IBOutlet weak var raceName: UILabel!
    @IBOutlet weak var raceDate: UILabel!
    @IBOutlet weak var availableRaces: UILabel!
    @IBOutlet weak var raceCityState: UILabel!
    
    var race: Race?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    
    func setUI() {
        raceName.text = race?.raceName
        raceCityState.text = race?.raceCityState
        availableRaces.text = race?.availableRaces
        
    }
}
