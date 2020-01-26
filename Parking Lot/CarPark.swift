//
//  CarPark.swift
//  Parking Lot
//
//  Created by Gökberk Köksoy on 24.01.2020.
//  Copyright © 2020 Gökberk Köksoy. All rights reserved.
//

import Foundation

class CarPark {
    //MARK: - PROPERTIES AND INITIALIZATION
    private var capacity: Int              // Capacity of the parking lot.
    public var parkPlaceArray: [ParkPlace] // Contains the park places that are currently parked.
    public var ticketArray: [Ticket]       // Contains the tickets of the vehicles.
    private let hourlyPrice: Double        // 1 hour cost of parking.
    
    init(capacity: Int, hourlyPrice: Double) {
        self.capacity = capacity
        self.hourlyPrice = hourlyPrice
        self.ticketArray = [Ticket]()
        self.parkPlaceArray = [ParkPlace]()
    }
    //MARK: - INFO METHODS
    func getTotalIncome() -> Double {
        var totalIncome: Double = 0
        for ticket in ticketArray {
            totalIncome += ticket.calculatePrice(hourlyPrice: self.hourlyPrice, ticket.exitDate ?? ticket.getEntryDate())
        }
        return totalIncome
    }
    
    func printVehicleList() {
        for parkPlace in parkPlaceArray {
            parkPlace.getVehicle().getVehicleInfo()
        }
    }
    
    func printTickets() {
        for ticket in ticketArray {
            print("\(ticket.getTicketInfo())\n")
        }
    }
    //MARK: - PARK AND EXIT METHODS
    func parkVehicle(vehicle: Vehicle, entryDate: Date) {
        var currentCapacity = 0
        for parkPlace in parkPlaceArray {
            currentCapacity += parkPlace.getSize()
        }
        if currentCapacity + vehicle.getSize() > self.capacity {
            print("Car Park is Full!")
            
        } else {
            let parkPlace4Vehicle = ParkPlace(vehicle: vehicle) 
            parkPlaceArray.append(parkPlace4Vehicle)
            let ticket4Vehicle = Ticket(vehicle: vehicle, entryDate: entryDate)
            ticketArray.append(ticket4Vehicle)
            print("The vehicle with plate number: \(vehicle.getPlateNumber()) is parked.")
            
        }
    }
    
    func exitVehicle(ticket: Ticket, exitDate: Date)  {
        var exitIndex = -1
        for vehicleIndex in 0..<self.parkPlaceArray.count {
            if ticket.getVehicle().getPlateNumber() == parkPlaceArray[vehicleIndex].getVehicle().getPlateNumber() {
                exitIndex = vehicleIndex
            }
        }
        ticket.exitDate = exitDate
        print("The price for vehicle with \(ticket.getVehicle().getPlateNumber()) plate number is: \(ticket.calculatePrice(hourlyPrice: self.hourlyPrice, exitDate)) TLs")
        parkPlaceArray.remove(at: exitIndex)
    }
}
