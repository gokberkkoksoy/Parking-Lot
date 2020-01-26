//
//  Ticket.swift
//  Parking Lot
//
//  Created by Gökberk Köksoy on 23.01.2020.
//  Copyright © 2020 Gökberk Köksoy. All rights reserved.
//

import Foundation

class Ticket {
    //MARK: - PROPERTIES AND INITIALIZATION
    private let vehicle: Vehicle
    private var entryDate: Date        // Entry date of the vehicle
    public var exitDate: Date?         // Exit date of the vehicle (if the vehicle is still in the parking lot, it is nil.)
    private var totalPrice: Double = 0
    public static var numberOfTickets: Int = 0
    
    init(vehicle: Vehicle, entryDate: Date){
        self.vehicle = vehicle
        self.entryDate = entryDate
        Ticket.self.numberOfTickets += 1
    }
    //MARK: - INFO METHODS
    func getVehicle() -> Vehicle {
        return self.vehicle
    }
    
    func getEntryDate() -> Date {
        return self.entryDate
    }
    
    func getExitDate() -> Date {
        return self.exitDate!
    }
    
    func getTicketInfo() -> String {
        let ticketInf = "Ticket Info\nPlate Number: \(self.vehicle.getPlateNumber())\nEntry: \(self.entryDate)"
        // If the car has exited from the park, ticket contains exit date and parking cost.
        if self.exitDate != nil {
            return "\(ticketInf)\nExit: \(self.exitDate!)\nHour: \(calculateInterval(entry: self.entryDate, exit: self.exitDate!))\nFee: \(self.totalPrice)"
        } else {
            return ticketInf
        }
    }
    //MARK: - CALCULATIONS
    func calculatePrice(hourlyPrice: Double, _ exitDate: Date) -> Double {  // It is calculated by (size of the car) * (hourly price) * (parking duration)
        self.totalPrice = hourlyPrice * Double(self.vehicle.getSize()) * calculateInterval(entry: self.entryDate, exit: exitDate)
        return totalPrice
    }
    
    func calculateInterval(entry: Date, exit: Date) -> Double {
        var hourInterval = Calendar.current.component(.hour, from: exit) - Calendar.current.component(.hour, from: entry)
        let minInterval = Calendar.current.component(.minute, from: exit) - Calendar.current.component(.minute, from: entry)
        if minInterval >= 30 {
            hourInterval += 1
        }
        return Double(hourInterval)
    }
}
