//
//  ContentViewModel.swift
//  BusCounter
//
//  Created by Michal Gruszkiewicz on 09/12/2021.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    
    
    @Published var normalTickets: Int = 0 {
        didSet { calculateSavedMoney() }
    }
    
    @Published var quaterTickets: Int = 0 {
        didSet { calculateSavedMoney() }
    }
    
    @Published var savedMoney: Double = 0.0
    
    init() {
        let tickets = TicketModel.getTickets()
        normalTickets = tickets.normalTicket
        quaterTickets = tickets.quaterTicket
        calculateSavedMoney()
    }
    
    func addTicket(type: TicketType) {
        var defaults = TicketModel.getTickets()
        
        switch type {
        case .normal:
            defaults.normalTicket += 1
        case .quater:
            defaults.quaterTicket += 1
        }
        
        updateCurrentTickets(tickets: defaults)
        defaults.save()
    }
    
    func subtractTicket(type: TicketType) {
        var defaults = TicketModel.getTickets()
        
        switch type {
        case .normal:
            defaults.normalTicket -= 1
        case .quater:
            defaults.quaterTicket -= 1
        }
        
        updateCurrentTickets(tickets: defaults)
        defaults.save()
    }
    
    private func updateCurrentTickets(tickets: TicketModel) {
        normalTickets = tickets.normalTicket
        quaterTickets = tickets.quaterTicket
    }
    
    /// Calculate saved money value - change ticket price here if needed
    func calculateSavedMoney() {
        let normalTicketPrice = 4.6
        let quaterTicketPrice = 3.2
        
        savedMoney = (Double(normalTickets) * normalTicketPrice) + (Double(quaterTickets) * quaterTicketPrice)
    }
}
