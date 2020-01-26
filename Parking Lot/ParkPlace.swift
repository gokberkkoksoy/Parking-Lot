//
//  ParkPlace.swift
//  Parking Lot
//
//  Created by Gökberk Köksoy on 22.01.2020.
//  Copyright © 2020 Gökberk Köksoy. All rights reserved.
//

import Foundation
class ParkPlace {
    //MARK: - PROPERTIES AND INITIALIZATION
    private let size: Int        // Has the size of the vehicle parked.
    private let vehicle: Vehicle
    
    init(vehicle: Vehicle){
        self.vehicle = vehicle
        self.size = vehicle.getSize()
    }
    //MARK: - INFO METHODS
    func getSize() -> Int {
        return self.size
    }
    
    func getVehicle() -> Vehicle {
        return self.vehicle
    }
    
}
