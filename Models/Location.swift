//
//  Location.swift
//  Dating
//
//  Created by Bohlale Manage on 2023/07/17.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
   
    
    //let id = UUID().uuidString
    let name: String
    let age: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let  imageNames: [String]
    
    var id: String {
        name + cityName
    }
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
