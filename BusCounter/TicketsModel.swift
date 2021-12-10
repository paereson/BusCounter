//
//  TicketsModel.swift
//  BusCounter
//
//  Created by Michal Gruszkiewicz on 10/12/2021.
//

import Foundation

struct TicketModel: Codable, DefaultsService {
    static var keyName: String = "userTickets"
    
    var normalTicket: Int
    var quaterTicket: Int
    
    static func getTickets() -> TicketModel {
        if let tickets: TicketModel = TicketModel.read() {
            return tickets
        } else {
            let defaultModel = TicketModel(normalTicket: 0, quaterTicket: 0)
            defaultModel.save()
            return defaultModel
        }
    }
}
