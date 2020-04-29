//
//  Race.swift
//  Runsly
//
//  Created by Steve on 11/26/19.
//  Copyright © 2019 Glacier Web Creative. All rights reserved.
//

import Foundation

class Race: NSObject {
    
    //MARK: Properties /////////
    
    
    var id: Int?
    var raceName: String?
    var raceCategory: Int?
    var raceCityState: String?
    var availableRaces: String?
    var season: String?
    var month: String?
    var dayInMonth: Int?
    var directorOrganizer: String?
    var synopsis: String?
    var raceWebsite: String?
    
    
    
    //MARK: Initialization ////////
    
    override init() {
    }
    
    
    init(id: Int, raceName: String, raceCategory: Int, raceCityState: String, availableRaces: String, season: String,
        month: String, dayInMonth: Int, directorOrganizer: String, synopsis: String, raceWebsite: String) {
            self.id = id
            self.raceName = raceName
            self.raceCategory = raceCategory
            self.raceCityState = raceCityState
            self.availableRaces = availableRaces
            self.season = season
            self.month = month
            self.dayInMonth = dayInMonth
            self.directorOrganizer = directorOrganizer
            self.synopsis = synopsis
            self.raceWebsite = raceWebsite
    }
    
    
    // Prints objects current state
    override var description: String {
        
        
        return "Race Id: \(id), Race Name: \(raceName), Race Category: \(raceCategory), City and State: \(raceCityState), Available Races: \(availableRaces), Season: \(season), Month: \(month), Day In Month: \(dayInMonth), Director/Organizer: \(directorOrganizer), Synopsis: \(synopsis), Race Website: \(raceWebsite)"
    
    }
}
