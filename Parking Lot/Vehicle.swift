//
//  Vehicle.swift
//  Parking Lot
//
//  Created by Gökberk Köksoy on 23.01.2020.
//  Copyright © 2020 Gökberk Köksoy. All rights reserved.
//

import Foundation
class Vehicle {
    //MARK: -  PROPERTIES AND INITALIZATION
    private let plateNumber: String
    private let size: Int           // It can be only 1(motor), 2(car) or 4(truck).
    
    init(plateNumber: String, size: Int){
        self.plateNumber = plateNumber
        self.size = size
    }
    //MARK: - INFO METHODS
    func getPlateNumber() -> String {
        return self.plateNumber
    }
    
    func getSize() -> Int {
        return self.size
    }
    
    func getVehicleInfo() {
        print("Vehicle Info\nPlate Number: \(self.plateNumber)\nSize: \(self.size)\n")
    }
}


