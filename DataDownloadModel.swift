//
//  DataDownloadModel.swift
//  Runsly
//
//  Created by mr owner on 1/11/20.
//  Copyright © 2020 Glacier Web Creative. All rights reserved.
//

import Foundation

protocol DataDownloadModelProtocol: class {
    func racesDownloaded(items: NSArray)
}



class DataDownloadModel: NSObject, URLSessionDataDelegate {
    
    weak var delegate: DataDownloadModelProtocol!
    var data = Data()
    
    
    
    
    
    // function "downloadRaces()"
    func downloadRaces(category: Int) {
        
        //print ("category", category)
        
        let category = String(category)
        
        let postData: NSDictionary = NSMutableDictionary()
        
        postData.setValue(category, forKey: "category")
        
        //print ("Post Data")
        //for (key, value) in postData {
            //print (key, value)
        //}
        
        
        let url = URL(string: "https://runsly.pettee.net/races_db_activity.php")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        
        var paramString = ""
        for (key, value) in postData {
            paramString = paramString + (key as! String) + "=" + (value as! String)
        }
        
        //print (paramString)
        let paramStringutf8 = paramString.data(using: .utf8)
        

        let task = URLSession.shared.uploadTask(with: request, from: paramStringutf8) {
            data, response, error in
            
            guard let _ :Data = data, let _ :URLResponse = response, error == nil else {
                print(response!)
                print("Failed to download data")
                return
            }
            
        
        self.parseJSON(data: data!)
            
        }
        
        
        task.resume()
    }
    
    
    
    // function "parseJSON()"
    func parseJSON(data: Data) {
        var jsonResult = NSArray()
        
        do {
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        } catch let error as NSError {
            print(error, "whoa")
        }
        
        var jsonElement = NSDictionary()
        let races = NSMutableArray()
        
        for i in 0 ..< jsonResult.count {
            jsonElement = jsonResult[i] as! NSDictionary
            //print ("Json Element", jsonElement)
            let race = Race()
            
            
            let id = jsonElement["id"] as? Int
            let raceName = jsonElement["race_name"] as? String
            let raceCategory = jsonElement["race_category"] as? Int
            let raceCityState = jsonElement["race_city_state"] as? String
            let availableRaces = jsonElement["available_races"] as? String
            let season = jsonElement["season"] as? String
            let month = jsonElement["month"] as? String
            let dayInMonth = jsonElement["day_in_month"] as? Int
            let directorOrganizer = jsonElement["director_organizer"] as? String
            let synopsis = jsonElement["synopsis"] as? String
            let raceWebsite = jsonElement["race_website"] as? String
            
            
            race.id = id
            race.raceName = raceName
            race.raceCategory = raceCategory
            race.raceCityState = raceCityState
            race.availableRaces = availableRaces
            race.season = season
            race.month = month
            race.dayInMonth = dayInMonth
            race.directorOrganizer = directorOrganizer
            race.synopsis = synopsis
            race.raceWebsite = raceWebsite
            
            
            print(race.description)
            
            races.add(race)
        }
        
        
        DispatchQueue.main.async(execute: { () -> Void in
            self.delegate.racesDownloaded(items: races)
        })
    
    }
    
}
    
    
    
    
    
        
























