//
//  Location.swift
//  Utility
//
//  Created by Zhang, Wanming on 2/9/22.
//

import Foundation
import CoreLocation

func distanceStringBetween(location0: CLLocation, location1: CLLocation) -> String {
    let kOneMileInMeters = 1609.344
    let distanceInMeters = location0.distance(from: location1)
    let distanceInMiles = distanceInMeters / kOneMileInMeters;
    
    var distanceString = ""
    distanceString = "\((distanceInMiles * 10).rounded() / 10) mi"
    
    return distanceString
}
