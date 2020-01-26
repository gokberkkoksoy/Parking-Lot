//
//  Vehicle.swift
//  Parking Lot
//
//  Created by Gökberk Köksoy on 22.01.2020.
//  Copyright © 2020 Gökberk Köksoy. All rights reserved.
//

import Foundation

let park = CarPark(capacity: 10, hourlyPrice: 5)

let hour: TimeInterval = 3600
let currentDate = Date()

let vehicle1 = Vehicle(plateNumber: "34cse31", size: 4)
let vehicle2 = Vehicle(plateNumber: "34cse32", size: 2)
let vehicle3 = Vehicle(plateNumber: "34cse33", size: 1)
let vehicle4 = Vehicle(plateNumber: "34cse34", size: 2)
let vehicle5 = Vehicle(plateNumber: "34cse35", size: 4)

park.parkVehicle(vehicle: vehicle1, entryDate: currentDate.addingTimeInterval(hour))
park.parkVehicle(vehicle: vehicle2, entryDate: currentDate.addingTimeInterval(hour*2))
park.parkVehicle(vehicle: vehicle3, entryDate: currentDate.addingTimeInterval(hour*3))
park.parkVehicle(vehicle: vehicle4, entryDate: currentDate.addingTimeInterval(hour*4))
park.parkVehicle(vehicle: vehicle5, entryDate: currentDate.addingTimeInterval(hour*5))

park.printVehicleList()

park.exitVehicle(ticket: park.ticketArray[1], exitDate: currentDate.addingTimeInterval(hour * 6))
park.exitVehicle(ticket: park.ticketArray[3], exitDate: currentDate.addingTimeInterval(hour * 6))

park.printVehicleList()

park.exitVehicle(ticket: park.ticketArray[0], exitDate: currentDate.addingTimeInterval(hour*7))
park.exitVehicle(ticket: park.ticketArray[2], exitDate: currentDate.addingTimeInterval(hour*7))

print(park.getTotalIncome())
print(Ticket.numberOfTickets)

park.printTickets()


